import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
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
              const Text('Notifications', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
              const SizedBox(height: 8),
              Text('Restez informé de vos transactions et services.', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
              
              const SizedBox(height: 32),
              
              // Notification Card: Deposit
              _buildNotificationCard(
                icon: Icons.account_balance_wallet,
                title: 'Dépôt reçu: +5,000 FCFA',
                time: 'À l\'instant',
                description: 'Votre compte a été crédité avec succès via Orange Money.',
                isNew: true,
                isDark: isDark,
                theme: theme
              ),
              const SizedBox(height: 16),
              
              // Notification Card: Withdrawal
              _buildNotificationCard(
                icon: Icons.payments,
                title: 'Retrait réussi',
                time: 'Il y a 2h',
                description: 'Le retrait de 12,500 FCFA vers votre banque a été finalisé.',
                isNew: false,
                isDark: isDark,
                theme: theme
              ),
              const SizedBox(height: 16),
              
              // Notification Card: Order
              _buildNotificationCard(
                icon: Icons.shopping_bag,
                title: 'Nouvelle commande #123',
                time: 'Hier',
                description: 'Votre commande au restaurant "Le Gourmet" est en cours de livraison.',
                isNew: true,
                isDark: isDark,
                theme: theme
              ),
              
              const SizedBox(height: 24),
              
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.withOpacity(0.2))),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('ANCIENNES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.withOpacity(0.2))),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Earlier Notification
              Opacity(
                opacity: 0.7,
                child: _buildNotificationCard(
                  icon: Icons.history,
                  title: 'Mise à jour système',
                  time: '3 Jours',
                  description: 'De nouvelles fonctionnalités sont disponibles dans l\'onglet Services.',
                  isNew: false,
                  isDark: isDark,
                  theme: theme
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Quick action
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [theme.primaryColor, theme.primaryColor.withOpacity(0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: 0, right: -20,
                      child: Icon(Icons.notifications_active, size: 100, color: Colors.white10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Gérez vos alertes', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 8),
                        Text('Personnalisez la fréquence de vos notifications push.', style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8))),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => context.push('/settings'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: theme.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          child: const Text('Paramètres', style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required String title,
    required String time,
    required String description,
    required bool isNew,
    required bool isDark,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2122) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: isNew ? BorderSide(color: theme.primaryColor, width: 4) : BorderSide.none),
        boxShadow: isNew ? [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20, offset: const Offset(0, 4))] : [],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: isNew ? theme.primaryColor : Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                    Text(time, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: -0.5)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(description, style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
