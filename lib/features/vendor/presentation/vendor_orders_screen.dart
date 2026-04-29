import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VendorOrdersScreen extends StatelessWidget {
  const VendorOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('Commandes Reçues', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 32, height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24, width: 2),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAGKirLtIU-W40Oehp35IVOAM_1STzFU4sy-tr5nWH6GwbRZhzgC76FrGxFmrVYGHRdLYRp837lgfjCIM5I68J3E4L0n0hKqmAh7VKoghsodIrwSyK4iNAW4HWC74ex4GhEh5vCG_vqizzdvutMNqDWopNzgtRySRTDBS-5KqBBOm_y54GKn3gjWqieNbmNOtvbKJftKP3tl_hdOk50rgCnAK3ijyD1ZZg4JENpfWyr6Lp0dwUEopv5Yh-uVKR4AC5wufNFHrTm8NVq'),
                  fit: BoxFit.cover
                )
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Filter Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    _buildFilterTab('Tous', true, theme),
                    const SizedBox(width: 8),
                    _buildFilterTab('À préparer', false, theme),
                    const SizedBox(width: 8),
                    _buildFilterTab('Prêt', false, theme),
                    const SizedBox(width: 8),
                    _buildFilterTab('Livré', false, theme),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Orders Grid
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildOrderCard(
                          id: '#ORD-9921', name: 'Jean Dupont', status: 'À préparer', 
                          total: '8 500', isUrgent: false,
                          items: [
                            {'icon': Icons.restaurant, 'text': '1x Burger Gourmet Deluxe'},
                            {'icon': Icons.local_bar, 'text': '2x Jus de Gingembre frais'},
                          ], theme: theme, isDark: isDark, context: context
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildOrderCard(
                          id: '#ORD-9925', name: 'Aminata Traoré', status: 'Prêt', 
                          total: '12 000', isUrgent: false,
                          items: [
                            {'icon': Icons.dinner_dining, 'text': '3x Riz au Gras Royal'},
                          ], theme: theme, isDark: isDark, context: context
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildOrderCard(
                          id: '#ORD-9918', name: 'Koffi Yao', status: 'Livré', 
                          total: '5 500', isUrgent: false,
                          items: [
                            {'icon': Icons.bakery_dining, 'text': '1x Assortiment de Pâtisseries'},
                          ], theme: theme, isDark: isDark, context: context
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildOrderCard(
                          id: '#ORD-9932', name: 'Fatou Sow', status: 'À préparer', 
                          total: '18 200', isUrgent: true,
                          items: [
                            {'icon': Icons.fastfood, 'text': '4x Menus Burger King Size'},
                          ], theme: theme, isDark: isDark, context: context
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Summary Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5F5E5E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('RÉSUMÉ DU JOUR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white70, letterSpacing: 1.0)),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('24', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                                Text('Commandes', style: TextStyle(fontSize: 10, color: Colors.white70)),
                              ],
                            ),
                            Column(
                              children: [
                                Text('145k', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                                Text('Revenu FCFA', style: TextStyle(fontSize: 10, color: Colors.white70)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        Container(
                          width: double.infinity,
                          height: 6,
                          decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(3)),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.75,
                            child: Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3))),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Objectif journalier', style: TextStyle(fontSize: 10, color: Colors.white70)),
                            Text('75%', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 80), // Padding for bottom nav
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context, isDark),
    );
  }

  Widget _buildFilterTab(String title, bool isSelected, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? theme.primaryColor : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _buildOrderCard({
    required BuildContext context,
    required String id,
    required String name,
    required String status,
    required String total,
    required bool isUrgent,
    required List<Map<String, dynamic>> items,
    required ThemeData theme,
    required bool isDark,
  }) {
    Color statusColor;
    Color statusBgColor;
    
    if (status == 'À préparer') {
      statusColor = isDark ? Colors.white : theme.primaryColor;
      statusBgColor = isDark ? Colors.white24 : theme.primaryColor.withOpacity(0.1);
    } else if (status == 'Prêt') {
      statusColor = const Color(0xFF5F5E5E);
      statusBgColor = const Color(0xFFE4E9EA);
    } else {
      statusColor = Colors.grey;
      statusBgColor = Colors.grey.withOpacity(0.1);
    }

    return GestureDetector(
      onTap: () => context.push('/vendor-order-details'),
      child: Container(
        height: 280, // Fixed height to align the grid horizontally
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E2122) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isUrgent ? Colors.red.withOpacity(0.5) : Colors.grey.withOpacity(0.1), width: isUrgent ? 2 : 1),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isUrgent)
                            Row(
                              children: [
                                const Text('URGENT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.red, letterSpacing: 1.0)),
                                const SizedBox(width: 4),
                                Text('• $id', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              ],
                            )
                          else
                            Text('ID: $id', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                          
                          const SizedBox(height: 4),
                          Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: statusBgColor, borderRadius: BorderRadius.circular(6)),
                      child: Text(status.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: statusColor, letterSpacing: 1.0)),
                    )
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Items
                ...items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                        child: Icon(item['icon'] as IconData, size: 16, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(item['text'] as String, style: TextStyle(fontSize: 12, color: isDark ? Colors.grey.shade400 : Colors.grey.shade600, fontWeight: FontWeight.w500), maxLines: 2, overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                )),
              ],
            ),
            
            // Footer
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.1)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(total, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                          const SizedBox(width: 2),
                          const Text('FCFA', style: TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 36, height: 36,
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.chevron_right, color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A1A).withOpacity(0.85) : Colors.white.withOpacity(0.85),
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', false, context, route: '/vendor-dashboard'),
              _buildNavItem(Icons.inventory_2, 'Commandes', true, context),
              _buildNavItem(Icons.add_box, 'Produits', false, context, route: '/vendor-add-product'),
              _buildNavItem(Icons.analytics, 'Analyses', false, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, BuildContext context, {String? route}) {
    final color = isActive ? Theme.of(context).primaryColor : Colors.grey;
    return GestureDetector(
      onTap: () {
        if (route != null) context.push(route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
