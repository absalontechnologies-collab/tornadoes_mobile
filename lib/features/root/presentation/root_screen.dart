import 'package:flutter/material.dart';
import 'package:tornadoes_app/core/widgets/bottom_nav_bar.dart';
import 'package:tornadoes_app/features/home/presentation/home_screen.dart';
import 'package:tornadoes_app/features/search/presentation/search_screen.dart';
import 'package:tornadoes_app/features/history/presentation/history_screen.dart';
import 'package:tornadoes_app/features/wallet/presentation/wallet_dashboard_screen.dart';
import 'package:tornadoes_app/features/trading/presentation/trading_dashboard_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _navIndex,
            children: [
              HomeScreen(),
              WalletDashboardScreen(),
              SearchScreen(),
              TradingDashboardScreen(), // Replaced Profile Placeholder
              HistoryScreen(), // Replaced History Placeholder
            ],
          ),
          CustomBottomNavBar(
            currentIndex: _navIndex,
            onTap: (val) {
              setState(() => _navIndex = val);
            },
          ),
        ],
      ),
    );
  }
}
