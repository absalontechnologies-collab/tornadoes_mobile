import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TradingDashboardScreen extends StatelessWidget {
  const TradingDashboardScreen({super.key});

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
        title: const Text('Trading Communautaire', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        actions: [
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
            // Portfolio Summary Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E2122) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                border: Border.all(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('SOLDE ACTUEL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 2.0)),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('1 450 000', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: theme.primaryColor, letterSpacing: -1.0)),
                      const SizedBox(width: 8),
                      const Text('FCFA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Icon(Icons.trending_up, size: 16, color: theme.primaryColor),
                            const SizedBox(width: 8),
                            Text('+12.5% ce mois', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('Retrait', style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Metrics Grid
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('PROFITS TOTAUX', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  const Text('340 500', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 2),
                                  Text('FCFA', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
                          child: Icon(Icons.payments, size: 16, color: theme.primaryColor),
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
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('TRADES ACTIFS', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  const Text('04', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 4),
                                  Text('Expéditions', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
                          child: Icon(Icons.local_shipping, size: 16, color: theme.primaryColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Forfaits Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Forfaits de Trading', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Investissement communautaire.', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  ],
                ),
                Row(
                  children: [
                    Text('Voir Tout', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                    Icon(Icons.chevron_right, size: 14, color: theme.primaryColor),
                  ],
                )
              ],
            ),
            
            const SizedBox(height: 16),
            
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                children: [
                  _buildForfaitCard(
                    title: 'Essentiel Sahel', 
                    subtitle: 'Première nécessité en transit.', 
                    price: '50 000 FCFA', 
                    retour: '+8% / 30j', 
                    level: 'Niveau 1',
                    isFeatured: false,
                    theme: theme,
                    isDark: isDark
                  ),
                  const SizedBox(width: 16),
                  _buildForfaitCard(
                    title: 'Croissance Plus', 
                    subtitle: 'Textiles et matériel importé.', 
                    price: '250 000 FCFA', 
                    retour: '+15% / 60j', 
                    level: 'Niveau 2',
                    isFeatured: true,
                    theme: theme,
                    isDark: isDark
                  ),
                  const SizedBox(width: 16),
                  _buildForfaitCard(
                    title: 'Expert Hub', 
                    subtitle: 'Portefeuille diversifié.', 
                    price: '1 000 000 FCFA', 
                    retour: '+22% / 90j', 
                    level: 'Niveau 3',
                    isFeatured: false,
                    theme: theme,
                    isDark: isDark
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Active Trades List
            const Text('Trades en Transit', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            
            GestureDetector(
              onTap: () => context.push('/trading-transit'),
              child: _buildTradeItem(
                title: 'Ciment Portland - Transit Lomé',
                subtitle: 'Arrivée prévue : 12 Oct.',
                investAmount: '75 000',
                progress: 0.65,
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAfRHS3SdxxsGs49q6ZWydW2Vu63p-6f8X2JwpYVtkVAdsxbd1oovzEi2NaNNjiHiRUxlCFDgjt79vb8uBHxnFBvKTK8U8Req0zjGBFwhlVXeU4qgQ5a4T4vagCMNWZQ2aP9DCjf2m05e5CC1kQwEP8TrBCyUvGdWgZUWrovxQ6vgMdbD8kHcdhv7loL20mkwubl4GNPjcEYvG-IdtC_UDeRcl1J-N1cqycvbBYNiDw_NgewYHx_Xd_gQcmrGZODfyNFZ9rRaWhAS9k',
                theme: theme
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => context.push('/trading-transit'),
              child: _buildTradeItem(
                title: 'Anacarde - Export Europe',
                subtitle: 'Phase : Contrôle Qualité',
                investAmount: '120 000',
                progress: 0.30,
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDkp3LLEltJYB96w2jVMeWkdBRug18PdgCDmYeIu6bljjXQ0Sb45iKmKe41VnuBL0osRPZtcoEDZNBOUDKMVYTZSazHAlUWxuZY-Xj_8ZkyRItupotizQNGmzTgisSKAnFAMmhGma9fmumatJZ8IMZud1gd-IrjNA-BBjiCUvzQ5zHy8_W0K7sJPEtfFat-WHgjCcP5M1jzWnNNJsVCmcaJvXRndDB7rgBe5V59Oqv5Ed1PCukiWwKNpY8Vhha3apF0yEiFX3yII53G',
                theme: theme
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.search, size: 20, color: theme.primaryColor),
                    label: Text('Deals', style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.push('/trading-sale'),
                    icon: const Icon(Icons.dashboard_customize, size: 20, color: Colors.white),
                    label: const Text('Manage', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
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
    );
  }
  
  Widget _buildForfaitCard({required String title, required String subtitle, required String price, required String retour, required String level, required bool isFeatured, required ThemeData theme, required bool isDark}) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isFeatured ? theme.primaryColor : (isDark ? const Color(0xFF1E2122) : Colors.white),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [if (isFeatured) BoxShadow(color: theme.primaryColor.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10))],
        border: !isFeatured ? Border.all(color: Colors.grey.withOpacity(0.1)) : null,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (isFeatured)
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12))),
                child: const Text('POPULAIRE', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: isFeatured ? Colors.white.withOpacity(0.2) : Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                    child: Text(level, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isFeatured ? Colors.white : theme.primaryColor, letterSpacing: 1.0)),
                  ),
                  const SizedBox(height: 12),
                  Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isFeatured ? Colors.white : (isDark ? Colors.white : Colors.black))),
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(fontSize: 12, color: isFeatured ? Colors.white.withOpacity(0.8) : Colors.grey)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Prix', style: TextStyle(fontSize: 12, color: isFeatured ? Colors.white.withOpacity(0.7) : Colors.grey)),
                      Text(price, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isFeatured ? Colors.white : (isDark ? Colors.white : Colors.black))),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Retour', style: TextStyle(fontSize: 12, color: isFeatured ? Colors.white.withOpacity(0.7) : Colors.grey)),
                      Text(retour, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isFeatured ? Colors.white : theme.primaryColor)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isFeatured ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: !isFeatured ? Border.all(color: theme.primaryColor) : null,
                    ),
                    child: Center(
                      child: Text('S\'ABONNER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isFeatured ? theme.primaryColor : theme.primaryColor, letterSpacing: 1.0)),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildTradeItem({required String title, required String subtitle, required String investAmount, required double progress, required String imageUrl, required ThemeData theme}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(investAmount, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                        Text(' investis', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 4,
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(2)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 200 * progress, // Simplified width logic
                      height: 4,
                      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
