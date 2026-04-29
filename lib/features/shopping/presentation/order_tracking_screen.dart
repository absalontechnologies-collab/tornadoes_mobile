import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('Suivi de Commande', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Map Visualization
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Stack(
                children: [
                   Positioned.fill(
                     child: CachedNetworkImage(
                       imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAcn8uSJNM2d_mh0WTVPSo4YPtz6xGoey9zghmqt-AjUv3RC7Bj1VhLKcO8gj240SBwA-92pQKPghuMEf209H7Q5hTaMObaq2L5dRfa9jlaQAikWF_bgzD6RCl1-5zXBGUUbXYFSb8QCkZiZySq9SfKN-bWMAxxi-UZVtknAUevNtHQElx-dAFjFe1ALbBW6xJUiziW2G5XCwEiunmG896RXDloJt_lFCCCLYHpccgoJEFb13cKYsttqOcnI7qls2EMeHyehnsE91aJ',
                       fit: BoxFit.cover,
                     ),
                   ),
                   // Center Courier Marker
                   Align(
                     alignment: Alignment.center,
                     child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(color: theme.primaryColor.withOpacity(0.4), blurRadius: 20, spreadRadius: 4),
                          ]
                        ),
                        child: const Icon(Icons.delivery_dining, color: Colors.white, size: 28),
                     ),
                   ),
                   // Bottom Floating Indicator
                   Positioned(
                     bottom: 40,
                     left: 24,
                     right: 24,
                     child: Container(
                       padding: const EdgeInsets.all(16),
                       decoration: BoxDecoration(
                         color: Colors.white.withOpacity(0.95),
                         borderRadius: BorderRadius.circular(16),
                         boxShadow: [
                           BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20),
                         ],
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('ARRIVÉE ESTIMÉE', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                const SizedBox(height: 4),
                                Text('12:45', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('DISTANCE', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                SizedBox(height: 4),
                                Text('1.2 km', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                              ],
                            )
                         ],
                       ),
                     ),
                   )
                ],
              ),
            ),
            
            // Content
            Transform.translate(
              offset: const Offset(0, -20),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Details Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      ),
                      child: Column(
                        children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Row(
                                 children: [
                                   ClipRRect(
                                     borderRadius: BorderRadius.circular(24),
                                     child: CachedNetworkImage(
                                       imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAOl0Sj_vt0euAiaZCFsE8U8HQpFablzpLDXtVdtVS8UMSXiyON-cMA03mRqgcGDBysx9egyPS2SPToxB2JYOg3HIVcEMeCCIVjuhpGIC98jeAnpPkicmycN3XJYkDgz-5hWI8kjVN7PnQnLXqEoVt_ceFnyiLq_EQ-0Mh3GXKb-vX5EK5t4ChBcvWCDfHBjLr1xOGOhhMxUV_Q3HItn59MVPx2mAzCg1ZwP_bBojbu_2gJVbgtImpQUogcmY_n5hunBuFbG9vWsY1z',
                                       width: 48,
                                       height: 48,
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                                   const SizedBox(width: 16),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       const Text('Moussa Diop', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                       Row(
                                         children: [
                                           Icon(Icons.star, color: theme.primaryColor, size: 14),
                                           const SizedBox(width: 4),
                                           const Text('4.9 • BubberPro', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                                         ],
                                       )
                                     ],
                                   )
                                 ],
                               ),
                               const Column(
                                 crossAxisAlignment: CrossAxisAlignment.end,
                                 children: [
                                   Text('ID COMMANDE', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                                   SizedBox(height: 4),
                                   Text('#BD-9921', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                 ],
                               )
                             ],
                           ),
                           const SizedBox(height: 16),
                           Row(
                             children: [
                               Expanded(
                                 child: ElevatedButton.icon(
                                   onPressed: () {},
                                   icon: const Icon(Icons.chat_bubble, size: 16),
                                   label: const Text('Chatter'),
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: Colors.grey.withOpacity(0.1),
                                     foregroundColor: isDark ? Colors.white : Colors.black,
                                     elevation: 0,
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                   ),
                                 ),
                               ),
                               const SizedBox(width: 16),
                               Expanded(
                                 child: ElevatedButton.icon(
                                   onPressed: () {},
                                   icon: const Icon(Icons.call, size: 16),
                                   label: const Text('Appeler'),
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: theme.primaryColor,
                                     foregroundColor: Colors.white,
                                     elevation: 0,
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                   ),
                                 ),
                               )
                             ],
                           )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Progression
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const Text('Progression', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                           const SizedBox(height: 32),
                           
                           _buildTimelineStep(theme, 'Commande reçue', '12:10', isCompleted: true, isLast: false),
                           _buildTimelineStep(theme, 'En préparation', '12:25', isCompleted: true, isLast: false),
                           _buildTimelineStep(theme, 'En cours de livraison', 'En route vers vous', isActive: true, isLast: false),
                           _buildTimelineStep(theme, 'Livrée', 'Prévue à 12:45', isNext: true, isLast: true),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineStep(ThemeData theme, String title, String subtitle, {bool isCompleted = false, bool isActive = false, bool isNext = false, bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: Column(
               children: [
                 if (isCompleted)
                   Container(
                     width: 24,
                     height: 24,
                     decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), shape: BoxShape.circle),
                     child: Icon(Icons.check, size: 14, color: theme.primaryColor),
                   )
                 else if (isActive)
                   Container(
                     width: 24,
                     height: 24,
                     decoration: BoxDecoration(color: theme.primaryColor, shape: BoxShape.circle, border: Border.all(color: theme.primaryColor.withOpacity(0.2), width: 4)),
                     child: Center(child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle))),
                   )
                 else if (isNext)
                   Container(
                     width: 24,
                     height: 24,
                     decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2)),
                   ),
                 if (!isLast)
                   Expanded(
                     child: Container(
                       width: 2,
                       color: Colors.grey.withOpacity(0.2),
                     ),
                   )
                 else
                   const SizedBox(height: 24), // Maintain spacing if last
               ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.w600, fontSize: 16, color: isNext ? Colors.grey : (isCompleted ? Colors.grey : (theme.brightness == Brightness.dark ? Colors.white : Colors.black)))),
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(fontSize: 12, color: isActive ? theme.primaryColor : Colors.grey, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
