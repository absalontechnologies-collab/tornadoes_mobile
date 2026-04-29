import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeliveryDashboardScreen extends StatefulWidget {
  const DeliveryDashboardScreen({super.key});

  @override
  State<DeliveryDashboardScreen> createState() => _DeliveryDashboardScreenState();
}

class _DeliveryDashboardScreenState extends State<DeliveryDashboardScreen> {
  bool isOnline = true;

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
        title: const Text('Espace Livreur', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Toggle & Greeting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bon retour,', style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
                    const Text('Moussa Traoré', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => isOnline = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isOnline ? theme.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: isOnline ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)] : null,
                          ),
                          child: Text('En Ligne', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isOnline ? Colors.white : Colors.grey)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => isOnline = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: !isOnline ? theme.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: !isOnline ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)] : null,
                          ),
                          child: Text('Hors Ligne', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: !isOnline ? Colors.white : Colors.grey)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            
            // Earnings Summary Bento Grid
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 140,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -10,
                          bottom: -10,
                          child: Icon(Icons.payments, size: 80, color: Colors.white.withOpacity(0.1)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Revenus du Jour', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    const Text('12 450', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white)),
                                    const SizedBox(width: 4),
                                    Text('FCFA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8))),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.trending_up, color: Colors.white, size: 14),
                                  SizedBox(width: 4),
                                  Text('+12% vs Hier', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E2122) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('EN ATTENTE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                        const SizedBox(height: 8),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('3 200', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Text('FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 14, color: theme.primaryColor),
                            const SizedBox(width: 4),
                            Text('Demain', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E2122) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('COURSES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                        SizedBox(height: 8),
                        Text('08', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.check_circle, size: 14, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('Aujourd\'hui', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Current Delivery Request (Simulation)
            GestureDetector(
              onTap: () => context.push('/delivery-request'),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: theme.primaryColor.withOpacity(0.3), width: 2),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2D3435) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.circle, size: 8, color: Colors.red),
                                SizedBox(width: 6),
                                Text('NOUVELLE COMMANDE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.red, letterSpacing: 1.0)),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('2 500', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: theme.primaryColor)),
                              const SizedBox(width: 4),
                              const Text('FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(width: 12, height: 12, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey, width: 3))),
                              Container(width: 2, height: 30, color: Colors.grey.withOpacity(0.3)),
                              Container(width: 12, height: 12, decoration: BoxDecoration(shape: BoxShape.circle, color: theme.primaryColor)),
                            ],
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ENLÈVEMENT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                Text('Restaurant "Le Gourmet", Plateaux', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                SizedBox(height: 12),
                                Text('LIVRAISON', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                Text('Résidence Almadies, Villa 45', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Divider(),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.merge_type, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          const Text('3.2 km', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 16),
                          const Icon(Icons.timer, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          const Text('12 min', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          const Spacer(),
                          const Text('Appuyez pour voir', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                          const SizedBox(width: 4),
                          const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Nearby deliveries list
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Commandes à proximité', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('VOIR TOUT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey.shade600, letterSpacing: 1.0)),
              ],
            ),
            const SizedBox(height: 16),
            
            _buildNearbyTask(theme, isDark, Icons.fastfood, 'Fast Food "Express"', '1.5 km • Préparation', '1 800'),
            const SizedBox(height: 12),
            _buildNearbyTask(theme, isDark, Icons.shopping_basket, 'Supermarché "Le Choix"', '2.8 km • Prêt', '2 200'),
            
          ],
        ),
      ),
    );
  }
  
  Widget _buildNearbyTask(ThemeData theme, bool isDark, IconData icon, String title, String subtitle, String amount) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2122) : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: theme.primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                  const SizedBox(width: 2),
                  const Text('FCFA', style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 4),
              const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
            ],
          )
        ],
      ),
    );
  }
}
