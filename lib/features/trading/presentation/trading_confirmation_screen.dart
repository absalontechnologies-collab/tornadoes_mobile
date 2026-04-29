import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TradingConfirmationScreen extends StatelessWidget {
  const TradingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: isDark ? Colors.white : Colors.black),
          onPressed: () => context.go('/trading-dashboard'),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Animation Area
              Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: theme.primaryColor.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10))],
                    ),
                    child: const Icon(Icons.check_circle_outline, color: Colors.white, size: 48),
                  ),
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Success Message
              const Text(
                'Votre actif est désormais en vente',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, height: 1.2),
              ),
              const SizedBox(height: 16),
              Text(
                'L\'ordre a été placé avec succès sur le marché. Votre actif est maintenant visible par les acheteurs potentiels.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
              ),
              
              const SizedBox(height: 48),
              
              // Confirmation Details Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 4))],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ACTIF TRADING', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                        Text('Gold / XAU', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Prix de vente fixé', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            const SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                const Text('1 250 500', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                                const SizedBox(width: 4),
                                Text('FCFA', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                              ],
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            children: [
                              Icon(Icons.trending_up, size: 14, color: theme.primaryColor),
                              const SizedBox(width: 4),
                              Text('DANS LA FOURCHETTE', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Visual Range Indicator
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1 245 000 FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                            Text('1 255 000 FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 6,
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(3)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 200, // Hardcoded for aesthetics
                              height: 6,
                              decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(3)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 48),
              
              // CTA Actions
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/trading-dashboard'),
                  icon: const Icon(Icons.dashboard, color: Colors.white),
                  label: const Text('Voir mon dashboard trader', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('Détails de l\'ordre', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
