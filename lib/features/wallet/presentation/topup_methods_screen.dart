import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopupMethodsScreen extends StatelessWidget {
  const TopupMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF535252) : const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('Tornadoes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBpukEBhYR5Wmt2nNHJyUmxZQ26LQeMcPQSc7MEr-wIYGeHfrK6Ij87eNenpojvJuqvveDtMCKGmPQXKI19OpWVQJ8Bl9KruTmDwltz2gnESKcBrZHDVWDDhdhdW9Gc6SRO6HO5GtLG_t4Se7Ak-59e4BOgO54D-9XWi6QBflfeZkwuR2z0jgO8BGLGm1dXvf7Md8SpRbexcr0vF5ASniPVuls9sLTbegPiszPKTEsDj-VlmY2XuxKBaw_3ue2y7PyF3gxjic-1oK00',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Text('Recharge Wallet', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: -0.5)),
               const SizedBox(height: 8),
               const Text('Alimentez votre compte instantanément', style: TextStyle(fontSize: 16, color: Colors.grey)),
               
               const SizedBox(height: 48),
               
               // Amount Input
               const Text('MONTANT DE LA RECHARGE', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
               const SizedBox(height: 16),
               
               Container(
                 decoration: BoxDecoration(
                   color: Colors.grey.withOpacity(0.05),
                   borderRadius: BorderRadius.circular(16),
                 ),
                 child: const TextField(
                   keyboardType: TextInputType.number,
                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     prefixIcon: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                       child: Text('FCFA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                     ),
                     prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                     hintText: '0',
                     contentPadding: EdgeInsets.symmetric(vertical: 24),
                   ),
                 ),
               ),
               
               const SizedBox(height: 16),
               SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                       _buildAmountChip('+ 5.000'),
                       _buildAmountChip('+ 10.000'),
                       _buildAmountChip('+ 25.000'),
                       _buildAmountChip('+ 50.000'),
                    ],
                  ),
               ),
               
               const SizedBox(height: 48),
               
               // Payment Methods
               const Text('MODE DE PAIEMENT', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
               const SizedBox(height: 16),
               GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
                  children: [
                     _buildPaymentMethod(theme, Icons.tsunami, 'Wave', 'Mobile Money', Colors.lightBlue),
                     _buildPaymentMethod(theme, Icons.payments, 'Orange Money', 'Sénégal / Mali', Colors.orange),
                     _buildPaymentMethod(theme, Icons.credit_card, 'Carte Bancaire', 'Visa / Mastercard', theme.primaryColor),
                     _buildPaymentMethod(theme, Icons.account_balance, 'Virement', 'RIB Bancaire', theme.primaryColor),
                  ],
               ),
               
               const SizedBox(height: 48),
               
               // CTA
               SizedBox(
                 width: double.infinity,
                 height: 64,
                 child: ElevatedButton(
                    onPressed: () {
                      context.push('/payment-confirmation');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 5,
                      shadowColor: theme.primaryColor.withOpacity(0.5),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Continuer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(width: 12),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                 ),
               ),
               const SizedBox(height: 24),
               const Text(
                 'LES TRANSACTIONS SONT SÉCURISÉES ET CRYPTÉES DE BOUT EN BOUT SELON LES NORMES PCI-DSS.',
                 textAlign: TextAlign.center,
                 style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.0, height: 1.5),
               ),
               const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildAmountChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
         color: Colors.grey.withOpacity(0.1),
         borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildPaymentMethod(ThemeData theme, IconData icon, String title, String subtitle, Color color) {
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2122) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
             width: 40,
             height: 40,
             decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
             ),
             child: Icon(icon, color: color, size: 24),
          ),
          const Spacer(),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        ],
      ),
    );
  }
}
