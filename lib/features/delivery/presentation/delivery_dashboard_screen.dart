import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../core/services/pusher_service.dart';
import '../data/providers/delivery_provider.dart';

class DeliveryDashboardScreen extends ConsumerStatefulWidget {
  const DeliveryDashboardScreen({super.key});

  @override
  ConsumerState<DeliveryDashboardScreen> createState() => _DeliveryDashboardScreenState();
}

class _DeliveryDashboardScreenState extends ConsumerState<DeliveryDashboardScreen> {
  bool isOnline = true;

  @override
  void initState() {
    super.initState();
    // Souscription Pusher pour les notifications en temps réel
    PusherService.subscribeToNewDeliveries((event) {
      if (mounted && isOnline) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Nouvelle mission disponible: ${event.data}'),
            backgroundColor: Theme.of(context).primaryColor,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    PusherService.unsubscribeFromDeliveries();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF2D3435) : const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text('Espace Livreur', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Toggle & Greeting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bon retour,', style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w500)),
                    Text(user?.userMetadata?['full_name'] ?? 'Partenaire', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => isOnline = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isOnline ? theme.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: isOnline ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)] : null,
                          ),
                          child: Text('En Ligne', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isOnline ? Colors.white : Colors.grey)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => isOnline = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: !isOnline ? theme.primaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: !isOnline ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)] : null,
                          ),
                          child: Text('Hors Ligne', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: !isOnline ? Colors.white : Colors.grey)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            
            // Earnings Summary Bento Grid
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 140,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -10,
                          bottom: -10,
                          child: Icon(Icons.payments, size: 80, color: Colors.white.withOpacity(0.1)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Revenus du Jour', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 4),
                                ref.watch(driverEarningsProvider).when(
                                  data: (earnings) => Row(
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(earnings.toStringAsFixed(0), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white)),
                                      const SizedBox(width: 4),
                                      Text('FCFA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8))),
                                    ],
                                  ),
                                  loading: () => const CircularProgressIndicator(color: Colors.white),
                                  error: (_, __) => const Text('Erreur', style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.trending_up, color: Colors.white, size: 14),
                                  SizedBox(width: 4),
                                  Text('+12% vs Hier', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E2122) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('EN ATTENTE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                        const SizedBox(height: 8),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('3 200', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Text('FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 14, color: theme.primaryColor),
                            const SizedBox(width: 4),
                            Text('Demain', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E2122) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('COURSES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                        const SizedBox(height: 8),
                        ref.watch(assignedDeliveriesProvider).when(
                          data: (deliveries) => Text(deliveries.length.toString().padLeft(2, '0'), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          loading: () => const SizedBox(height: 24, width: 24, child: CircularProgressIndicator()),
                          error: (_, __) => const Text('!', style: TextStyle(fontSize: 20, color: Colors.red)),
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          children: [
                            Icon(Icons.check_circle, size: 14, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('Aujourd\'hui', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            if (isOnline) ...[
              // Commandes à proximité
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Commandes disponibles', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('VOIR TOUT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey.shade600, letterSpacing: 1.0)),
                ],
              ),
              const SizedBox(height: 16),
              
              ref.watch(pendingDeliveriesProvider).when(
                data: (deliveries) {
                  if (deliveries.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Text('Aucune commande disponible pour le moment.', style: TextStyle(color: Colors.grey)),
                      ),
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: deliveries.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final delivery = deliveries[index];
                      return _buildDeliveryCard(delivery, theme, isDark);
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Erreur: $error', style: TextStyle(color: theme.colorScheme.error))),
              ),
            ] else ...[
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Column(
                    children: [
                      Icon(Icons.power_off, size: 64, color: Colors.grey.shade400),
                      const SizedBox(height: 16),
                      Text('Vous êtes hors ligne', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                      const SizedBox(height: 8),
                      Text('Passez en ligne pour recevoir des demandes', style: TextStyle(fontSize: 14, color: Colors.grey.shade500)),
                    ],
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryCard(Map<String, dynamic> delivery, ThemeData theme, bool isDark) {
    final rawId = delivery['id']?.toString() ?? 'N/A';
    final id = '#ORD-${rawId.length > 4 ? rawId.substring(rawId.length - 4) : rawId}';
    final amount = delivery['total_amount']?.toString() ?? '0';
    
    return GestureDetector(
      onTap: () {
        // Optionnel: Passer l'objet de commande à la prochaine vue
        context.push('/delivery-request', extra: delivery);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E2122) : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.fastfood, color: theme.primaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Commande $id', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  const Text('À proximité', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                    const SizedBox(width: 2),
                    const Text('FCFA', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 4),
                const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
              ],
            )
          ],
        ),
      ),
    );
  }
}
