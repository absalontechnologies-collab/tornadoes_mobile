import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TradingTransitListScreen extends StatelessWidget {
  const TradingTransitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF2D3435) : const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('Tornadoes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('TRADING EN TRANSIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                        const SizedBox(height: 8),
                        const Text('Livraison #TR-8829', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                        const SizedBox(height: 8),
                        Text('Suivi de la chaîne de propriété en temps réel pour le fret en cours d\'acheminement.', style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.5)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Prix d\'achat initial', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey)),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('1 250 000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                            const SizedBox(width: 4),
                            const Text('FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Map Preview
              Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDFrhAFzl7PFkbztb0RVyGYtYRm9QDP-iBGvIwxkjepUy_sACBDbXWs8iqWpXGTOmcTUiLioQAyuLatgvUQWBGGN8pfoQygk4-tgn0bKtUXaa6FVsGkY2xphsLxhrTGUwql_GDu4N6tPHz9cajKw5x7kdumlPQvZDAryedIuJbkhUfmsi2-YjxjgzBNstk9IM_7AFj1FM-Vhyqe_932MlOXFbFFv2ABO-vvIFLGaeClVJ0E3DD8Gs5fbXvP1cGkqNEEoGkdC8gPcDhL',
                        width: double.infinity,
                        height: 240,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.saturation,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 16,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LOCALISATION ACTUELLE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white70, letterSpacing: 1.0)),
                          SizedBox(height: 4),
                          Text('En Transit : Bamako — Dakar', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Ownership Chain Title
              Row(
                children: [
                  Icon(Icons.history_edu, color: theme.primaryColor),
                  const SizedBox(width: 8),
                  const Text('Historique des Propriétaires', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Timeline Items
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  children: [
                    _buildTimelineItem(
                      role: 'PROPRIÉTAIRE INITIAL',
                      name: 'Mamadou Konaté',
                      date: '12 Oct. 2023',
                      status: 'Vendu',
                      isCurrent: false,
                      isFirst: true,
                      isLast: false,
                      theme: theme,
                      isDark: isDark
                    ),
                    _buildTimelineItem(
                      role: 'PROPRIÉTAIRE SUIVANT',
                      name: 'Awa Diop',
                      date: '14 Oct. 2023',
                      status: 'Vendu',
                      isCurrent: false,
                      isFirst: false,
                      isLast: false,
                      theme: theme,
                      isDark: isDark
                    ),
                    _buildTimelineItem(
                      role: 'PROPRIÉTAIRE ACTUEL',
                      name: 'Koffi Mensah',
                      date: 'Depuis 15 Oct.',
                      status: 'DÉTENTEUR',
                      isCurrent: true,
                      isFirst: false,
                      isLast: true,
                      theme: theme,
                      isDark: isDark
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // CTA Buy Rights
              GestureDetector(
                onTap: () => context.push('/trading-transit-details'), // Go to details screen
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                      const Text('Opportunité de Rachat', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text('Les droits de propriété pour ce transit sont actuellement négociables. Devenez le nouveau détenteur avant l\'arrivée à destination.', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.5)),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E2122) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
                        ),
                        child: Column(
                          children: [
                            const Text('VALEUR ESTIMÉE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                            const SizedBox(height: 4),
                            Text('1 425 000 FCFA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: theme.primaryColor)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton.icon(
                          onPressed: () => context.push('/trading-transit-details'),
                          icon: const Icon(Icons.shopping_cart_checkout, color: Colors.white),
                          label: const Text('Acheter le droit de propriété', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 4,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTimelineItem({
    required String role, 
    required String name, 
    required String date, 
    required String status, 
    required bool isCurrent,
    required bool isFirst,
    required bool isLast,
    required ThemeData theme,
    required bool isDark,
  }) {
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: 19,
            top: 40,
            bottom: -24,
            child: Container(width: 2, color: Colors.grey.withOpacity(0.2)),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0, left: 32),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2122) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border(left: BorderSide(color: isCurrent ? theme.primaryColor : Colors.grey, width: 4)),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Row(
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
                  child: Icon(Icons.person, color: isCurrent ? theme.primaryColor : Colors.grey),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(role, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isCurrent ? theme.primaryColor : Colors.grey)),
                          if (isCurrent) ...[
                            const SizedBox(width: 8),
                            Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                          ]
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isCurrent ? theme.primaryColor : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status, 
                        style: TextStyle(
                          fontSize: 10, 
                          fontWeight: FontWeight.bold, 
                          color: isCurrent ? Colors.white : (isDark ? Colors.white : Colors.black)
                        )
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 14,
          top: 32,
          child: Container(
            width: 12, height: 12,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF121212) : theme.scaffoldBackgroundColor,
              shape: BoxShape.circle,
              border: Border.all(color: isCurrent ? theme.primaryColor : Colors.grey, width: 3),
            ),
          ),
        ),
      ],
    );
  }
}
