import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DeliveryTrackingScreen extends StatelessWidget {
  const DeliveryTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background simulation (Map)
          Container(
             width: double.infinity,
             height: double.infinity,
             color: isDark ? const Color(0xFF1E2122) : Colors.grey.shade200,
             child: Image.network(
               'https://lh3.googleusercontent.com/aida-public/AB6AXuCq3iAUpzCwqn5NpTVTjIP6UxT3TkSv0jrYMcidSCx9Jq2V8Xump6CkMmbHcU9qJL0It0yccCpN8VxXdOL8EmNWmqSqqoMXCka_uTsif-NWfcz8OvrOdYWKX712ZKxh3-tX-HAWkQt1FBImQln-pr2p7SRiir9vH_lbFhEkiQ9-hkjX5brzixTkN2wMosftBi1lpO8kQU4AJVvQ9F-8QNz9QJGHtEEnK9jLyJusISNvwO9QVwo-s3MchTFpT8bFXOTiZ0RhrNXCJUMY',
               fit: BoxFit.cover,
               color: isDark ? Colors.black54 : Colors.grey,
               colorBlendMode: isDark ? BlendMode.darken : BlendMode.saturation,
             ),
          ),
          
          // GPS Line Simulation
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: _RoutePainter(color: theme.primaryColor),
              ),
            ),
          ),
          
          // Origin Pin
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.grey, width: 2)),
                  child: const Icon(Icons.store, color: Colors.grey, size: 20),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2)]),
                  child: const Text('RESTAURANT', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1.0)),
                )
              ],
            ),
          ),
          
          // Delivery Rider Pin
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: theme.primaryColor, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2), boxShadow: [BoxShadow(color: theme.primaryColor.withOpacity(0.5), blurRadius: 8)]),
                  child: const Icon(Icons.moped, color: Colors.white, size: 24),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2)]),
                  child: const Text('Arrivée dans 8 min', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black)),
                )
              ],
            ),
          ),
          
          // Destination Pin
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            left: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2), boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.5), blurRadius: 8)]),
                  child: const Icon(Icons.location_on, color: Colors.white, size: 20),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2)]),
                  child: const Text('MOI', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1.0)),
                )
              ],
            ),
          ),
          
          // Top Notification Overlay
          Positioned(
            top: 60,
            left: 16,
            right: 16,
            child: GestureDetector(
              onTap: () => context.push('/delivery-steps'),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF2D3435).withOpacity(0.9) : Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('COMMANDE #BT-992', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: Text('EN ROUTE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('Préparation terminée', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    const Text('Le livreur a récupéré votre commande au restaurant.', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: Container(height: 4, decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(2)))),
                        const SizedBox(width: 8),
                        Expanded(child: Container(height: 4, decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(2)))),
                        const SizedBox(width: 8),
                        Expanded(child: Container(height: 4, decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.3), borderRadius: BorderRadius.circular(2)))),
                        const SizedBox(width: 8),
                        Expanded(child: Container(height: 4, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.circular(2)))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          
          // Bottom Driver Panel
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E2122) : Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 30, offset: const Offset(0, 10))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD6h4xmk_YNxcAAQk73CIL86GXChIPKEWLCsAs6PfxqS_CCIi6SoDvUXoQNIp6IFUivQI3KK07R1WNhSfPUb2imIDbmat2qoPM7pFixA8tWi5cgEL1HHoRxHTkEHOYbZaeo6AMErhTyuhfwp_hbKZC7JnObtW3U3L5TlKgaZ1_lwHLfzli0cflU-j1-S9GKGMIFO3c1e_NzEou3IWuieaGAq1GPFo_qNHaHv34AfUNhNCw1DW0kTt3o5YuRNmMA9AsF2GVgX6h-sayD',
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: -4,
                            right: -4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: isDark ? const Color(0xFF2D3435) : Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)]),
                              child: Row(
                                children: [
                                  Icon(Icons.star, size: 12, color: theme.primaryColor),
                                  const SizedBox(width: 2),
                                  Text('4.9', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Moussa Traoré', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
                            const SizedBox(height: 4),
                            const Text('BubberDrive Partner • Moto Yamaha', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                                  child: const Text('8 min', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text('•', style: TextStyle(color: Colors.grey)),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                                  child: const Text('2.4 km', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.chat_bubble, size: 20, color: isDark ? Colors.white : Colors.black),
                          label: Text('Chat', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.call, size: 20, color: Colors.white),
                          label: const Text('Appeler', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: theme.primaryColor,
                            elevation: 4,
                            shadowColor: theme.primaryColor.withOpacity(0.4),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

class _RoutePainter extends CustomPainter {
  final Color color;
  _RoutePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.8)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width * 0.22, size.height * 0.22);
    path.lineTo(size.width * 0.4, size.height * 0.25);
    path.lineTo(size.width * 0.45, size.height * 0.45);
    path.lineTo(size.width * 0.7, size.height * 0.5);
    path.lineTo(size.width * 0.82, size.height * 0.75);

    final dashWidth = 8.0;
    final dashSpace = 6.0;
    double distance = 0.0;
    
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Ensure you import dart:ui
