import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeliveryStepsScreen extends StatelessWidget {
  const DeliveryStepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          // Upper half map simulation
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Container(
              color: isDark ? const Color(0xFF1E2122) : Colors.grey.shade300,
              child: Image.network(
               'https://lh3.googleusercontent.com/aida-public/AB6AXuAiMyMLpKArTDFcg-h1Ot9oDD6oOJYlNRsOWeixLi4kyPKGLGsFcPyP305IU5c_xjtM4L9DBSgBAOEczOsCqtlXL-Ramz426WPaXIUU4X_Bzjs9oT1Kjc9PboVkRzR-Jye_boHd196CUveKQMfZgu2zwCsrl3fAEtNYJZj_6k6yirgW5N6f-xigokQs7eyevkFStNi-2tsPp9e0XERXl69FVPgZP56N7OtX9JV_9AtDSx5CI45ybS9oImO9bsQihWNF3l__zwHWrnKK',
               fit: BoxFit.cover,
               color: isDark ? Colors.black54 : Colors.grey.shade400,
               colorBlendMode: BlendMode.multiply,
              ),
            ),
          ),
          
          // Map Overlay Elements
          Positioned(
            top: 60,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Direction Overlay
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2D3435).withOpacity(0.9) : Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: theme.primaryColor, shape: BoxShape.circle),
                        child: const Icon(Icons.navigation, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DIRECTION', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                          Text('Tourner à gauche sur Boulevard Valéry', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
                // ETA Overlay
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF2D3435).withOpacity(0.9) : Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
                  ),
                  child: Column(
                    children: [
                      Text('12', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: theme.primaryColor, height: 1.0)),
                      const Text('MIN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
          ),

          // Lower half sheet
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4 - 32,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 24),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E2122) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, -5))],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stepper
                    SizedBox(
                      height: 80,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 24,
                            left: 20,
                            right: 20,
                            child: Container(
                              height: 2,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildStepOption(icon: Icons.restaurant, label: 'Enlèvement', isActive: true, isCompleted: true, theme: theme),
                              _buildStepOption(icon: Icons.local_shipping, label: 'En route', isActive: true, isCompleted: false, theme: theme),
                              _buildStepOption(icon: Icons.person_pin_circle, label: 'Client', isActive: false, isCompleted: false, theme: theme),
                            ],
                          )
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('En route vers le client', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: -0.5)),
                            SizedBox(height: 4),
                            Text('Commande #BDR-88291', style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: Text('3.2 km', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Route Cards
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.grey),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('ORIGINE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                const SizedBox(height: 2),
                                const Text('Le Gourmet Palace', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                Text('Rue des Jardins, Plateau', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border(left: BorderSide(color: theme.primaryColor, width: 4)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.near_me, color: theme.primaryColor),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('DESTINATION', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                                const SizedBox(height: 2),
                                const Text('M. Jean-Luc Koffi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                Text('Immeuble Horizon, Cocody Danga', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF2D3435) : Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
                            ),
                            child: const Icon(Icons.call, size: 20),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Order Note
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Détails', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                              Text('2 Articles', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('"Prudence avec les boissons fraîches, merci !"', style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey.shade600)),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Confirm Button
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                           context.go('/delivery-dashboard');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 4,
                          shadowColor: theme.primaryColor.withOpacity(0.4),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Confirmer la livraison', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                            SizedBox(width: 12),
                            Icon(Icons.check_circle, size: 24),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 20)),
              onPressed: () => context.pop(),
            )
          )
        ],
      ),
    );
  }
  
  Widget _buildStepOption({required IconData icon, required String label, required bool isActive, required bool isCompleted, required ThemeData theme}) {
    Color getBgColor() {
      if (isCompleted) return theme.primaryColor;
      if (isActive) return theme.primaryColor;
      return Colors.grey.withOpacity(0.2);
    }
    
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: getBgColor(),
            shape: BoxShape.circle,
            border: isActive && !isCompleted ? Border.all(color: theme.primaryColor.withOpacity(0.3), width: 4) : null,
          ),
          child: Icon(icon, color: isActive ? Colors.white : Colors.grey, size: 20),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isActive ? (isCompleted ? theme.primaryColor : Colors.black) : Colors.grey)),
      ],
    );
  }
}
