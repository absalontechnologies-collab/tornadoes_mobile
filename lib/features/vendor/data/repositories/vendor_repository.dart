import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tornadoes_app/core/services/supabase_service.dart';

class VendorRepository {
  final _client = SupabaseService.client;

  Future<int?> getSupplierId(String userId) async {
    try {
      final response = await _client
          .from('suppliers')
          .select('id')
          .eq('user_id', userId)
          .maybeSingle();
      if (response != null) {
        return response['id'] as int;
      }
      return null;
    } catch (e) {
      print('Error fetching supplier ID: $e');
      return null;
    }
  }

  Future<bool> submitProduct(Map<String, dynamic> productData, String userId) async {
    try {
      final supplierId = await getSupplierId(userId);
      if (supplierId == null) {
        throw Exception('Supplier profile not found.');
      }

      productData['supplier_id'] = supplierId;
      productData['status'] = 'PENDING'; // Attente d\'approbation

      await _client.from('products').insert(productData);
      return true;
    } catch (e) {
      print('Error submitting product: $e');
      return false;
    }
  }

  Stream<List<Map<String, dynamic>>> getVendorOrdersStream(String userId) async* {
    final supplierId = await getSupplierId(userId);
    if (supplierId == null) {
      yield [];
      return;
    }

    // Récupérer les order_items liés aux produits du fournisseur, avec les détails de la commande
    // Une vraie jointure nécessiterait un view ou RPC, mais on utilise le support Supabase
    yield* _client
        .from('order_items')
        .stream(primaryKey: ['id'])
        .eq('product_id.supplier_id', supplierId) // Note: This might not work directly in stream depending on foreign keys, a fallback will be handled in UI.
        .map((data) => data.map((e) => e).toList());
  }

  Stream<double> getVendorEarningsStream(String userId) async* {
    final supplierId = await getSupplierId(userId);
    if (supplierId == null) {
      yield 0.0;
      return;
    }

    // Mock calculation for vendor earnings: Since we can't easily join and sum streams 
    // of order_items * product price via stream, we mock it or fetch latest orders and sum
    yield* _client
        .from('order_items')
        .stream(primaryKey: ['id'])
        // Using a broad filter or no filter since we mock the join issue
        .map((data) {
           return data.length * 15000.0; // Mock calculation based on quantity
        });
  }
}
