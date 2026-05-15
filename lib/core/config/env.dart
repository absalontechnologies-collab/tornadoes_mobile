import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  
  static String get cloudinaryCloudName => dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
  
  static String get pusherAppId => dotenv.env['PUSHER_APP_ID'] ?? '';
  static String get pusherAppKey => dotenv.env['PUSHER_APP_KEY'] ?? '';
  static String get pusherAppSecret => dotenv.env['PUSHER_APP_SECRET'] ?? '';
  static String get pusherAppCluster => dotenv.env['PUSHER_APP_CLUSTER'] ?? '';
}
