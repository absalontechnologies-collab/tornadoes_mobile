import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/repositories/trading_repository.dart';

class TradingTransitDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> session;

  const TradingTransitDetailsScreen({super.key, required this.session});

  @override
  State<TradingTransitDetailsScreen> createState() => _TradingTransitDetailsScreenState();
}

class _TradingTransitDetailsScreenState extends State<TradingTransitDetailsScreen> {
  late Timer _ejectionTimer;
  Duration _remainingTime = const Duration(hours: 14, minutes: 22);
  final TradingRepository _tradingRepository = TradingRepository();

  @override
  void initState() {
    super.initState();
    _startEjectionTimer();
  }

  void _startEjectionTimer() {
    // Determine end time from session or mock it
    DateTime endTime;
    if (widget.session['end_time'] != null) {
      endTime = DateTime.parse(widget.session['end_time']);
    } else {
      endTime = DateTime.now().add(const Duration(minutes: 5)); // Mock 5 mins for demo
    }

    _ejectionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      if (now.isAfter(endTime)) {
        timer.cancel();
        _handleEjection();
      } else {
        if (mounted) {
          setState(() {
            _remainingTime = endTime.difference(now);
          });
        }
      }
    });
  }

  void _handleEjection() {
    final sessionId = widget.session['id']?.toString();
    if (sessionId != null) {
      _tradingRepository.ejectSession(sessionId);
    }
    
    if (mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          title: const Text('Temps Écoulé'),
          content: const Text('Le temps imparti pour ce trade est terminé. Vous allez être redirigé vers le tableau de bord.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                context.go('/trading-dashboard');
              },
              child: const Text('Compris'),
            )
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _ejectionTimer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${hours}h ${minutes}m ${seconds}s";
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final sessionId = widget.session['id']?.toString();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF2D3435) : const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Row(
          children: [
            Icon(Icons.storm, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text('Tornadoes Trading', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
      body: sessionId == null ? const Center(child: Text("Session Introuvable")) : StreamBuilder<Map<String, dynamic>?>(
        stream: _tradingRepository.getSessionDetails(sessionId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
             return Center(child: Text('Erreur: ${snapshot.error}'));
          }

          final sessionData = snapshot.data ?? widget.session;
          final currentPrice = sessionData['current_price'] ?? '450000';
          final currentOwner = sessionData['current_owner_id'] ?? 'En Attente';

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Product Insight
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E2122) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                              child: CachedNetworkImage(
                                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBazFJtdkaPV2aWlbjLf2hmL0687Lenj4GbeU0l_lI6AM_xjafkTA9Cm9e1Y46cPhHSFDpz21NT2ti_kpbAV_s8PU90PSmtrxk8gMAjDH9csnV6ffu31MdEQRINPJFSmx-eVuKS9MEH0bJvsD95Hw5xAIsI-jgK47Wj-hGox58F-yIFAMY7NszaKphiTDL8eN5hg8ayTihW3k8j3iMS2omY6sqqdXCQ42LkK2azDiqfX27Ya8oFq2BZgsAZOATmGowBdxMurFjb107_',
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 16,
                              left: 16,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(20)),
                                child: const Text('EN TRANSIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0)),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(sessionData['product_name'] ?? 'Kinetix Chrono v2', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                              const SizedBox(height: 8),
                              Text('High-performance mechanical timepiece...', style: TextStyle(fontSize: 12, color: Colors.grey.shade600, height: 1.5)),
                              const SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('TEMPS RESTANT', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                          const SizedBox(height: 4),
                                          Text(_formatDuration(_remainingTime), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _remainingTime.inMinutes < 5 ? Colors.red : theme.primaryColor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('VALEUR ACTUELLE', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                          const SizedBox(height: 4),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.baseline,
                                            textBaseline: TextBaseline.alphabetic,
                                            children: [
                                              Text('$currentPrice', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                                              const SizedBox(width: 2),
                                              const Text('FCFA', style: TextStyle(fontSize: 8, color: Colors.grey)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                     // Simulate buy action
                                     _tradingRepository.buyTradingRight(sessionId, (double.tryParse(currentPrice.toString()) ?? 450000) + 10000, 'User_${DateTime.now().millisecondsSinceEpoch}');
                                  },
                                  icon: const Icon(Icons.shopping_cart, color: Colors.white),
                                  label: const Text('Acheter le Droit', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.primaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Ownership Chain
                  Row(
                    children: [
                      Icon(Icons.account_tree, color: theme.primaryColor),
                      const SizedBox(width: 8),
                      const Text('Chaîne de Propriété', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Current Owner
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E2122) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border(left: BorderSide(color: theme.primaryColor, width: 4)),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('PROPRIÉTAIRE ACTUEL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                            Icon(Icons.verified, size: 16, color: theme.primaryColor),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                              width: 48, height: 48,
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
                              child: const Icon(Icons.person, color: Colors.grey),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(currentOwner, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text('Acquis récemment', style: TextStyle(fontSize: 10, color: Colors.grey.shade600)),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('+12% ROI', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                                const SizedBox(height: 4),
                                const Text('Rendement', style: TextStyle(fontSize: 10, color: Colors.grey)),
                              ],
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
          );
        }
      ),
    );
  }
}
