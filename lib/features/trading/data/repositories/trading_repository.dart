import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tornadoes_app/core/services/supabase_service.dart';

class TradingRepository {
  final _client = SupabaseService.client;

  Stream<List<Map<String, dynamic>>> getActiveTradingSessions() {
    return _client
        .from('trading_sessions')
        .stream(primaryKey: ['id'])
        .eq('status', 'IN_TRANSIT_TRADING');
  }

  Future<List<Map<String, dynamic>>> getTradingPlans() async {
    try {
      final response = await _client.from('trading_plans').select();
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      print('Error fetching trading plans: $e');
      // Fallback codé en dur comme demandé
      return [
        {
          'id': '1',
          'title': 'Essentiel Sahel',
          'subtitle': 'Première nécessité en transit.',
          'price': '50000',
          'return_rate': '+8%',
          'duration_days': 30,
          'level': 'Niveau 1',
          'is_featured': false,
        },
        {
          'id': '2',
          'title': 'Croissance Plus',
          'subtitle': 'Textiles et matériel importé.',
          'price': '250000',
          'return_rate': '+15%',
          'duration_days': 60,
          'level': 'Niveau 2',
          'is_featured': true,
        },
        {
          'id': '3',
          'title': 'Expert Hub',
          'subtitle': 'Portefeuille diversifié.',
          'price': '1000000',
          'return_rate': '+22%',
          'duration_days': 90,
          'level': 'Niveau 3',
          'is_featured': false,
        },
      ];
    }
  }

  Stream<Map<String, dynamic>?> getSessionDetails(String sessionId) {
    return _client
        .from('trading_sessions')
        .stream(primaryKey: ['id'])
        .eq('id', sessionId)
        .map((events) => events.isNotEmpty ? events.first : null);
  }

  Future<bool> buyTradingRight(String sessionId, double purchasePrice, String newOwnerId) async {
    try {
      // Simulate RPC or update for buying trading rights
      await _client.from('trading_sessions').update({
        'current_owner_id': newOwnerId,
        'current_price': purchasePrice,
      }).eq('id', sessionId);
      return true;
    } catch (e) {
      print('Error buying trading right: $e');
      return false;
    }
  }

  Future<void> sellTradingRight(String sessionId, double newPrice) async {
    try {
      await _client.from('trading_sessions').update({
        'current_price': newPrice
      }).eq('id', sessionId);
    } catch (e) {
      print('Error updating selling price: $e');
    }
  }

  Future<void> ejectSession(String sessionId) async {
    try {
      await _client.from('trading_sessions').update({
        'status': 'EXPIRED'
      }).eq('id', sessionId);
    } catch (e) {
      print('Error ejecting session: $e');
    }
  }
}
