import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/trading_repository.dart';

final tradingRepositoryProvider = Provider<TradingRepository>((ref) {
  return TradingRepository();
});

final tradingPlansProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final repo = ref.watch(tradingRepositoryProvider);
  return await repo.getTradingPlans();
});

final activeTradingSessionsProvider = StreamProvider<List<Map<String, dynamic>>>((ref) {
  final repo = ref.watch(tradingRepositoryProvider);
  return repo.getActiveTradingSessions();
});
