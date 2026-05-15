import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tornadoes_app/core/services/supabase_service.dart';

class OrderRepository {
  final _client = SupabaseService.client;

  Future<String?> createOrder(Map<String, dynamic> orderData, List<Map<String, dynamic>> items) async {
    try {
      // Insertion de la commande
      final orderResponse = await _client.from('orders').insert(orderData).select().single();
      final orderId = orderResponse['id'];

      // Insertion des items liés
      for (var item in items) {
        item['order_id'] = orderId;
      }
      await _client.from('order_items').insert(items);

      return orderId;
    } catch (e) {
      print('Error creating order: $e');
      return null;
    }
  }

  Stream<List<Map<String, dynamic>>> getVendorOrdersStream(String supplierId) {
    return _client
        .from('orders')
        .stream(primaryKey: ['id'])
        .eq('supplier_id', supplierId)
        .order('created_at', ascending: false);
  }
  
  Future<void> updateOrderStatus(String orderId, String status) async {
    await _client.from('orders').update({'status': status}).eq('id', orderId);
  }
}
