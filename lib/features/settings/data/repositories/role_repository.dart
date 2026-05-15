import 'package:supabase_flutter/supabase_flutter.dart';

class RoleRepository {
  final SupabaseClient _client = Supabase.instance.client;

  // Récupérer les rôles de l'utilisateur (via une table user_roles ou les métadonnées)
  Future<List<String>> getUserRoles(String userId) async {
    try {
      final response = await _client
          .from('user_roles')
          .select('role')
          .eq('user_id', userId);
      
      return (response as List).map((e) => e['role'] as String).toList();
    } catch (e) {
      // Fallback to user metadata if table doesn't exist
      try {
        final user = _client.auth.currentUser;
        if (user != null && user.userMetadata != null) {
          final roles = user.userMetadata!['roles'] as List?;
          if (roles != null) {
            return roles.map((e) => e.toString()).toList();
          }
        }
      } catch (_) {}
      return [];
    }
  }

  // Soumettre une demande de rôle
  Future<void> submitRoleRequest({
    required String userId,
    required String roleRequested,
    required String reason,
    Map<String, dynamic>? additionalData,
  }) async {
    await _client.from('role_requests').insert({
      'user_id': userId,
      'role_requested': roleRequested,
      'reason': reason,
      'additional_data': additionalData ?? {},
      'status': 'pending',
    });
  }

  // Récupérer les demandes en attente
  Future<List<Map<String, dynamic>>> getPendingRequests(String userId) async {
    try {
      final response = await _client
          .from('role_requests')
          .select()
          .eq('user_id', userId)
          .eq('status', 'pending');
      
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      return [];
    }
  }
}
