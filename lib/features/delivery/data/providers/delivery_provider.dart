import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/delivery_repository.dart';
import 'package:tornadoes_app/core/providers/auth_provider.dart';

final deliveryRepositoryProvider = Provider((ref) => DeliveryRepository());

final pendingDeliveriesProvider = StreamProvider.autoDispose((ref) {
  return ref.watch(deliveryRepositoryProvider).getPendingDeliveriesStream();
});

final assignedDeliveriesProvider = StreamProvider.autoDispose((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    return const Stream.empty();
  }
  return ref.watch(deliveryRepositoryProvider).getAssignedDeliveriesStream(user.id);
});

final driverEarningsProvider = StreamProvider.autoDispose<double>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    return Stream.value(0.0);
  }
  return ref.watch(deliveryRepositoryProvider).getDriverEarningsStream(user.id);
});
