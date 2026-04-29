import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartCheckoutScreen extends StatelessWidget {
  const CartCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF2D3435) : const Color(0xFF616161),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('Tornadoes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mon Panier', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
                  const SizedBox(height: 8),
                  const Text('Révisez vos articles avant la confirmation.', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 32),
                  
                  // Cart Items
                  _buildCartItem(theme, 'Salade César Signature', 'Supplément Avocat', '4 500', 'https://lh3.googleusercontent.com/aida-public/AB6AXuA0V-OXYyohZ-TIpWnkz6rAsnijj-2i2eS6BZPIUfV64k9XJbdcS35AJu1SYnQH4u8hE-PyFASkJrhUIz4ERdxh4_V0WHxWrupVmerqEnC7_aNYP65qIphzV6dCgVBDvPDICkIJpv7LN5wO0oGMQKme4USPxsjnAJwumZWx-oC8MnSNxUV8H_wdntL9Ri_DH9IlZW-rqsrPwdsjbtjNqtwgHyOaLeSaOlABfyjnBBGfEzzmtpm-cVg9t0Xk2H2EKE8KE0ik8JQnKrtT'),
                  const SizedBox(height: 16),
                  _buildCartItem(theme, 'Pizza Napolitaine', 'Taille Large', '7 500', 'https://lh3.googleusercontent.com/aida-public/AB6AXuCWw6j0vkDuezl7c_1xdhwpbGpr2--zhHcglCTEsjD7vweoCbf64ju4RUB2qybwK_gqmjYM1chqTRX5JG8YH_WssVgVzGdM8iHQlJba_-jW00LEFoYYAyZ_YuCcHTUG8wgiJwjEv-uWMm-CNdg89aX_NPiIjmRE7P264IskmkjHnQdbXN8sKN11nmluOXCjgR74pKsxYuXRldJKZWlh7iFN9lljUGLnkuZix_tjwqVEeSLUngC0_sL5J7QHjYnA83iCMoNrjaTqXHA-'),
                  
                  const SizedBox(height: 48),
                  
                  // Address
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Adresse de livraison', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Modifier', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: theme.primaryColor)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: Icon(Icons.location_on, color: theme.primaryColor),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text('Bureau (Dakar Plateau)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                               SizedBox(height: 8),
                               Text('Rue de Thiong x Wagane Diouf, Immeuble Horizon\nAppartement 4B, Dakar, Sénégal', style: TextStyle(color: Colors.grey, height: 1.5)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 48),
                  
                  // Payment Method
                  const Text('Mode de paiement', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildPaymentMethod(theme, Icons.account_balance_wallet, 'Mon Wallet', 'Solde: 25 000 FCFA', true),
                  const SizedBox(height: 12),
                  _buildPaymentMethod(theme, Icons.waves, 'Wave', null, false, iconColor: Colors.lightBlue),
                  const SizedBox(height: 12),
                  _buildPaymentMethod(theme, Icons.phone_android, 'Orange Money', null, false, iconColor: Colors.orange),
                  
                  const SizedBox(height: 48),
                  
                  // Recap
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E2122) : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 24,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Récapitulatif', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text('Sous-total', style: TextStyle(color: Colors.grey)),
                             Text('12 000 FCFA', style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text('Frais de livraison', style: TextStyle(color: Colors.grey)),
                             Text('1 500 FCFA', style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                             Text('TOTAL', style: TextStyle(fontWeight: FontWeight.w900, color: theme.primaryColor, letterSpacing: 1.5)),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.baseline,
                               textBaseline: TextBaseline.alphabetic,
                               children: [
                                 const Text('13 500', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24)),
                                 const SizedBox(width: 4),
                                 Text('FCFA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                               ],
                             ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              context.push('/order-tracking');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                  Text('Confirmer la commande', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward),
                               ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'En confirmant, vous acceptez nos conditions générales de vente et notre politique de confidentialité.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCartItem(ThemeData theme, String title, String subtitle, String price, String img) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark ? const Color(0xFF1E2122) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: img,
              width: 80,
              height: 80,
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
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                           Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                         ],
                       ),
                     ),
                     Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                           Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                           const SizedBox(width: 4),
                           const Text('FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        ],
                     )
                   ],
                 ),
                 const SizedBox(height: 16),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                           children: [
                             Icon(Icons.remove, size: 20, color: theme.primaryColor),
                             const SizedBox(width: 16),
                             const Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                             const SizedBox(width: 16),
                             Icon(Icons.add, size: 20, color: theme.primaryColor),
                           ],
                        ),
                     ),
                     Row(
                        children: [
                           Icon(Icons.delete, size: 16, color: Colors.red.shade400),
                           const SizedBox(width: 4),
                           Text('SUPPRIMER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.red.shade400, letterSpacing: 1.0)),
                        ],
                     )
                   ],
                 )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(ThemeData theme, IconData icon, String title, String? subtitle, bool selected, {Color? iconColor}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark ? const Color(0xFF1E2122) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: selected ? Border.all(color: theme.primaryColor, width: 2) : Border.all(color: Colors.transparent, width: 2),
      ),
      child: Row(
        children: [
          Container(
             width: 40,
             height: 40,
             decoration: BoxDecoration(
               color: (iconColor ?? theme.primaryColor).withOpacity(0.1),
               borderRadius: BorderRadius.circular(8),
             ),
             child: Icon(icon, color: iconColor ?? theme.primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ]
              ],
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: selected ? theme.primaryColor : Colors.grey.withOpacity(0.5), width: 2),
            ),
            padding: const EdgeInsets.all(2),
            child: selected ? Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: theme.primaryColor),
            ) : null,
          )
        ],
      ),
    );
  }
}
