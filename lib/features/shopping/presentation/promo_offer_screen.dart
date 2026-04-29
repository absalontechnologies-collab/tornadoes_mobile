import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PromoOfferScreen extends StatelessWidget {
  const PromoOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('SUPERAPP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 2.0)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero
            SizedBox(
              height: 574,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                     imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDR70LsbEyOb_EznB9vgxlUpFqSO9N_26lQ6VQhqA7DE_5S-k3QqHQaxJ-0393SB-2wADdWClW1Et8iBCir8rsEJjslUXwLvqpd38dU1nafMY9psk229NVM-axUyH6KqXCgoG8bJoimJx-lmyS8nWhVbvYC5LdQN20bwsjXWzf9rl_KsxFO1XiiZLL1QNJkw3Jk1xB_FaYThhm7sc5UY6kVMMrOePM-hLHMS99WLUzjR5zkIndmVRfBLCx0uiYnVgKtMSYjjnKEzwkU',
                     fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black54, Colors.black26, Colors.black87],
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 64,
                    left: 24,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.white.withOpacity(0.3)),
                          ),
                          child: const Text('EXCLUSIVITÉ APPLICATION', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                        ),
                        const SizedBox(height: 24),
                        const Text('Livraison offerte', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w800, color: Colors.white, height: 1.1, letterSpacing: -1.0)),
                        Text('sur vos 3 premières commandes', style: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.8), fontStyle: FontStyle.italic)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
            // Content Card
            Transform.translate(
              offset: const Offset(0, -32),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 40, offset: const Offset(0, -20)),
                  ]
                ),
                child: Column(
                  children: [
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('01. Rapidité', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: theme.primaryColor)),
                                const SizedBox(height: 8),
                                const Text('Profitez d\'un service premium sans frais logistiques. Nous livrons en moins de 30 minutes partout en ville.', style: TextStyle(color: Colors.grey, height: 1.5)),
                                const SizedBox(height: 24),
                                Text('02. Qualité', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: theme.primaryColor)),
                                const SizedBox(height: 8),
                                const Text('Une sélection rigoureuse des meilleurs partenaires locaux pour une expérience irréprochable.', style: TextStyle(color: Colors.grey, height: 1.5)),
                              ],
                            ),
                          )
                       ],
                     ),
                     const SizedBox(height: 48),
                     
                     // CTA
                     SizedBox(
                       width: double.infinity,
                       height: 64,
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: theme.primaryColor,
                           elevation: 10,
                           shadowColor: theme.primaryColor.withOpacity(0.5),
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                         ),
                         child: const Text('Profiter maintenant', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                       ),
                     ),
                     const SizedBox(height: 16),
                     const Text('OFFRE SOUMISE À CONDITIONS • VALABLE 30 JOURS', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                     
                     const SizedBox(height: 64),
                     
                     // Grid
                     GridView.count(
                        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 3.5,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                           _buildBento(theme, Icons.restaurant, 'Restauration', 'Les meilleures tables chez vous.'),
                           _buildBento(theme, Icons.shopping_bag, 'Courses', 'Vos essentiels du quotidien.'),
                           _buildBento(theme, Icons.local_shipping, 'Colis', 'Envoi et réception simplifiés.'),
                        ],
                     )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  Widget _buildBento(ThemeData theme, IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: theme.primaryColor),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
