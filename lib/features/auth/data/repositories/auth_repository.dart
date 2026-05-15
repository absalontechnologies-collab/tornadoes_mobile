import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tornadoes_app/core/services/supabase_service.dart';

class AuthRepository {
  final _client = SupabaseService.client;

  Future<bool> signInWithPhone(String phone) async {
    try {
      await _client.auth.signInWithOtp(
        phone: phone,
      );
      return true;
    } catch (e) {
      print('OTP Send Error: $e');
      return false;
    }
  }

  Future<bool> verifyOTP(String phone, String token) async {
    try {
      final AuthResponse res = await _client.auth.verifyOTP(
        type: OtpType.sms,
        token: token,
        phone: phone,
      );
      return res.session != null;
    } catch (e) {
      print('OTP Verify Error: $e');
      return false;
    }
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  User? getCurrentUser() {
    return _client.auth.currentUser;
  }
}
