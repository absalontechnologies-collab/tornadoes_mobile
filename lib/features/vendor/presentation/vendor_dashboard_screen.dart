import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VendorDashboardScreen extends StatelessWidget {
  const VendorDashboardScreen({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dashboard Header & CTA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Tableau de bord', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
                        const SizedBox(height: 8),
                        Text('Bienvenue, Boutique Horizon Sahel', style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () => context.push('/vendor-add-product'),
                    icon: const Icon(Icons.add_circle, color: Colors.white),
                    label: const Text('Ajouter un produit', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  )
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Bento Grid Stats
              Row(
                children: [
                  // Main Stat: Revenue
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E2122) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('REVENUS DU MOIS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                  const SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      const Text('1.240.500', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                                      const SizedBox(width: 4),
                                      const Text('FCFA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                                child: Icon(Icons.payments, color: theme.primaryColor),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Mini Chart Mockup
                          SizedBox(
                            height: 60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 2), height: 24, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: const BorderRadius.vertical(top: Radius.circular(2))))),
                                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 2), height: 36, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: const BorderRadius.vertical(top: Radius.circular(2))))),
                                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 2), height: 28, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: const BorderRadius.vertical(top: Radius.circular(2))))),
                                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 2), height: 45, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: const BorderRadius.vertical(top: Radius.circular(2))))),
                                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 2), height: 60, decoration: BoxDecoration(color: theme.primaryColor, borderRadius: const BorderRadius.vertical(top: Radius.circular(2))))),
                                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 2), height: 38, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: const BorderRadius.vertical(top: Radius.circular(2))))),
                                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 2), height: 48, decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: const BorderRadius.vertical(top: Radius.circular(2))))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Small Stat: Today's Orders
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 170, // Align with left card roughly
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Stack(
                        children: [
                          Positioned(
                            right: -20, bottom: -20,
                            child: Icon(Icons.shopping_bag, size: 100, color: Colors.white10),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('COMMANDES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white70, letterSpacing: 1.0)),
                                  SizedBox(height: 8),
                                  Text('24', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Colors.white)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.trending_up, size: 12, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text('+12%', style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Recent Sales Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Derniers articles vendus', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Voir tout', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Product Cards Grid
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 0.7,
                children: [
                  _buildProductCard(
                    context: context,
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD--3RVtw9yDGvV2v7uwAjuc6anJQymMWk1dphHmQSklfZAr6Czy7j_PAeu4JHglx0q5iCjTo14h-tfcYUHBJmT6G_7GgDcC2jxQ7xivoChBs4aW9QDQZDsIetGSdjLP6gRZq9MKiivACMUDk0DuZXON6eHLp1J9RpxWF-Ndzk2wRggIQp842WVRG4MrqcBKh3ztrP2cIjtN7zX-nl-uNALAfOK3JjcW81da82ZIa1QxTTBxpDwjXJ0ugDz4CO6ZpUqsOJA5dv71oGj',
                    category: 'ACCESSOIRES',
                    title: 'Porte-carte Cuir Nomad',
                    price: '15.000',
                    time: '2h',
                    theme: theme, isDark: isDark
                  ),
                  _buildProductCard(
                    context: context,
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB-D622ZnfdQE15oe6Iaf6PVgWJM0A4fCgn1qWQAI3YNGFggEDfBZo3MRZ8StMzXpaUOiqTaGnzrDil79PBqIeevMbREy_gNs83Te0LN92w-7ov7m9KTmoq525E7SLtFC8eg86NdfWf4RgcsGPdR_nXBiq3vI0ISo6qQS_3yQuuLF8dUrYb4okLZEw1i57BLqilkd0M6ohXn4DTEL3fh0qLI3ronTK94GaWghZNAvt6AMk-Y3zDTK7zCX-mghAKwJy_gCiG5Hjn6MMF',
                    category: 'MODE',
                    title: 'Lunettes Sahel Vision',
                    price: '22.500',
                    time: '4h',
                    theme: theme, isDark: isDark
                  ),
                  _buildProductCard(
                    context: context,
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAz4CyIho8_fsFBuNKfL0b671av7CUaWGBXDTYhWi6PjcLGfmVA2ReQrpVqAM_bn-ahptUng47hFC4-ku9TIyjqjMZnKkBEIn82-VJG0S2W5d0pYoFg_EAGChzJSFzHpLt-hCuS7ywGCslaB0slJaMjgGycmmFwHuDWqE7scGqI4wM29TXYLYWXozRCYd_q1qOTNW0IqJ9WsMB6Wug1U3sPW2ns3sHUUr-AAIWdG98I4jqJ6iF7qnAp5-5nC-2AfTSH7bw-8WbRmR7x',
                    category: 'MAISON',
                    title: 'Bol Artisanal Touareg',
                    price: '8.500',
                    time: '6h',
                    theme: theme, isDark: isDark
                  ),
                  _buildProductCard(
                    context: context,
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkQKjYBJgK3dXSAwZJc_UlJ_we2wbcF9s18ETkJYP0HtF_zNBSsJQPhVTtsgsic39R-APz0RmRkQbGT_Tr9O0SWX6wPGeRuHgTFG8OxcBIoMvtfIWRwqyJAZ1a0KhrX40VKRzNQOFdpoY2o4D9s2e5ikTPF5tOzJP3Mc_59qD_zDpos_mOhq_RqpMC0zE2l5aXoSCpoBP-vnJylk1s3ezQ2XxWY5QTJPaI7kMF1_AXyhsVylJeK8crxmly7UAnrROTbn9Be1JPSecF',
                    category: 'ACCESSOIRES',
                    title: 'Montre Horizon Pure',
                    price: '45.000',
                    time: '8h',
                    theme: theme, isDark: isDark
                  ),
                ],
              ),
              
              const SizedBox(height: 80), // Bottom nav padding
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context, isDark),
    );
  }
  
  Widget _buildProductCard({
    required BuildContext context,
    required String imageUrl,
    required String category,
    required String title,
    required String price,
    required String time,
    required ThemeData theme,
    required bool isDark,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2122) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(price, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                        const SizedBox(width: 2),
                        const Text('FCFA', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text('il y a $time', style: const TextStyle(fontSize: 8, color: Colors.grey)),
                  ],
                )
              ],
            ),
          )
        ],
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
              _buildNavItem(Icons.home, 'Home', true, context),
              _buildNavItem(Icons.inventory_2, 'Commandes', false, context, route: '/vendor-orders'),
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
