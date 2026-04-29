import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TransactionReceiptScreen extends StatelessWidget {
  const TransactionReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF4A4A4A) : const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('SUPERAPP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 2.0)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               const SizedBox(height: 24),
               Container(
                 width: 80,
                 height: 80,
                 decoration: BoxDecoration(
                   color: Colors.grey.withOpacity(0.05),
                   shape: BoxShape.circle,
                 ),
                 child: Icon(Icons.check_circle, size: 36, color: theme.primaryColor),
               ),
               const SizedBox(height: 16),
               const Text('Transaction réussie', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
               const SizedBox(height: 4),
               const Text('Votre paiement a été traité avec succès.', style: TextStyle(color: Colors.grey)),
               
               const SizedBox(height: 48),
               
               // Editorial Receipt Card
               Container(
                 padding: const EdgeInsets.all(32),
                 decoration: BoxDecoration(
                   color: isDark ? const Color(0xFF1E2122) : Colors.white,
                   borderRadius: BorderRadius.circular(24),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.black.withOpacity(0.04),
                       blurRadius: 24,
                       offset: const Offset(0, -4),
                     )
                   ],
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
                             Text('MONTANT TOTAL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.grey, letterSpacing: 2.0)),
                             SizedBox(height: 4),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.baseline,
                               textBaseline: TextBaseline.alphabetic,
                               children: [
                                  Text('15,150', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900)),
                                  SizedBox(width: 4),
                                  Text('FCFA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                               ],
                             )
                           ],
                         ),
                         Container(
                           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                           decoration: BoxDecoration(
                             color: Colors.grey,
                             borderRadius: BorderRadius.all(Radius.circular(16)),
                           ),
                           child: Text('CONFIRMÉ', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5)),
                         )
                       ],
                     ),
                     
                     const Padding(
                       padding: EdgeInsets.symmetric(vertical: 32.0),
                       child: Divider(),
                     ),
                     
                     _buildDetailRow('Montant du transfert', '15,000 FCFA'),
                     const SizedBox(height: 24),
                     _buildDetailRow('Frais de service', '150 FCFA'),
                     const SizedBox(height: 24),
                     _buildDetailRow('Date & Heure', '24 Mai 2024, 14:32'),
                     const SizedBox(height: 24),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ID Transaction', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Row(
                           children: [
                             const Text('TXN-88294401', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                             const SizedBox(width: 8),
                             Icon(Icons.content_copy, size: 16, color: Colors.grey.shade400),
                           ],
                        )
                      ],
                     ),
                     const SizedBox(height: 24),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Méthode', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        Row(
                           children: [
                             Icon(Icons.account_balance_wallet, size: 16, color: theme.primaryColor),
                             const SizedBox(width: 8),
                             const Text('Solde SuperApp', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                           ],
                        )
                      ],
                     ),
                     
                     const SizedBox(height: 40),
                     
                     // Destinataire Card
                     Container(
                       padding: const EdgeInsets.all(16),
                       decoration: BoxDecoration(
                         color: Colors.grey.withOpacity(0.05),
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: Row(
                         children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(24),
                             child: CachedNetworkImage(
                               imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDHnSRXA0LMDE1R5q6bh3KUff9Ui_es8AxZQEmO0I9T10nc2FMz3sjwEnqe26vNgRmEjbCTgBMtoPA8xjok_-sH9Tw9-J6LPlDhuXPaOh3O6VnHUa7w9VX-KJ60d6n6FP_gtYqjlTkiI1YNLGYbRs1-XM355mr4M6_cv5h2oFrUt7XoNMl99N6g-ERMaXdQ8fLg2rwCxkDKLzB76lo0JhX3RYw6BlUVzWm4-HfZZWgutppXPvPmaWLWzbdMLf44EF727zwyB8Vuy9FJ',
                               width: 48,
                               height: 48,
                               fit: BoxFit.cover,
                             ),
                           ),
                           const SizedBox(width: 16),
                           const Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('DESTINATAIRE', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                               SizedBox(height: 2),
                               Text('Amadou Diallo', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                               Text('+221 77 123 45 67', style: TextStyle(fontSize: 12, color: Colors.grey)),
                             ],
                           )
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
               
               const SizedBox(height: 40),
               
               Row(
                 children: [
                   Expanded(
                     child: SizedBox(
                       height: 56,
                       child: ElevatedButton.icon(
                         onPressed: () {},
                         icon: const Icon(Icons.download, size: 20),
                         label: const Text('Download PDF'),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.grey.withOpacity(0.1),
                           foregroundColor: isDark ? Colors.white : Colors.black,
                           elevation: 0,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                         ),
                       ),
                     ),
                   ),
                   const SizedBox(width: 16),
                   Expanded(
                     child: SizedBox(
                       height: 56,
                       child: ElevatedButton.icon(
                         onPressed: () {},
                         icon: const Icon(Icons.share, size: 20),
                         label: const Text('Share Receipt'),
                         style: ElevatedButton.styleFrom(
                           backgroundColor: theme.primaryColor,
                           foregroundColor: Colors.white,
                           elevation: 0,
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                         ),
                       ),
                     ),
                   )
                 ],
               ),
               
               const SizedBox(height: 24),
               TextButton(
                 onPressed: () => context.go('/wallet-dashboard'),
                 child: const Text('Retour à l\'accueil', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
               )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
         Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
