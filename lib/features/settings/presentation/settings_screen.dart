import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/auth_provider.dart';
import '../providers/role_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _biometricsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final user = ref.watch(currentUserProvider);
    final rolesAsync = ref.watch(userRolesProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Paramètres Profil',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () => context.push('/notifications'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // KYC Status
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NIVEAU DE VÉRIFICATION',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Niveau 2',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: theme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'KYC Complété à 85%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: CircularProgressIndicator(
                            value: 0.85,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            color: theme.primaryColor,
                            strokeWidth: 4,
                          ),
                        ),
                        Icon(Icons.verified, color: theme.primaryColor),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Account Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Information du Compte',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ÉDITER',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    _buildAccountItem(
                      Icons.person,
                      'Nom complet',
                      user?.userMetadata?['full_name'] ?? 'Utilisateur',
                      isDark,
                      theme,
                    ),
                    Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                    _buildAccountItem(
                      Icons.mail,
                      'Email',
                      user?.email ?? 'Non renseigné',
                      isDark,
                      theme,
                    ),
                    Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                    _buildAccountItem(
                      Icons.phone,
                      'Téléphone',
                      user?.phone ?? 'Non renseigné',
                      isDark,
                      theme,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Rôles & Accès
              const Text(
                'Accès Spéciaux',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    rolesAsync.when(
                      data: (roles) {
                        if (roles.isEmpty) {
                          return ListTile(
                            leading: Icon(Icons.info_outline, color: theme.primaryColor),
                            title: const Text('Aucun accès spécial'),
                            subtitle: const Text('Demander un statut de Fournisseur ou Livreur'),
                          );
                        }
                        return Column(
                          children: roles.map((role) {
                            String roleName = role;
                            IconData roleIcon = Icons.star;
                            String route = '/';
                            if (role == 'vendor') {
                              roleName = 'Fournisseur';
                              roleIcon = Icons.storefront;
                              route = '/vendor-dashboard';
                            } else if (role == 'delivery') {
                              roleName = 'Livreur';
                              roleIcon = Icons.local_shipping;
                              route = '/delivery-dashboard';
                            }
                            return ListTile(
                              leading: Icon(roleIcon, color: theme.primaryColor),
                              title: Text('Statut $roleName', style: const TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: const Text('Accéder à votre espace', style: TextStyle(fontSize: 12)),
                              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                              onTap: () => context.push(route),
                            );
                          }).toList(),
                        );
                      },
                      loading: () => const Padding(padding: EdgeInsets.all(16.0), child: Center(child: CircularProgressIndicator())),
                      error: (err, stack) => Padding(padding: const EdgeInsets.all(16.0), child: Text('Erreur: $err')),
                    ),
                    Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                    ListTile(
                      leading: Icon(Icons.add_circle_outline, color: theme.primaryColor),
                      title: const Text('Demander un nouveau statut', style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => context.push('/role-request'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Security
              const Text(
                'Sécurité',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.lock_reset,
                          color: theme.primaryColor,
                        ),
                      ),
                      title: const Text(
                        'Changer le code PIN',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                    Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.fingerprint,
                          color: theme.primaryColor,
                        ),
                      ),
                      title: const Text(
                        'Biométrie',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Utiliser FaceID / Empreinte',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      trailing: Switch(
                        value: _biometricsEnabled,
                        activeThumbColor: theme.primaryColor,
                        onChanged: (val) {
                          setState(() {
                            _biometricsEnabled = val;
                          });
                        },
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.phonelink_lock,
                          color: theme.primaryColor,
                        ),
                      ),
                      title: const Text(
                        'Double Authentification',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Non activé',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Support & Legal
              const Text(
                'Support & Légal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 2.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildSupportItem(Icons.headset_mic, 'Support Client', theme),
                  _buildSupportItem(Icons.gavel, 'Conditions', theme),
                  _buildSupportItem(Icons.policy, 'Confidentialité', theme),
                  _buildSupportItem(Icons.help_center, 'FAQ', theme),
                ],
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'Se Déconnecter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(0.05),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'VERSION 2.4.1 (BUILD 890)',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountItem(
    IconData icon,
    String label,
    String value,
    bool isDark,
    ThemeData theme,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: theme.primaryColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSupportItem(IconData icon, String label, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: theme.primaryColor, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
