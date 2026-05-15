import 'package:tornadoes_app/core/services/supabase_service.dart';

class SectorRepository {
  final _client = SupabaseService.client;

  Future<List<Map<String, dynamic>>> getSectors() async {
    try {
      final response = await _client.from('sectors').select().eq('is_active', true);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error fetching sectors: $e');
      return [];
    }
  }
}
