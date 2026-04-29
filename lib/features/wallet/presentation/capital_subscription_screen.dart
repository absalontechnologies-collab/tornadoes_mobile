import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CapitalSubscriptionScreen extends StatelessWidget {
  const CapitalSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final surfaceColor = isDark ? const Color(0xFF1E2122) : Colors.white;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: isDark ? Colors.white : Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Capital',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Souscription & Emprunt',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Prenez connaissance de nos termes et conditions.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 32),
                
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Conditions Générales',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '1. Objet du crédit\n'
                        'Ce document définit les termes et conditions liés à l\'octroi d\'un micro-crédit au sein de l\'écosystème Tornadoes.\n\n'
                        '2. Taux d\'intérêt\n'
                        'Un taux d\'intérêt fixe de 3% mensuel s\'applique, calculé sur le montant emprunté. Les frais administratifs de dossier sont facturés séparément.\n\n'
                        '3. Engagements du souscripteur\n'
                        'En approuvant ces termes, vous vous engagez à restituer l\'intégrité des fonds alloués à la date d\'échéance convenue.\n\n'
                        '4. Pénalités de retard\n'
                        'Le non-respect du délai de remboursement entraînera l\'application de pénalités conformément à la législation en vigueur et nos politiques internes.\n\n'
                        '5. Politique de Confidentialité\n'
                        'Tornadoes traite vos données financières avec la plus stricte confidentialité, conformément aux normes de sécurité internationales.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100), // padding for fixed button
              ],
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 24,
            child: ElevatedButton(
              onPressed: () {
                context.pop(); // Go back after approval
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? Colors.white : const Color(0xFF5F5F5F),
                foregroundColor: isDark ? Colors.black : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'J\'approuve',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
