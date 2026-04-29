import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5E5E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text('SUPERAPP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 2.0)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () => context.push('/notifications'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCOpoK2rnslaIzzUuer7ChEyzFDOS0kqCyvrWJlyCWY0F3TT0oJ3XnptPcGqDV3qem8EfLiDsPYDwONv3L2KXCmcxM4J7148c1xyg8v_AeJaJKx8I6G8Y6Ow_bs7qbWkrcwBPcTjaPbVdszPqnT7T8oxXgWyq4JTjR5M6CXZm3gAylI510mVHWCnpWOL1ebeSrVWGFAPpz2-wu5qGAAL8d1QF6PdwbAlxYS2yrvxxW9sTYdmZ3iIJ0Br6BBHGn-MgeHIglk44vFDd_B',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.multiply,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [theme.primaryColor.withOpacity(0.4), Colors.transparent],
                        )
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Parrainez un ami et gagnez\n1,000 FCFA', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, height: 1.2)),
              const SizedBox(height: 12),
              Text('Développez la communauté Tornadoes et profitez de récompenses exclusives pour chaque nouveau membre actif.', style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5)),
              
              const SizedBox(height: 32),
              
              // Referral Code
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E2122) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.withOpacity(0.1)),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 4))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('VOTRE CODE UNIQUE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 2.0)),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('TRND-882X', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                              IconButton(
                                icon: Icon(Icons.content_copy, color: theme.primaryColor),
                                onPressed: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Share Action
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('PARTAGER MAINTENANT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.7), letterSpacing: 2.0)),
                        const SizedBox(height: 8),
                        const Text('Inviter des contacts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                    Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), shape: BoxShape.circle),
                      child: const Icon(Icons.share, color: Colors.white),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Friends List
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Amis Parrainés', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('3 TOTAL', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade600, letterSpacing: 1.0)),
                ],
              ),
              const SizedBox(height: 16),
              Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
              const SizedBox(height: 16),
              
              _buildFriendItem('JD', 'Jean Dupont', '12 Oct.', 'Pending', '0 FCFA', false, isDark, theme),
              const SizedBox(height: 12),
              _buildFriendItem('MK', 'Marie Koné', '05 Oct.', 'Completed', '+1,000 FCFA', true, isDark, theme),
              const SizedBox(height: 12),
              _buildFriendItem('AS', 'Amadou Sow', '28 Sept.', 'Completed', '+1,000 FCFA', true, isDark, theme),
              
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFriendItem(String initials, String name, String date, String status, String reward, bool isCompleted, bool isDark, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2122) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: isCompleted ? [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 4))] : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(color: isCompleted ? theme.primaryColor.withOpacity(0.1) : Colors.grey.withOpacity(0.1), shape: BoxShape.circle),
                child: Center(child: Text(initials, style: TextStyle(fontWeight: FontWeight.bold, color: isCompleted ? theme.primaryColor : Colors.grey))),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Inscrit le $date', style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isCompleted ? theme.primaryColor : Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(status.toUpperCase(), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isCompleted ? Colors.white : Colors.grey, letterSpacing: 1.0)),
              ),
              const SizedBox(height: 8),
              Text(reward, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isCompleted ? theme.primaryColor : Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
