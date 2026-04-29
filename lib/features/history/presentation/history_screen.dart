import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildSearchControls(theme),
                  const SizedBox(height: 32),
                  _buildTransactionGroup('TODAY', 'OCT 24, 2023', [
                    _TransactionItem(
                      icon: Icons.payments,
                      iconColor: theme.primaryColor,
                      title: 'Monthly Salary',
                      subtitle: 'Salary • 09:42 AM',
                      amount: '+ 450.000',
                      status: 'COMPLETED',
                      isPositive: true,
                    ),
                    _TransactionItem(
                      icon: Icons.shopping_bag,
                      iconColor: theme.primaryColor,
                      title: 'Supermarché Casino',
                      subtitle: 'Payment • 11:15 AM',
                      amount: '- 34.500',
                      status: 'COMPLETED',
                      isPositive: false,
                    ),
                  ]),
                  const SizedBox(height: 24),
                  _buildTransactionGroup('YESTERDAY', 'OCT 23, 2023', [
                    _TransactionItem(
                      icon: Icons.send,
                      iconColor: theme.primaryColor,
                      title: 'To Amadou Diallo',
                      subtitle: 'Transfer • 04:20 PM',
                      amount: '- 15.000',
                      status: 'COMPLETED',
                      isPositive: false,
                    ),
                    _TransactionItem(
                      icon: Icons.account_balance,
                      iconColor: theme.primaryColor,
                      title: 'Quick Nano Loan',
                      subtitle: 'Loan • 08:30 AM',
                      amount: '+ 25.000',
                      status: 'APPROVED',
                      isPositive: true,
                    ),
                  ]),
                  const SizedBox(height: 24),
                  _buildTransactionGroup('EARLIER', 'OCT 21, 2023', [
                    _TransactionItem(
                      icon: Icons.warning,
                      iconColor: Colors.red.shade700,
                      iconBgColor: Colors.red.withOpacity(0.1),
                      title: 'Total Energies',
                      subtitle: 'Payment • 02:12 PM',
                      amount: '- 22.000',
                      status: 'FAILED',
                      isPositive: false,
                      isFailed: true,
                    ),
                  ]),
                  const SizedBox(height: 100), // padding for bottom nav
                ],
              ),
            ),
          )
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
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {},
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: ClipOval(
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuC-4UqMDH3Z9xLGDHAkbuKdbmrvEvBQcj4YMN5bMLqhYaZmfcbQ-XozMzz7GDvLmjjSrM6b2wj1LNO7BdTW8rEDGtEJRqmSCbi_N7xhc3baQk4G0WhbyKXJOyVfR_dwnV-vAS4Wc18dXFImZ212ROtIos50CVaVQzBtX4fKyS9sLUtTL3H2tFAQjcQNmbucfmmy9uAJJLMNmtxHshc5BeuNlT0tAgnv_3bXDlJlopn1XAFppSFXbnc402E3Cpeou7FuM6bIfVFicUOk',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transaction History',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -0.5),
        ),
        SizedBox(height: 4),
        Text(
          'Detailed overview of your financial movements',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSearchControls(ThemeData theme) {
    return Column(
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search by name or type...',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildFilterBadge('Last 30 Days', icon: Icons.calendar_today, isSelected: true, theme: theme),
              const SizedBox(width: 8),
              _buildFilterBadge('All Types', theme: theme),
              const SizedBox(width: 8),
              _buildFilterBadge('Status', theme: theme),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFilterBadge(String text, {IconData? icon, bool isSelected = false, required ThemeData theme}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? theme.primaryColor : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: isSelected ? Colors.white : Colors.grey.shade700),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade700,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionGroup(String title, String date, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2.0, color: Colors.grey),
            ),
            Text(
              date,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          children: items.map((item) => Padding(padding: const EdgeInsets.only(bottom: 12), child: item)).toList(),
        )
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color? iconBgColor;
  final String title;
  final String subtitle;
  final String amount;
  final String status;
  final bool isPositive;
  final bool isFailed;

  const _TransactionItem({
    required this.icon,
    required this.iconColor,
    this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.status,
    required this.isPositive,
    this.isFailed = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
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
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor ?? Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: amount,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isFailed ? Colors.grey : (isPositive ? theme.primaryColor : (isDark ? Colors.white : Colors.black)),
                    decoration: isFailed ? TextDecoration.lineThrough : null,
                  ),
                  children: const [
                    TextSpan(text: ' FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isFailed ? Colors.red.withOpacity(0.2) : (isPositive ? theme.primaryColor.withOpacity(0.1) : Colors.grey.withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isFailed ? Colors.red.shade700 : (isPositive ? theme.primaryColor : Colors.grey.shade700),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
