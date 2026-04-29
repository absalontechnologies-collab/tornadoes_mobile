import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VendorOrderDetailsScreen extends StatelessWidget {
  const VendorOrderDetailsScreen({super.key});

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
        title: const Text('Détails Commande', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: 32, height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24, width: 2),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBPdbGUUoS45v3yDjVviTMTyUfHV2_zZCYvH9CprF7-N6bGr9E6gOH_Cgz2yWpxI8wiFPepdeWHbkr0GJUXfI9o01iHvPxzVkg7SodRsTSZRrRyrs9gMk6MwZfg0-HxEYY2MQG2xNMycTMe3DSPiBTZk6CYZabiDzI6L-SmE1Q0PAEGOEmk9fdbHQb_VMnWAo4zU1sESN_uzMu1o70MhlNmw1vTPnTbuzyaqdO1ibvNBoVcDI-jWvB_Uuib6k1F3cv8aytsM9A8dkzE'),
                  fit: BoxFit.cover
                )
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Identification
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E2122) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border(left: BorderSide(color: theme.primaryColor, width: 4)),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 24, offset: const Offset(0, 4))],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('NUMÉRO DE COMMANDE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                                  const SizedBox(height: 4),
                                  const Text('#ORD-88293-BJ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text('À PRÉPARER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Heure de commande', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                    const SizedBox(height: 4),
                                    const Text('14:20', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Total estimé', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                    const SizedBox(height: 4),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text('45.000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                                        const SizedBox(width: 4),
                                        const Text('FCFA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 154, // Match relative height to sibling
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('CLIENT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                          const SizedBox(height: 8),
                          const Text('Jean-Marc Koffi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(Icons.star, color: theme.primaryColor, size: 16),
                              const SizedBox(width: 4),
                              Text('Client Fidèle (4.9)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Preparation List
              Row(
                children: [
                  const Icon(Icons.inventory_2),
                  const SizedBox(width: 8),
                  const Text('Articles à préparer (2)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 16),
              
              _buildProductItem(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAA6-Sah_lhJ8STsDb46RzPkfckNw4AjHr98t3LEEC5FhKyZaebwGPCkq4OV-Yaj2w0DD6hCuNy_FbTLkJg7k-e0HYRcUzgFrBCbXkCtEvOkNyDeyG5MpG6e66crE_7R5CZMTJlkKbn0wPQdOKgSr-YbwXgz6VADBU9qOcSuVU3bm-oVMsQhnr2bK0tHbQjXNQKV8-6pd2AIsG_E1H3z0NbI1xml04BLu0LIWakLrNRXJeyVjtXgpqkvkeZWaKneqBH9CCnTOx1QRjJ',
                title: 'Salade César Premium',
                qty: 'x2',
                notes: 'Sans croûtons, sauce à part',
                category: 'CUISINE',
                isDark: isDark, theme: theme
              ),
              const SizedBox(height: 12),
              _buildProductItem(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAkn6VM9zdYthbG3RDyEPgCgw-Y22_6FqCgqFvYDS5pkEAZJgLKx2oNMiTs-VomUgTY0mzBYRO-BQKmqijnifZMY2gBnOyz-14VKHWsnal7nSHi7f0pa34Z76Z3KPmmkwOUTRmbyBvZNdr5hV12AvX-4zmNZXgocKrNqMQ5GZ4Us3fF3BwMPmuYqvwrySOjunr3LU7fLyUmBJKtMI93IGNTbdBeSR4llD6vJTUJsRkHL4fB657QzcZ6RkQSRulVn4Oyvksk-Ne9Mbym',
                title: 'Double Burger Black Angus',
                qty: 'x1',
                notes: 'Cuisson: À point',
                category: 'CUISINE',
                isDark: isDark, theme: theme
              ),
              
              const SizedBox(height: 32),
              
              // Courier Logistics
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.local_shipping, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('LOGISTIQUE LIVRAISON', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40, height: 40,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                              child: Icon(Icons.person, color: theme.primaryColor),
                            ),
                            const SizedBox(width: 16),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Moussa Diop', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text('Livreur assigné • Moto AB-122', style: TextStyle(fontSize: 10, color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 16, color: theme.primaryColor),
                            const SizedBox(width: 4),
                            Text('Arrivée dans 8 min', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 100), // Action bar spacing
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1A1A1A) : Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20)],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 56,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.call, color: Colors.grey),
                    label: const Text('Appeler le livreur', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                    label: const Text('Confirmer la préparation', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildProductItem({
    required String imageUrl,
    required String title,
    required String qty,
    required String notes,
    required String category,
    required bool isDark,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2122) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(imageUrl: imageUrl, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    Text(qty, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(notes, style: const TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                  child: Text(category, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                )
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Checkbox placeholder
          Container(
            width: 24, height: 24,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(4)),
          )
        ],
      ),
    );
  }
}
