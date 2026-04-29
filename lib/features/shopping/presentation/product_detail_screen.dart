import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          // Hero Carousel via SliverAppBar
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                   CachedNetworkImage(
                     imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDcD8pW17z6f0PkK5dFYUFs0Cy58xTGrW6nBdiMXX7PRnBmpz-Q0bDZdX5eUuI-u5xGLqwUKwdI5yc8oZtc5pDy8SbvjsPtLGgEbPbI-Cco85EkD3LuxGWN6wNS_F7MmUQbe1Gtwgdky0yyOF6B9tEOiMeFd_pQHl_tn0jOQRJk8NaxBTPQXNw3u3U8LBsKInuNHk7Ex6L-P6Pu_APBhWfT230Obzqph21uZA4ffx2GomJWl0X6__GCDiFhHLGcnQWkUyM10rpD9Icd',
                     fit: BoxFit.cover,
                   ),
                   // Optional gradient
                   Container(
                     decoration: const BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         colors: [Colors.black54, Colors.transparent, Colors.transparent],
                       ),
                     ),
                   ),
                ],
              ),
            ),
          ),
          
          // Details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('L\'Essentiel Lin Naturel', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
                  const SizedBox(height: 8),
                  
                  // Price
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('24.500', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                      const SizedBox(width: 4),
                      const Text('FCFA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.5)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Description
                  const Text(
                    'Conçu pour le climat tropical, notre chemise en lin premium allie respirabilité exceptionnelle et élégance intemporelle. Une pièce de curation Tornadoes, sélectionnée pour sa durabilité et son impact environnemental réduit.',
                    style: TextStyle(fontSize: 16, color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  
                  // Bento Info
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.5,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildInfoBox(theme, Icons.air, 'Respirant', 'Léger 140g'),
                      _buildInfoBox(theme, Icons.eco, 'Matière', '100% Bio'),
                      _buildInfoBox(theme, Icons.wash, 'Entretien', 'Lavage 30°C'),
                      _buildInfoBox(theme, Icons.palette, 'Couleur', 'Sable Doux'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // Traceability
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text('Traçabilité & Origine', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                             Icon(Icons.qr_code_2, size: 40, color: Colors.grey),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text('IDENTIFIANT UNIQUE', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('TEX-SEN-LIN042', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: -0.5)),
                        ),
                        const SizedBox(height: 24),
                        
                        _buildTraceStep('Secteur : Textile Durable', 'Standard de certification environnementale Tornadoes Grade A.'),
                        const SizedBox(height: 16),
                        _buildTraceStep('Fournisseur : Artisans du Sine', 'Coopérative de tissage située à Kaolack, Sénégal.'),
                        const SizedBox(height: 16),
                        _buildTraceStep('Origine Fibre : France / Normandie', 'Lin certifié European Flax, transformé localement.'),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Divider(),
                        ),
                        Row(
                          children: [
                            Icon(Icons.verified, size: 16, color: theme.primaryColor),
                            const SizedBox(width: 8),
                            Text('Vérifier l\'authenticité sur la Blockchain', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100), // padding for FAB
                ],
              ),
            ),
          )
        ],
      ),
      
      // Add to Cart Floating CTA
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E2122).withOpacity(0.9) : Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.remove, size: 20), onPressed: () {}),
                    const Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    IconButton(icon: const Icon(Icons.add, size: 20), onPressed: () {}),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/cart');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart, size: 18),
                      SizedBox(width: 8),
                      Text('Ajouter au Panier', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(ThemeData theme, IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
           Icon(icon, color: Colors.grey, size: 24),
           const SizedBox(width: 12),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                Text(title.toUpperCase(), style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
             ],
           )
        ],
      ),
    );
  }

  Widget _buildTraceStep(String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4, right: 16),
          width: 4,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
               const SizedBox(height: 2),
               Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        )
      ],
    );
  }
}
