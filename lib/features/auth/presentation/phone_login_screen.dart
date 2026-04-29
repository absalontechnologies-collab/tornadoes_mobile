import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({super.key});

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
        title: const Text('Connexion', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 384,
              height: 384,
              decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.05), shape: BoxShape.circle),
            ),
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  
                  // Image
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBXE7U37oiq85e_CiyNhLdKDzwV_WeWQaBplsPOVVVIorJhSEQJNP91PiBrVOmkcL3E8sFIy5qLAnw4c5JdoePIGYDUVbEgAU3x6JXyxS4vf2trAC8NkeU0Cy2tX8vlk477NX3jn8LlAHIpDgexxuJRWPM6sH20_0uYAPsmTyaztFSjcUtWf-MXqFtpoOIZwkR_SzRd0AkIbVXjk52iLpLFh_g3Kx38d0q7V-KJBrKkN-yakfHCJ67f3VrTlYoM9bhzYQlLhGXiSPS0'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Text
                  const Text('Bienvenue sur Tornadoes', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
                  const SizedBox(height: 8),
                  const Text('Saisissez votre numéro de téléphone pour continuer l\'aventure.', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  
                  const SizedBox(height: 32),
                  
                  // Phone Input
                  const Text('NUMÉRO DE TÉLÉPHONE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 2.0)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                        alignment: Alignment.center,
                        child: const Row(
                          children: [
                            Text('🇸🇳 +221', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            SizedBox(width: 8),
                            Icon(Icons.expand_more, color: Colors.grey),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: const TextField(
                            keyboardType: TextInputType.phone,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              hintText: '77 000 00 00',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Mock sending OTP and navigating
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Code envoyé! Vérifiez vos messages.')),
                        );
                        context.push('/otp');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Continuer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Footer
                  Center(
                    child: Column(
                      children: [
                        const Text('En continuant, vous acceptez nos', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const Text('Conditions d\'utilisation', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Container(width: 32, height: 4, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(2))),
                        const SizedBox(height: 16),
                        const Text('BESOIN D\'AIDE ?', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 2.0)),
                        const SizedBox(height: 24),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
