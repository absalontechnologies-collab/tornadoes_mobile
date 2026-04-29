import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tornadoes_app/core/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, isDark),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nos Secteurs',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildSecteursGrid(),
                  const SizedBox(height: 32),
                  _buildProduitsVedettesHeader(),
                  const SizedBox(height: 24),
                  _buildFeaturedProductsList(),
                  const SizedBox(height: 100), // padding for bottom nav
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDark) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 140,
      backgroundColor: const Color(0xFF5F5E5E),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.push('/notifications'),
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                  const Text(
                    'Tornadoes',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1.2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.push('/profile');
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBe03iKEzjv6Vr5RxbVVrW2R_c3VhrTFUfCufNrKSeQcPDgrccIWNYHz9UGkyGDU2pq-OCmXdY2ZaUBBhu44jAYuFH2HYKnLCndBKIbTQ3aPuyZSU_BZ98HtgL-P-6_9KRyZQ2Mgb112xvPI1V-CHQIXMbm3s64HvH1BThocgwl1rQwWe9-LdqybYyy_MsVxs6Me5JPFTmmt0834pxEhGFEtoEy7TtJbPxUVJ0i_nyD0-TwKDhp9AHulyKO4rRMxXUjTfWcgjFSCxTx',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Rechercher un service ou produit...',
                    hintStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white70,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecteursGrid() {
    final secteurs = [
      {
        'name': 'Restauration',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBRQGa27AwouyonkpT9S2S7VGGYFGF5KCpYX-XyGfE1K-qw-V9juYVgh2BjMHNNwgrf9OMGV6A_fVYtuqT_uHrLTR2opkAMUR6Wn_3MPTxLcAmd3cCqTNX-5iQLp6NUgMc30DJaeYsVflPbDt8biNh4YkXOQVvvohcVeTG9-HjNPFJzvGDxjZHP1a7jRyViyUFVbGPDL6cvQHyQSQPXXAOWTunIIJGSJm8xLTdW67gqPGPSV680WpkiXEWRnfCD0MNhoUUFMpWzJ_gp',
      },
      {
        'name': 'Habillement',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBw516v2efIe4vP3r1vwACxu9eZSACe8RRVRvhh0-93yQdz-9JIq3sSg-uE1UznN_0JEtmXKtbvGYXdq9wxhTy2FvS8xNFv0IJ_Cgql3dAu8yDsT7i8yeX_fnjTOetlj3O4uP7_s2yMOfpuKq6Ah2rXaq-UcLD9jvoNZtl6bOdn0NjUTxBVSOCuxJpNOfPIygfIdRVe3uZYGKXOXlMzoJ8SFqhOaToQayPHQ5IbXji2vtX-kINnR_M1KwZ9M4vQsQ2AD2iQd3tBshH0',
      },
      {
        'name': 'Alimentation',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAy1JTUfb7h5qGeRA2xtqZXUqhTYfB8fx0ph3EdcqvmgWuAaPwDMPKpoU_vlQ6J4n4YwDGfN-n-mORoDUQzTxDDKR_x89pH4X4OBeJ7Yv-5H-oH5be_-ToGQtg-PiLp9y94eNjxgsfy27UKpj97G87mLI-UUJRahNqphHWYT-_a4q8B7vZbzB_5AvFTDF0WyK6SiC_XHaH8H28FS1BaBjcy0VxTb_lpELJG8GXAmT63ci-epRTCl28M4tdCZ_EYnc5kFhu01MbjZP7T',
      },
      {
        'name': 'Esthétique',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBfbrQ-QeEgB0kP5VI1vypFlEg720XOGvG5qFGzQkxyMvqyWJ4CszlKkWbgltR4elX_5M2_n2Yph16QQqxJnsExWPejfEzAvQ47yXJR7y0vmGjz1uY_1oYrVOyrZMLG9qrCOhjbTxoDYLEiOWxKxQkJLePs8Y7bpX3KMXfRtKDVcR-eGrVFD7NNW61SSBvJFq2eaLr6zOqZk1KFXrjnk2Km8AnH3IgnIUwIDcjSz-C7DxMUJ2smqdxfy5HTdsKY8hbUJqn4Er9tt2wz',
      },
      {
        'name': 'Services IT',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuC3WI323wEtScAKT-xPfN2ivD2uG15OIt3tCxMX93-L9OIOP92powbO9JbtmaL7Qq0t3hdPqYRj0Pu40Abgkwq7_a3RK53vRoazoiAaH3YaFAyPOKk_XBaUo7Jadcm-kxyz11V_j3zs8fHbh6ojaj2Hj0KdZP0-xAbwJDzXO1F2A_-0hCMbBMA76IzeWfMMw8W0svLyXS3HnpHVwmVvYZdPAcZoEDiiB9kDA9RoIMlcIZ9TG7c4pFdfIs4hiaHQfiSjGGpFKQ1SDbWa',
      },
      {
        'name': 'BTP',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'Informatique',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'Sport',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'Poisson',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'Transport',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'Emploi',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'Outillage',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'Téléphonie',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'Santé',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
      {
        'name': 'BuberDrive',
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBROdcgYt3nMECN--oLWHAUIhs_8HnZc611jT5l_GEpEg4OuwOOrins7GbTZAB4t9xVkCD8KQhK7mZz5NactaQd4-7BOF3M9vjsoueoxw1fjTrb__a2WDpt3jJttgGoMGqgbJSq3atjPugtIVZDFVKTx0WVoYuiEVG6cYt7zAXpmBvrF2j64fc0j5BjxCBYhfEONy6x7xeVGS3BGWi0SESQISomTKqQ-_c1arA3MtknBUo9fv2C9r4l18oPEhxeeyz_41hydn5Il4nH',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: secteurs.length,
      itemBuilder: (context, index) {
        final item = secteurs[index];
        return GestureDetector(
          onTap: () {
            // Mock module connections based on sector name
            // if (item['name'] == 'Restauration') context.push('/delivery-dashboard');
            // else if (item['name'] == 'Habillement') context.push('/trading-dashboard');
            // else context.push('/vendor-dashboard');
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).dividerColor.withOpacity(0.1),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item['name']!.toUpperCase(),
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProduitsVedettesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Produits Vedettes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Sélection exclusive de la semaine',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Voir tout',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedProductsList() {
    return Column(
      children: [
        _ProductCard(
          title: 'Montre Horizon',
          subtitle: 'Provenance: Genève, CH',
          price: '125.000',
          image:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBa-kDIiWMU23KN36eygAs4bGk8eVAwY-29r0_Qk8ts-_a0BHfXhOzCRF-iivkvUskfLN7JxC86uEzhuCsiq-8IkJNoAQyzxsIFuBSUQoahqWTFdbUJEhMVke_1aooV4wg6IcFrJaJPs-pCISnTgHk47jRZQ5hw3L6RVTH_-sPzqKwb6z2fbkPMng_rJ28bxt4has9bJ-uF3Ybjlq0Bk-dtzEGtL_apm_qeUOlkzBN6Z9THuJVmTAtYEt8OAJeVlUHE-W2tpsjtFjCG',
          isNew: true,
        ),
        const SizedBox(height: 24),
        _ProductCard(
          title: 'Casque Studio Pro',
          subtitle: 'Provenance: Berlin, DE',
          price: '85.500',
          image:
              'https://lh3.googleusercontent.com/aida-public/AB6AXuC8rdPjEx3m2akangy1ccwAGy8gDRFX3hYREOMHHVlYqzGJxn-SIlPxsazMc_pdZrYVExYaNbU-Cw-7HlqBC6JJRnK457zZJb39IzaripqHXSNAtPKZUtm1rjnfAYdzXzimjDV4VaKH9FjWk5sLf1YHzTDAbRFIQsW4wsPzjuHLwOPGeF6S2cl-j1Vco7_SmQQc-WOLW2-RTn5bEZ9-6tfZKZ1xyXIr861fJ6BBd0CjV12qKJXTpqp_CHTQTzidrUCBX3glvUb3w1Ir',
          isNew: false,
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;
  final bool isNew;

  const _ProductCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image Header
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(image, fit: BoxFit.cover),
                ),
              ),
              if (isNew)
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'NOUVEAU',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: price,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                        children: const [
                          TextSpan(
                            text: ' FCFA',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => context.push('/product-detail'),
                    icon: const Icon(Icons.shopping_bag, size: 18),
                    label: const Text('Ajouter au panier'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
