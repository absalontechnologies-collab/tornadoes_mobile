import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TradingNegotiationScreen extends StatefulWidget {
  const TradingNegotiationScreen({super.key});

  @override
  State<TradingNegotiationScreen> createState() => _TradingNegotiationScreenState();
}

class _TradingNegotiationScreenState extends State<TradingNegotiationScreen> {
  double _sliderValue = 825000;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
            Text('Négociation Rachat', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Comparison Hero Section
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('PLATFORM OFFER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('750.000', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: theme.primaryColor)),
                          ],
                        ),
                        const Text('FCFA', style: TextStyle(fontSize: 10, color: Colors.grey)),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            children: [
                              Icon(Icons.verified, size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Expanded(child: Text('Standard automated valuation', style: TextStyle(fontSize: 10, color: Colors.grey))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E2122) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('YOUR COUNTER-OFFER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(_sliderValue.toStringAsFixed(0), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
                          ],
                        ),
                        const Text('FCFA', style: TextStyle(fontSize: 10, color: Colors.grey)),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(color: theme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Icon(Icons.trending_up, size: 16, color: theme.primaryColor),
                              const SizedBox(width: 4),
                              Expanded(child: Text('+10% above avg', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: theme.primaryColor))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Negotiation Engine
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ajuster le prix', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Drag to propose target price', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('GAP TO FILL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                    const SizedBox(height: 2),
                    Text('${(_sliderValue - 750000).abs().toStringAsFixed(0)} FCFA', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
            
            const SizedBox(height: 32),
            
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: theme.primaryColor,
                inactiveTrackColor: Colors.grey.withOpacity(0.2),
                thumbColor: theme.primaryColor,
                trackHeight: 6,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12, elevation: 4),
              ),
              child: Slider(
                value: _sliderValue,
                min: 700000,
                max: 950000,
                divisions: 50,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Min: 700.000', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                  Text('Suggest: 800.000', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                  Text('Max: 950.000', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Contextual Details
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Détails du rachat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Asset ID', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text('#TRN-294-B', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Divider(color: Colors.grey.withOpacity(0.2))),
                  
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Estimated Turnaround', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text('48 Hours', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Divider(color: Colors.grey.withOpacity(0.2))),
                  
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service Fee', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text('2.500 FCFA', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Action Matrix
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send, color: Colors.white),
                label: const Text('Submit Counter-proposal', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Accept Platform Offer (750k)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
              ),
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
