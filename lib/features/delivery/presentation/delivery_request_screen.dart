import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/providers/delivery_provider.dart';
import '../../../core/providers/auth_provider.dart';

class DeliveryRequestScreen extends ConsumerWidget {
  final Map<String, dynamic>? deliveryData;
  const DeliveryRequestScreen({super.key, this.deliveryData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final rawId = deliveryData?['id']?.toString() ?? 'N/A';
    final shortId = '#ORD-${rawId.length > 4 ? rawId.substring(rawId.length - 4) : rawId}';
    final amount = deliveryData?['total_amount']?.toString() ?? '2500';

    return Scaffold(
      body: Stack(
        children: [
          // Background simulation (Map)
          Container(
             width: double.infinity,
             height: double.infinity,
             color: isDark ? const Color(0xFF1E2122) : Colors.grey.shade200,
             child: Image.network(
               'https://lh3.googleusercontent.com/aida-public/AB6AXuBP2xK2Py0xyp9j8rvX8giIFzqg9CB1WDXrdzfRorQQplIR3dhZSi2YVOaQEm60xEtKozg_w9_DF-ACwe3cOrL6DnXd_V_MH8PB8isLRgefOJzAlDBx20Xl2rku5NW-CsfxbU01945ehH_VfCNVoz6HhDAoUYhWafrMwmnSyeO-zAMi5t1uhJfEccPnpYRScYI69EV-BLkM34hnhNtw9bkBE0EyxNWa6YHSJ-6OqZSoQ77LS1QxRASxMXEMafgtHinZ_FPsBfssHccL',
               fit: BoxFit.cover,
               color: isDark ? Colors.black54 : Colors.grey,
               colorBlendMode: isDark ? BlendMode.darken : BlendMode.saturation,
             ),
          ),
          
          // AppBar Custom
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              color: isDark ? const Color(0xFF323A3B) : const Color(0xFF5F5E5E),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => context.pop(),
                      ),
                      const SizedBox(width: 8),
                      const Text('BUBBERDRIVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 2.0)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.greenAccent, shape: BoxShape.circle)),
                        const SizedBox(width: 6),
                        const Text('EN LIGNE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          
          // Overlay Bottom Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF2D3435) : Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 40, offset: const Offset(0, 10)),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Block
                  Container(
                    padding: const EdgeInsets.all(24),
                    color: theme.primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('NOUVELLE MISSION', style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                            const SizedBox(height: 4),
                            Text('Commande $shortId', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(amount, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
                                const SizedBox(width: 4),
                                const Text('FCFA', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text('Gain estimé', style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 10)),
                          ],
                        )
                      ],
                    ),
                  ),
                  
                  // Details Block
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        // Timeline
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 32, height: 32,
                                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
                                    child: const Icon(Icons.restaurant, size: 16, color: Colors.grey),
                                  ),
                                  Expanded(child: Container(width: 2, color: Colors.grey.withOpacity(0.3))),
                                  Container(
                                    width: 32, height: 32,
                                    decoration: BoxDecoration(color: theme.primaryColor, shape: BoxShape.circle),
                                    child: const Icon(Icons.location_on, size: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('RAMASSAGE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                              Text('Restaurant \'Le Gourmet\'', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              Text('Plateau, Avenue Hassan II', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                                          child: Text('1.2 km', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('DÉPÔT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                              Text('Résidence Almadies', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              Text('Villa 42, Près de la Mosquée', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                                          child: Text('5.8 km', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.0),
                          child: Divider(),
                        ),
                        
                        // Meta info
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40, height: 40,
                                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                                    child: Icon(Icons.schedule, color: theme.primaryColor),
                                  ),
                                  const SizedBox(width: 12),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('TEMPS ESTIMÉ', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                      Text('22 min', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40, height: 40,
                                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                                    child: Icon(Icons.shopping_bag, color: theme.primaryColor),
                                  ),
                                  const SizedBox(width: 12),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('COMMANDE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                      Text('3 articles', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextButton(
                                onPressed: () => context.pop(),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  backgroundColor: Colors.grey.withOpacity(0.1),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                child: Text('Décliner', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 5,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final user = ref.read(currentUserProvider);
                                  if (user == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Utilisateur non connecté.')));
                                    return;
                                  }

                                  if (deliveryData != null && deliveryData!['id'] != null) {
                                    try {
                                      final success = await ref.read(deliveryRepositoryProvider).takeDelivery(deliveryData!['id'] as int, user.id);
                                      if (success && context.mounted) {
                                        context.push('/delivery-tracking', extra: deliveryData);
                                      } else if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Impossible de s\'assigner à cette livraison. Profil Livreur manquant ?')));
                                      }
                                    } catch (e) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur: $e')));
                                      }
                                    }
                                  } else {
                                    context.push('/delivery-tracking');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  backgroundColor: theme.primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  elevation: 4,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Accepter', style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward, size: 18),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  
                  // Progress Bar
                  Container(
                    height: 6,
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.2),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 6,
                        width: MediaQuery.of(context).size.width * 0.6,
                        color: theme.primaryColor,
                      ),
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
