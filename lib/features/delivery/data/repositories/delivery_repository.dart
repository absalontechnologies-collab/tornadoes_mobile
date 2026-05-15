import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tornadoes_app/core/services/supabase_service.dart';

class DeliveryRepository {
  final _client = SupabaseService.client;

  Future<int?> getDriverId(String userId) async {
    try {
      final response = await _client
          .from('drivers')
          .select('id')
          .eq('user_id', userId)
          .maybeSingle();
      if (response != null) {
        return response['id'] as int;
      }
      return null;
    } catch (e) {
      print('Error fetching driver ID: $e');
      return null;
    }
  }

  // Stream of pending deliveries from deliveries table
  Stream<List<Map<String, dynamic>>> getPendingDeliveriesStream() {
    return _client
        .from('deliveries')
        .stream(primaryKey: ['id'])
        .eq('status', 'PENDING')
        .order('created_at', ascending: false);
  }

  // Stream of assigned deliveries for a specific driver
  Stream<List<Map<String, dynamic>>> getAssignedDeliveriesStream(String userId) async* {
    final driverId = await getDriverId(userId);
    if (driverId == null) {
      yield [];
      return;
    }

    yield* _client
        .from('deliveries')
        .stream(primaryKey: ['id'])
        .eq('driver_id', driverId)
        .order('created_at', ascending: false);
  }

  // Update order status and optionally assign delivery person
  Future<bool> takeDelivery(int deliveryId, String userId) async {
    try {
      final driverId = await getDriverId(userId);
      if (driverId == null) throw Exception('Driver profile not found.');

      await _client.from('deliveries').update({
        'status': 'ASSIGNED',
        'driver_id': driverId,
      }).eq('id', deliveryId);

      return true;
    } catch (e) {
      print('Error assigning delivery: $e');
      return false;
    }
  }

  // Update delivery status (e.g., to DELIVERED)
  Future<bool> updateDeliveryStatus(int deliveryId, String status) async {
    try {
      await _client.from('deliveries').update({
        'status': status,
      }).eq('id', deliveryId);
      return true;
    } catch (e) {
      print('Error updating delivery status: $e');
      return false;
    }
  }

  // Stream total earnings for a driver
  Stream<double> getDriverEarningsStream(String userId) async* {
    final driverId = await getDriverId(userId);
    if (driverId == null) {
      yield 0.0;
      return;
    }

    yield* _client
        .from('deliveries')
        .stream(primaryKey: ['id'])
        .eq('driver_id', driverId)
        .map((deliveries) {
      return deliveries
          .where((d) => d['status'] == 'DELIVERED')
          .fold<double>(
        0.0,
        (sum, delivery) => sum + (double.tryParse(delivery['fee']?.toString() ?? '0') ?? 0.0),
      );
    });
  }

  // Update GPS tracking (Mock implementation, could be a separate table 'delivery_tracking')
  Future<void> updateLocation(int driverId, double lat, double lng) async {
    try {
      await _client.from('drivers').update({
        'current_location': {'lat': lat, 'lng': lng}
      }).eq('id', driverId);
    } catch (e) {
      print('Error updating location: $e');
    }
  }
}
