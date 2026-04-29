import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WalletDashboardScreen extends StatelessWidget {
  const WalletDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark
            ? const Color(0xFF0F172A)
            : const Color(0xFF5F5F5F),
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAPD8TCxtePgxo9MKSsZndM9w7PlNW95ViFfg_lf_zyzcGxsuhZhLjjAbps9yGP1cOZgVbCUU8J35GhFV5D75uA3ALIIfch1NgeXfCAxyD8ZtD0MmlUKF--HamrzKvELOhPeDzB1ctrcWpqNbIb2gEV2zewN7EdOsa2hpOmv8YT_fHvsx8thuune94pDhVTXVXWW7n5OhFmmluUKyoXwxnKza8eysNDiJwNJ3HVwO7SnDC9z6YHd6-HFh2GWqFL97JEAXHefG2ljZ2R',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Tornadoes',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balances
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E2122) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SOLDE RÉEL',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '450.000',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'FCFA',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.trending_up,
                                size: 14,
                                color: Colors.green.shade600,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '+2.4%',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SOLDE EMPRUNT',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '125.000',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: theme.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'FCFA',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.info,
                                size: 14,
                                color: theme.primaryColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Limite: 500k',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: theme.primaryColor,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // QR Code
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF2D3435)
                      : const Color(0xFF2D3435), // strictly dark
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCmuIeCOO5kpWCsU38iHAaKhW7_EIYcxlGN_nfyCkZbnTr4b1kll2SIMG0nMRkirCeQho4jYaU2LnNP5KBG1fl6gu7Mx-Ke_1T4-Op0IkfXWzzfUZbAhpADv9zEDSDwOXhIBgG9gZ37Zp7JSzKJHJDIpjZ3VSrL-SDC8ovVifTWJr1CBUMVamJIqnthI89zkRddF3SYYZ9G3OA76tij4EqAowh13Tms33y8LrY6_sguzjG9Q1dCOmx81ekqYW26DyC6NTHlDMFk3qPa',
                        width: 128,
                        height: 128,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Scanner pour Payer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Utilisez ce code pour vos transactions instantanées Tornadoes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Actions Rapides
              const Text(
                'Actions Rapides',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildQuickAction(
                    theme,
                    Icons.payments,
                    'Paiement',
                    true,
                    () => context.push('/wallet-payment'),
                  ),
                  _buildQuickAction(
                    theme,
                    Icons.sync_alt,
                    'Transfert',
                    false,
                    () => context.push('/wallet-transfer-setup'),
                  ),
                  _buildQuickAction(
                    theme,
                    Icons.account_balance,
                    'Salaire',
                    false,
                    null,
                  ),
                  _buildQuickAction(
                    theme,
                    Icons.request_quote,
                    'Capital',
                    false,
                    () => context.push('/wallet-capital'),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Historique Récent
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Historique Récent',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Voir tout',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              _buildTransaction(
                theme,
                Icons.south_west,
                'Virement Reçu',
                'Hier, 14:20',
                '+15.000',
                Colors.green.shade600,
              ),
              const SizedBox(height: 12),
              _buildTransaction(
                theme,
                Icons.north_east,
                'Supermarché City',
                'Hier, 09:15',
                '-4.500',
                isDark ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 12),
              _buildTransaction(
                theme,
                Icons.bolt,
                'Facture Électricité',
                '12 Oct, 18:45',
                '-12.800',
                isDark ? Colors.white : Colors.black,
              ),

              const SizedBox(height: 100), // padding for nav bar
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction(
    ThemeData theme,
    IconData icon,
    String label,
    bool isPrimary,
    VoidCallback? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: isPrimary
                  ? theme.primaryColor
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: isPrimary
                  ? Colors.white
                  : (theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransaction(
    ThemeData theme,
    IconData icon,
    String title,
    String date,
    String amount,
    Color amountColor,
  ) {
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2122) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: amountColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  color: amountColor,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'FCFA',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
