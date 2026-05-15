import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tornadoes_app/core/services/supabase_service.dart';

class ProductRepository {
  final _client = SupabaseService.client;

  Stream<List<Map<String, dynamic>>> getProductsStream({String? sectorId}) {
    return _client
        .from('products')
        .stream(primaryKey: ['id']);
  }

  Future<bool> addProduct(Map<String, dynamic> productData) async {
    try {
      await _client.from('products').insert(productData);
      return true;
    } catch (e) {
      print('Error adding product: $e');
      return false;
    }
  }
}
