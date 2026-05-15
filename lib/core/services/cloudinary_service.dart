import 'package:cloudinary_url_gen/cloudinary.dart';
import '../config/env.dart';

class CloudinaryService {
  static late final Cloudinary _cloudinary;

  static void initialize() {
    _cloudinary = Cloudinary.fromCloudName(cloudName: Env.cloudinaryCloudName);
  }

  static Cloudinary get instance => _cloudinary;

  /// Simule un upload vers Cloudinary.
  /// Pour la production, nécessitera les packages `image_picker` et `http` 
  /// ainsi qu'un upload preset configuré sur Cloudinary.
  static Future<String> uploadImage(String filePath) async {
    // Simuler le délai d'upload réseau
    await Future.delayed(const Duration(seconds: 1));
    
    // Retourne une URL mock pour la démonstration
    return 'https://lh3.googleusercontent.com/aida-public/AB6AXuDFrhAFzl7PFkbztb0RVyGYtYRm9QDP-iBGvIwxkjepUy_sACBDbXWs8iqWpXGTOmcTUiLioQAyuLatgvUQWBGGN8pfoQygk4-tgn0bKtUXaa6FVsGkY2xphsLxhrTGUwql_GDu4N6tPHz9cajKw5x7kdumlPQvZDAryedIuJbkhUfmsi2-YjxjgzBNstk9IM_7AFj1FM-Vhyqe_932MlOXFbFFv2ABO-vvIFLGaeClVJ0E3DD8Gs5fbXvP1cGkqNEEoGkdC8gPcDhL';
  }
}
