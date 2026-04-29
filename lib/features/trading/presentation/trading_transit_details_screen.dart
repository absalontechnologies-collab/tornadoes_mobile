import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TradingTransitDetailsScreen extends StatelessWidget {
  const TradingTransitDetailsScreen({super.key});

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
        title: const Row(
          children: [
            Icon(Icons.storm, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text('Tornadoes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Product Insight
              Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                          child: CachedNetworkImage(
                            imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBazFJtdkaPV2aWlbjLf2hmL0687Lenj4GbeU0l_lI6AM_xjafkTA9Cm9e1Y46cPhHSFDpz21NT2ti_kpbAV_s8PU90PSmtrxk8gMAjDH9csnV6ffu31MdEQRINPJFSmx-eVuKS9MEH0bJvsD95Hw5xAIsI-jgK47Wj-hGox58F-yIFAMY7NszaKphiTDL8eN5hg8ayTihW3k8j3iMS2omY6sqqdXCQ42LkK2azDiqfX27Ya8oFq2BZgsAZOATmGowBdxMurFjb107_',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(20)),
                            child: const Text('EN TRANSIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0)),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Kinetix Chrono v2', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                          const SizedBox(height: 8),
                          Text('High-performance mechanical timepiece featuring a Grade 5 titanium chassis and sapphire crystal glass.', style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.5)),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('ESTIMATED DELIVERY', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                      const SizedBox(height: 4),
                                      Text('14h 22m', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('CURRENT VALUATION', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                      const SizedBox(height: 4),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text('450.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                                          const SizedBox(width: 2),
                                          const Text('FCFA', style: TextStyle(fontSize: 8, color: Colors.grey)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart, color: Colors.white),
                              label: const Text('Buy Ownership', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Ownership Chain
              Row(
                children: [
                  Icon(Icons.account_tree, color: theme.primaryColor),
                  const SizedBox(width: 8),
                  const Text('Ownership Chain', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
              
              // Current Owner
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border(left: BorderSide(color: theme.primaryColor, width: 4)),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('CURRENT OWNER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                        Icon(Icons.verified, size: 16, color: theme.primaryColor),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 48, height: 48,
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
                          child: const Icon(Icons.person, color: Colors.grey),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Jean-Marc Diouf', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text('Acquired 2 hours ago via Instant Trade', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('+12% ROI', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                            const SizedBox(height: 4),
                            const Text('Hold duration', style: TextStyle(fontSize: 10, color: Colors.grey)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Next Trade Option
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NEXT TRADE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.6), letterSpacing: 1.0)),
                    const SizedBox(height: 4),
                    const Text('Set Auto-Buy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 8),
                    Text('Execute trade automatically when delivery hits 2h remaining.', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8))),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: theme.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Enable', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Previous Owners
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('PREVIOUS OWNERS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                    const SizedBox(height: 24),
                    _buildPreviousOwner('Sarah Binet', '410.000 FCFA', 'Owned for 4 hours • Exit via Secondary Market'),
                    const SizedBox(height: 24),
                    _buildPreviousOwner('Amadou Kone', '395.000 FCFA', 'Initial Originator • Exit via Flash Auction'),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Map representation
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Icons.map, size: 80, color: Colors.white24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_shipping, color: theme.primaryColor, size: 32),
                        const SizedBox(height: 8),
                        const Text('Route: Port Auto to Almadies', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 40, height: 4, decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(2))),
                            const SizedBox(width: 4),
                            Container(width: 40, height: 4, decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(2))),
                            const SizedBox(width: 4),
                            Container(width: 40, height: 4, decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.3), borderRadius: BorderRadius.circular(2))),
                            const SizedBox(width: 4),
                            Container(width: 40, height: 4, decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(2))),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildPreviousOwner(String name, String price, String details) {
    return Row(
      children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
          child: const Icon(Icons.person, color: Colors.grey),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 4),
              Text(details, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        )
      ],
    );
  }
}
