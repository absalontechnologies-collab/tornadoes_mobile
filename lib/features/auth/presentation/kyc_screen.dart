import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class KycScreen extends StatelessWidget {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF2D3435) : const Color(0xFF4A4A4A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('Tornadoes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Level Badge
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text('NIVEAU 1', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Divider(color: Colors.grey.withOpacity(0.2))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Header
                  const Text('Vérification d\'identité', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
                  const SizedBox(height: 8),
                  const Text(
                    'Veuillez fournir une photo claire de votre Carte Nationale d\'Identité pour débloquer les limites de transaction de base.',
                    style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 32),
                  
                  // Capture Grid
                  Row(
                    children: [
                      Expanded(child: _buildCaptureZone('RECTO DE LA CARTE', theme)),
                      const SizedBox(width: 16),
                      Expanded(child: _buildCaptureZone('VERSO DE LA CARTE', theme)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // Instructions Section
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('INSTRUCTIONS DE CAPTURE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.5)),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Icon(Icons.light_mode, color: theme.primaryColor),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Éclairage', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Text('Évitez les reflets directs et les ombres portées.', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.crop_free, color: theme.primaryColor),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Cadrage', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Text('La carte doit remplir tout le cadre de capture.', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.visibility, color: theme.primaryColor),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Lisibilité', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                  Text('Tous les textes et la photo doivent être nets.', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Security Info Toast-like
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                      border: const Border(left: BorderSide(color: Color(0xFF5F5E5E), width: 4)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.verified_user, color: Color(0xFF5F5E5E)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('SÉCURITÉ DES DONNÉES', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.0)),
                              const SizedBox(height: 4),
                              Text('Vos documents sont cryptés de bout en bout et traités conformément aux normes de protection RGPD.', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  
                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // After KYC, normally navigate to the main application via root
                        context.go('/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Soumettre pour vérification', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100), // padding for bottom nav if necessary
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCaptureZone(String label, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF5F5E5E), letterSpacing: 1.0)),
        const SizedBox(height: 8),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withOpacity(0.3), style: BorderStyle.solid, width: 2), // Dashed borders need custom painters in flutter, using solid for now
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.photo_camera, size: 32, color: Colors.grey),
                SizedBox(height: 8),
                Text('Cliquer pour capturer', style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
