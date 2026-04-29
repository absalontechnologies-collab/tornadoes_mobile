import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                children: [
                  _buildProfileHeader(theme),
                  const SizedBox(height: 24),
                  _buildKycStatus(theme),
                  const SizedBox(height: 32),
                  _buildPersonalInfo(theme),
                  const SizedBox(height: 32),
                  _buildSecuritySettings(theme),
                  const SizedBox(height: 32),
                  _buildDevHub(context, theme),
                  const SizedBox(height: 24),
                  _buildFooterLinks(),
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
      backgroundColor: const Color(0xFF5F5E5E),
      title: const Text(
        'Tornadoes',
        style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      centerTitle: false, // Left aligned in design
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {},
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Center(
            child: GestureDetector(
              onTap: () => context.push('/login'),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuA_x7Zw5oBTcf_GhfRc7HKi8MWv-vuyuv7MR4mtF9ERqrW6rQiqdZaZ0Cr4nSOkDGiGSfXiAsZySXD8DDSWr_-Sh9inxLstqi4JqC5zF-wcjkzjxUsVtCWeVAiHPsBF-R1F5D1hVJin3qI45Q05_zg_cPaln5zcywyUqJHxs-YWnDMZAjaSzpV0wzOJ3XS59b1AeDyfVQxPqLHtVVIYz_UqGDuXfvGzPIYVeN_KIMvHLaxHOYmXqzewPcjTW31R8Uljew5C_TNCyo-p',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader(ThemeData theme) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDDV5SdNypVTOoxXFSOMJ1ag3nq0HYYeWsFJFMa1QzYh0U6qS-zNZ5p_0xZmdg8W_LmVtlaqU7sKIcvxRj9dQMjMEZ-5vznk2AYnImmNns_CrS9ISAMibmOjIB0yaZUPgu2dz2HTQbb6-cmCiSr6YBw6-X9FEBzW6CjLpaUuyOlNEffZ2KgKCtwUHo6tXgVUvXdg-GJ93At4DLK4B4hh2zaJqXEzeU7-zwjZvyrrMI62noKtOFkB_HThv8eUIocmBmaFk9nqei-7omC',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
                child: const Icon(Icons.edit, size: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          'Jean-Luc Kouadio',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Verified Member since 2023',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildKycStatus(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ACCOUNT VERIFICATION',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'KYC Level 1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'ACTIVE',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Unlock higher transaction limits by completing Level 2.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 56,
            height: 56,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.5,
                  strokeWidth: 4,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  color: theme.primaryColor,
                ),
                const Text(
                  '50%',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'PERSONAL INFO',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildSettingItem(
                icon: Icons.person,
                title: 'Full Name',
                subtitle: 'Jean-Luc Kouadio',
                titleTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.0,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                theme: theme,
              ),
              Divider(
                height: 1,
                color: theme.dividerColor.withOpacity(0.1),
                indent: 16,
                endIndent: 16,
              ),
              _buildSettingItem(
                icon: Icons.call,
                title: 'Phone',
                subtitle: '+225 07 00 00 00 00',
                titleTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.0,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                theme: theme,
              ),
              Divider(
                height: 1,
                color: theme.dividerColor.withOpacity(0.1),
                indent: 16,
                endIndent: 16,
              ),
              _buildSettingItem(
                icon: Icons.location_on,
                title: 'Address',
                subtitle: 'Cocody, Abidjan, Côte d\'Ivoire',
                titleTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  letterSpacing: 1.0,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                theme: theme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSecuritySettings(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'SECURITY SETTINGS',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildSettingItem(
                icon: Icons.lock_reset,
                title: 'Change Transaction PIN',
                subtitle: 'LAST CHANGED 3 MONTHS AGO',
                theme: theme,
              ),
              Divider(
                height: 1,
                color: theme.dividerColor.withOpacity(0.1),
                indent: 16,
                endIndent: 16,
              ),
              _buildSettingItem(
                icon: Icons.fingerprint,
                title: 'Biometric Authentication',
                subtitle: 'FACE ID / FINGERPRINT',
                trailing: Switch(
                  value: true,
                  onChanged: (val) {},
                  activeColor: theme.primaryColor,
                ),
                theme: theme,
              ),
              Divider(
                height: 1,
                color: theme.dividerColor.withOpacity(0.1),
                indent: 16,
                endIndent: 16,
              ),
              _buildSettingItem(
                icon: Icons.no_accounts,
                iconColor: Colors.red.shade700,
                title: 'Deactivate Account',
                titleColor: Colors.red.shade700,
                hideArrow: true,
                theme: theme,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    Color? iconColor,
    required String title,
    String? subtitle,
    Color? titleColor,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    Widget? trailing,
    bool hideArrow = false,
    required ThemeData theme,
  }) {
    final effectiveIconColor = iconColor ?? theme.primaryColor;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: effectiveIconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:
                      titleTextStyle ??
                      TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style:
                        subtitleTextStyle ??
                        const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          letterSpacing: -0.2,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null)
            trailing
          else if (!hideArrow)
            const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildDevHub(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'DÉVELOPPEMENT & QA',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _showQaHubBottomSheet(context, theme),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.primaryColor.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: _buildSettingItem(
              icon: Icons.rocket_launch,
              iconColor: theme.primaryColor,
              title: 'Explorateur de Vues (QA Hub)',
              subtitle: 'ACCÉDER AUX 37 ÉCRANS DU PROTOTYPE',
              theme: theme,
              hideArrow: false,
            ),
          ),
        ),
      ],
    );
  }

  void _showQaHubBottomSheet(BuildContext context, ThemeData theme) {
    final routes = [
      '/splash',
      '/login',
      '/otp',
      '/pin-setup',
      '/kyc',
      '/product-detail',
      '/cart',
      '/order-tracking',
      '/promo',
      '/wallet-dashboard',
      '/topup',
      '/payment-confirmation',
      '/transaction-receipt',
      '/delivery-dashboard',
      '/delivery-request',
      '/delivery-tracking',
      '/delivery-steps',
      '/delivery-chat',
      '/delivery-earnings',
      '/trading-dashboard',
      '/trading-sale',
      '/trading-confirmation',
      '/trading-negotiation',
      '/trading-transit',
      '/trading-transit-details',
      '/vendor-dashboard',
      '/vendor-add-product',
      '/vendor-orders',
      '/vendor-order-details',
      '/notifications',
      '/settings',
      '/referral',
      '/',
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'QA Hub Navigation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Testez n\'importe quel écran de l\'application',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: routes.length,
                  separatorBuilder: (_, __) => Divider(
                    height: 1,
                    color: theme.dividerColor.withOpacity(0.1),
                  ),
                  itemBuilder: (context, index) {
                    final route = routes[index];
                    return ListTile(
                      title: Text(
                        route,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.open_in_new,
                        size: 16,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        context.pop(); // Close sheet
                        context.push(route); // Navigate
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFooterLinks() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'SUPPORT',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 2.0,
          ),
        ),
        SizedBox(width: 24),
        Text(
          'PRIVACY',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 2.0,
          ),
        ),
        SizedBox(width: 24),
        Text(
          'TERMS',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            letterSpacing: 2.0,
          ),
        ),
      ],
    );
  }
}
