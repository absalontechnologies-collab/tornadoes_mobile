import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  _buildCategories(),
                  const SizedBox(height: 24),
                  _buildResultsGrid(context),
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
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search for services or products...',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.tune, color: Color(0xFF5F5E5E)),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  Widget _buildCategories() {
    final categories = ['All Categories', 'Clothing', 'Food', 'Restoration', 'Aesthetics'];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF5F5E5E) : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResultsGrid(BuildContext context) {
    return Column(
      children: [
        // Featured Large Result
        _buildResultCard(
          context: context,
          title: 'Le Gourmet Sahel',
          subtitle: 'Fine dining experience with local infusions.',
          price: '15,000 FCFA',
          rating: '4.9',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCWdsKNDm_GrWqAi_b-F4X_WuWEDQsmjywckeqEAdwLv1vLVNmt9egL5iaec73fD9_jIRQ6o2sw7n2rsDLBHdMfZ5rbtsS2dzJug2rz70Xj7w3OFzG4LTybh9rGZkSmE0BJ4DhzaXN2zRR1Twske1L8jp10MMuATAIp0Y4YKzTMfNUIBN4OD2j6nkjzblrdHEI0a-9g96gdLkWYzSHTubTw_HXtUfJklW_M-L2NvjGVT_g8_mjI8BI_0_SpXCiWezaRKj5J85gM8tIM',
          isFeatured: true,
          height: 250,
        ),
        const SizedBox(height: 16),
        // Two columns
        Row(
          children: [
            Expanded(
              child: _buildResultCard(
                context: context,
                title: 'Indigo Collection',
                subtitle: 'Bespoke artisanal clothing.',
                price: '45,000 FCFA',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCH2h6kLJkSdKutIblYTrAIkm33QJZyAweb3IfDweT_Iz1jHVYskhXzByQYxXnM_oXc4hYX-7xjGAkPm_HV8KTQ-kMnsieC0rCwoPUbLXErf1PNWi7J-f9EiZZjmtKgSQdRmN2wQ1dkEJ-2V7YbVl-ywlzxelxB-4ty7XEwnd8KFlzyAAiOpCLLfNWdYTxE-KHd3J8hOJORIAgBw6HSY2TthRBNygoop_YAPVr76j9uS0ndo2wDTEW_mPDvgpjK0UOoMDV0JKGM4kCL',
                height: 200,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildResultCard(
                context: context,
                title: 'Zen Aesthetics',
                subtitle: 'Premium skincare & therapy.',
                price: '25,000 FCFA',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB19fhKM1VmUec0pQxsddLpe3FpjRdiMuTB367h9Kd-yT1na5Av3BOCiLXHYJpcHM0oFZS6Gfp4chbXXRXVszCimg2TnEP17Tq6rLKd01qO8Z86FYeEjpQ46pbEJOpCMxhg6kfphniBUanZnv5v58_uc_YyquhputyiouPLTpaGXcAr3HDazD_2TmVXQzIlc4JlyNscruyWsyExFZs5BJSB1XI5ttL8zBYJ7bW_IaBAeCoyq0vUAMi8mCmlnABD3IskjYMxs4k5jDtf',
                height: 200,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Wide Result
        _buildResultCard(
          context: context,
          title: 'Savory Bowls',
          subtitle: 'Quick healthy meals curated for professionals.',
          price: '3,500 FCFA',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuClyTWZRpAU-GzRT9gQPAMBJrjmg1or0tiYcpNZIB8KgWcA3QltyEmpfkj0dqVecdsiFVtfmpzZ2I1uwvhyKMVcTvfiA7nl7BMW8VWnTtesvco1dva5TKrwELl9QKbX4RLiEXNtaFA7UShyjrERM3uHKWR-nvTOZZ2vmBQQZpjRl844N1okVXuAe6e9oumPHcq-fI3nGBnmPJZ9zSWIEp5M7d92JpeL51zLawV-NP__ToXC3OKtN2BehSKwiLfzNa79O9ZhEhLjB5gr',
          height: 120,
          isHorizontal: true,
        ),
        const SizedBox(height: 32),
        const Center(
          child: Text(
            'Showing 4 results for your current criteria',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String price,
    required String imageUrl,
    String? rating,
    bool isFeatured = false,
    bool isHorizontal = false,
    double height = 200,
  }) {
    final theme = Theme.of(context);
    final cardContent = Container(
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
      clipBehavior: Clip.antiAlias,
      child: isHorizontal
          ? Row(
              children: [
                SizedBox(
                  width: 120,
                  height: double.infinity,
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis),
                        const Spacer(),
                        Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5F5E5E))),
                      ],
                    ),
                  ),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Positioned.fill(child: Image.network(imageUrl, fit: BoxFit.cover)),
                      if (isFeatured) ...[
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                            child: const Text('FEATURED', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black)),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                Expanded(
                  flex: isFeatured ? 1 : 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis)),
                                if (rating != null)
                                  Row(
                                    children: [
                                      const Icon(Icons.star, size: 14, color: Color(0xFF5F5E5E)),
                                      Text(rating, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    ],
                                  )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 2, overflow: TextOverflow.ellipsis),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            if (isFeatured)
                              const Row(
                                children: [
                                  Text('View Details', style: TextStyle(color: Color(0xFF5F5E5E), fontSize: 12, fontWeight: FontWeight.bold)),
                                  Icon(Icons.arrow_forward, size: 14, color: Color(0xFF5F5E5E)),
                                ],
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );

    return SizedBox(height: height, child: cardContent);
  }
}
