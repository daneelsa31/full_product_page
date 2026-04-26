import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductPreviewFrame(),
  ),
);

class ProductPreviewFrame extends StatelessWidget {
  const ProductPreviewFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Center(
        child: Container(
          width: 375,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: const ProductDetailPage(),
          ),
        ),
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 439,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,
                leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset('assets/images/mainpic.png', fit: BoxFit.cover),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderSection(),
                      const SizedBox(height: 10),
                      _buildDescription(),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          _buildSectionTitle("Variations"),
                          const SizedBox(width: 15),
                          _buildTag("Pink", isSelected: true),
                          const SizedBox(width: 8),
                          _buildTag("M"),
                          const Spacer(),
                          const Icon(Icons.arrow_circle_right, color: Colors.blue, size: 28),
                        ],
                      ),
                      const SizedBox(height: 15),
                      _buildThumbnailsRow(),
                      const SizedBox(height: 30),
                      _buildSpecificationsSection(),
                      const SizedBox(height: 30),
                      _buildDeliverySection(),
                      const SizedBox(height: 30),
                      _buildReviewsSection(),
                      const SizedBox(height: 40),
                      // --- NEW: Most Popular Section ---
                      _buildMostPopularSection(),
                      const SizedBox(height: 1000),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- REUSABLE HELPERS ---
  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontFamily: 'Raleway', fontSize: 20, fontWeight: FontWeight.w900));
  }

  Widget _buildTag(String label, {bool isSelected = false, Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color ?? (isSelected ? Colors.grey[100] : Colors.white),
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('\$17.00', style: TextStyle(fontFamily: 'Raleway', fontSize: 26, fontWeight: FontWeight.w900)),
        CircleAvatar(backgroundColor: Colors.grey[100], radius: 18, child: const Icon(Icons.ios_share, size: 16, color: Colors.black)),
      ],
    );
  }

  Widget _buildDescription() {
    return const Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.',
      style: TextStyle(fontFamily: 'NunitoSans', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black, height: 1.5),
    );
  }

  Widget _buildThumbnailsRow() {
    final List<String> variantImages = ['assets/images/V1.png', 'assets/images/V2.png', 'assets/images/V3.png'];
    return Row(
      children: variantImages.map((path) => Container(
        margin: const EdgeInsets.only(right: 10),
        width: 70, height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
        ),
      )).toList(),
    );
  }

  Widget _buildSpecificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Specifications"),
        const SizedBox(height: 15),
        const Text("Material", style: TextStyle(fontFamily: 'Raleway', fontSize: 17, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        Row(children: [_buildTag("Cotton 95%", color: Color(0xFFFFEBEE)), const SizedBox(width: 8), _buildTag("Nylon 5%", color: Color(0xFFFFEBEE))]),
        const SizedBox(height: 15),
        const Text("Origin", style: TextStyle(fontFamily: 'Raleway', fontSize: 17, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        _buildTag("EU", color: Color(0xFFE3F2FD)),
        const SizedBox(height: 20),
        _buildArrowLink("Size guide"),
      ],
    );
  }

  Widget _buildArrowLink(String text, {bool isHeader = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isHeader ? 18 : 14)),
        const Icon(Icons.arrow_circle_right, color: Colors.blue, size: 28),
      ],
    );
  }

  Widget _buildDeliverySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Delivery"),
        const SizedBox(height: 15),
        _buildDeliveryBox("Standard", "5-7 days", "\$3,00"),
        const SizedBox(height: 10),
        _buildDeliveryBox("Express", "1-2 days", "\$12,00"),
      ],
    );
  }

  Widget _buildDeliveryBox(String type, String days, String price) {
    return Container(
      height: 40, padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(border: Border.all(color: const Color.fromARGB(255, 113, 185, 245)), borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Text(type, style: const TextStyle(fontFamily: 'Raleway', fontSize: 16, fontWeight: FontWeight.w700)),
        const SizedBox(width: 10), _buildTag(days, color: Color(0xFFE3F2FD)),
        const Spacer(), Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Rating & Reviews"),
        const SizedBox(height: 15),
        Row(
          children: [
            ...List.generate(4, (index) => const Icon(Icons.star, color: Colors.orangeAccent, size: 20)),
            const Icon(Icons.star_outline, color: Colors.orangeAccent, size: 20),
            const SizedBox(width: 8),
            _buildTag("4/5", color: Color(0xFFE3F2FD)),
          ],
        ),
        const SizedBox(height: 20),
        _buildReviewerCard(),
        const SizedBox(height: 20),
        _buildActionBtn("View All Reviews", const Color(0xFF0055FF), isFullWidth: true),
      ],
    );
  }

  Widget _buildReviewerCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/MP2.png')),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Veronika", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              Row(children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.orangeAccent, size: 14))),
              const SizedBox(height: 8),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
                style: TextStyle(fontFamily: 'NunitoSans', fontSize: 12, fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionBtn(String text, Color color, {bool isFullWidth = false}) {
    return Container(
      height: 40,
      width: isFullWidth ? double.infinity : null,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // --- NEW: MOST POPULAR SECTION HELPERS ---
  Widget _buildHeaderSectionWithSeeAll() {
    return Row(
      children: [
        _buildSectionTitle("Most Popular"),
        const Spacer(),
        const Text("See All", style: TextStyle(fontSize: 16, color: Colors.black87)),
        const SizedBox(width: 8),
        const Icon(Icons.arrow_circle_right, color: Colors.blue, size: 32),
      ],
    );
  }

  Widget _buildMostPopularSection() {
    final List<Map<String, String>> popularItems = [
      {'image': 'assets/images/MP1.png', 'likes': '1780', 'tag': 'New'},
      {'image': 'assets/images/MP2.png', 'likes': '1780', 'tag': 'Sale'},
      {'image': 'assets/images/MP3.png', 'likes': '1780', 'tag': 'Hot'},
    ];

    return Column(
      children: [
        _buildHeaderSectionWithSeeAll(),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: popularItems.map((item) {
              return _buildSmallProduct(item['image']!, item['likes']!, item['tag']!);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSmallProduct(String path, String likes, String tag) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12, bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(path, height: 130, width: 130, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(likes, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 2),
              const Icon(Icons.favorite, color: Colors.blue, size: 16),
              const Spacer(),
              Text(tag, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}