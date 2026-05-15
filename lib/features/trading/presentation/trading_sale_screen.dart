import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/repositories/trading_repository.dart';

class TradingSaleScreen extends StatefulWidget {
  final String sessionId;

  const TradingSaleScreen({super.key, this.sessionId = '12345'});

  @override
  State<TradingSaleScreen> createState() => _TradingSaleScreenState();
}

class _TradingSaleScreenState extends State<TradingSaleScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TradingRepository _tradingRepository = TradingRepository();
  bool _isLoading = false;

  void _listForSale() async {
    final priceStr = _priceController.text.trim();
    if (priceStr.isEmpty) return;

    final newPrice = double.tryParse(priceStr);
    if (newPrice == null) return;

    setState(() {
      _isLoading = true;
    });

    await _tradingRepository.sellTradingRight(widget.sessionId, newPrice);

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      context.push('/trading-confirmation');
    }
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

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
        title: const Text('Tornadoes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDSl33woWBFuAmoAZomD1jB1-jSP1hMyDcXg1DzUwrIp9AXtq3e-IVnXIxhgrY1Ux6iD7r4VTQkK8a9J5SSdgE6v8qmzKS9QBjFXZ1muQnq20kh6YHMiN9kHhI8pRtrQIvpJNUVJF0L1z9PvT0Ie98D3Ou6QIcMUTJh_gZfqPahz-5W73BTl6m2i0Yxv0GfIRMOcmxAwzc7vTURzgC14z1l66pNMC5LaPunXKyI28tiQcZQFZce0MUwgCrG5NWa_dhCIFp-v1n1YeOG',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text('List Asset for Resale', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -1.0)),
              const SizedBox(height: 8),
              const Text('Community Trading Module • Marketplace Protocol', style: TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 32),
              
              // Product Summary Glass Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E2122) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 24, offset: const Offset(0, 4))],
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBz-GdFO4TWHglhl49dB0E6dTqMkwX28HTxtiw8DCL1L1OJkzNzlPCpxt6FEnGigenGNR-nwq0H10iTgriJw5ldNFtGE5tf_4ul02-PxQXF4L56ZgDczo0AeBXtejwcSYd2IirM49v0SeOvuKt7xMoqEzD9uNQiZuWdG-fV1Jj6276ovWECnc20Dsx9MrzrAZW_trSv7viUX_gyLghEjxw6xkrrH2KrgSaBLTKNduWbyF2vr6RQ9gceIzzH78jw7nSAs5t1Aw8WGW2n',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Aura Quartz Chrono', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          const Text('Serial: #TQ-8829-X', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                            child: Text('OWNERSHIP VERIFIED', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: theme.primaryColor, letterSpacing: 1.0)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Market Data Grid
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('PLATFORM PRICE', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                          const SizedBox(height: 8),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('45,000', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              SizedBox(width: 4),
                              Text('FCFA', style: TextStyle(fontSize: 10, color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.trending_up, size: 12, color: theme.primaryColor),
                              const SizedBox(width: 4),
                              Text('+2.4% vs last week', style: TextStyle(fontSize: 10, color: theme.primaryColor)),
                            ],
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
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ALLOWED RANGE', style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.0)),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Text('42,500', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 4.0), child: Text('—', style: TextStyle(color: Colors.grey))),
                              Text('58,000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text('Capped at +30% platform value', style: TextStyle(fontSize: 10, color: Colors.grey)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Resale Form
              const Text('New Resale Price', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter amount',
                          hintStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
                        ),
                      ),
                    ),
                    const Text('FCFA', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Market Fee (2.5%)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('1,125 FCFA', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Warning card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border(left: BorderSide(color: theme.primaryColor.withOpacity(0.5), width: 4)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info, color: theme.primaryColor, size: 20),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Trading Policy', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Once listed, the asset will be locked from your personal inventory. You can delist at any time before a trade is initiated. Settlements are processed instantly in FCFA.', style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.5)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Action Buttons
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _listForSale,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                  child: _isLoading 
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('List for Sale', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(width: 12),
                            Icon(Icons.rocket_launch, size: 20),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Cancel and Return to Portfolio', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
