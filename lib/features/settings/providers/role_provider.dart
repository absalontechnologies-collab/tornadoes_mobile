import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/auth_provider.dart';
import '../data/repositories/role_repository.dart';

final roleRepositoryProvider = Provider<RoleRepository>((ref) {
  return RoleRepository();
});

final userRolesProvider = FutureProvider<List<String>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  
  final repo = ref.watch(roleRepositoryProvider);
  return await repo.getUserRoles(user.id);
});

final pendingRoleRequestsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final user = ref.watch(currentUserProvider);
  if (user == null) return [];
  
  final repo = ref.watch(roleRepositoryProvider);
  return await repo.getPendingRequests(user.id);
});
