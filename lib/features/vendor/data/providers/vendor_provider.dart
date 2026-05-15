import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/vendor_repository.dart';
import 'package:tornadoes_app/core/providers/auth_provider.dart';

final vendorRepositoryProvider = Provider((ref) => VendorRepository());

final vendorOrdersStreamProvider = StreamProvider.autoDispose((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    return const Stream.empty();
  }
  return ref.watch(vendorRepositoryProvider).getVendorOrdersStream(user.id);
});

final vendorEarningsStreamProvider = StreamProvider.autoDispose<double>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) {
    return Stream.value(0.0);
  }
  return ref.watch(vendorRepositoryProvider).getVendorEarningsStream(user.id);
});
