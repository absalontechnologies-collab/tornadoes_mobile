import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen({super.key});

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
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('TORNADOES', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20, letterSpacing: 2.0)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBfqsN2X0LMjn43b6OpQBDGU6ymRQ0Bvqa1qzNsJNi1OwMPnW1W3PIBQgzgFlE-DHelFgN_8NTsHLlzNHYZNUM4hrQfjd8Yz3avkAUk-heaKzkyV8maeVQTbWNyo5ld3PTHdSBNxFKU_MDDbTmzESVjjaZtWZUFNo0CzYuYR0DPLxNzSjvgkY6QsBUzBtwXOx4JJCt6mfezfPGnZXa1gpDnCrMrwzPMVPGU9rF2Uh35xMXi8yivfJg5Fbe_viXnLSGKx0VbQ7ZwKHen',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Checkmark Simulation
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green.withOpacity(0.2)),
                    boxShadow: [
                      BoxShadow(color: Colors.green.withOpacity(0.2), blurRadius: 40),
                    ],
                  ),
                  child: Icon(Icons.check_circle, color: Colors.green.shade600, size: 48),
                ),
                const SizedBox(height: 40),
                
                const Text('Paiement effectué avec succès !', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, height: 1.1, letterSpacing: -0.5)),
                const SizedBox(height: 8),
                const Text('Votre transaction a été traitée instantanément.', style: TextStyle(color: Colors.grey)),
                
                const SizedBox(height: 48),
                
                // Content Card
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                       const Text('MONTANT PAYÉ', style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                       const SizedBox(height: 8),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.baseline,
                         textBaseline: TextBaseline.alphabetic,
                         children: [
                            Text('8 500', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: theme.primaryColor)),
                            const SizedBox(width: 4),
                            Text('FCFA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                         ],
                       ),
                       const Padding(
                         padding: EdgeInsets.symmetric(vertical: 32.0),
                         child: Divider(),
                       ),
                       _buildRow('Mode de paiement', 'Wallet Principal'),
                       const SizedBox(height: 16),
                       _buildRow('Référence', '#TRN-9823-XP', isMono: true),
                       const SizedBox(height: 16),
                       _buildRow('Date & Heure', 'Aujourd\'hui, 14:32'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),
                
                // Buttons
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/wallet-dashboard');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? const Color(0xFF2D3435) : const Color(0xFF4A4A4A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Retour à l\'accueil', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/transaction-receipt');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      foregroundColor: isDark ? Colors.white : Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Télécharger le reçu', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                
                const SizedBox(height: 48),
                // Security Note
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    children: [
                       Icon(Icons.security, color: Colors.grey),
                       SizedBox(height: 16),
                       Text('Paiement sécurisé par cryptage de bout en bout.', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildRow(String label, String value, {bool isMono = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
         Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: isMono ? 'Courier' : null)),
      ],
    );
  }
}
