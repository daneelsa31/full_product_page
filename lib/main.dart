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
                leading: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/mainpic.png',
                    fit: BoxFit.cover,
                  ),
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
                          _buildTag("Pink"),
                          const SizedBox(width: 8),
                          _buildTag("M"),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_circle_right,
                            color: Colors.blue,
                            size: 28,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      _buildThumbnailsRow(),
                      const SizedBox(height: 30),
                      _buildSpecificationsSection(),
                      const SizedBox(height: 15),
                      _buildDeliverySection(),
                      const SizedBox(height: 30),
                      _buildReviewsSection(),
                      const SizedBox(height: 40),
                      _buildMostPopularSection(),
                      const SizedBox(height: 40),
                      _buildYouMightLikeSection(),
                      const SizedBox(
                        height: 80,
                      ), // Padding to prevent content being hidden
                    ],
                  ),
                ),
              ),
            ],
          ),
          // --- NEW: Fixed Bottom Bar ---
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildBottomActionBar(),
          ),
        ],
      ),
    );
  }

  // --- PREVIOUS HELPERS (Condensed for space) ---
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Raleway',
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _buildTag(String label, {Color? color, Color? textColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color:
              textColor ??
              Colors.black, // Use the passed color or default to black
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '\$17.00',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey[100],
          radius: 18,
          child: const Icon(Icons.ios_share, size: 16, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return const Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.',
      style: TextStyle(
        fontFamily: 'NunitoSans',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 1.5,
      ),
    );
  }

  Widget _buildThumbnailsRow() {
    final List<String> variantImages = [
      'assets/images/V1.png',
      'assets/images/V2.png',
      'assets/images/V3.png',
    ];
    return Row(
      children: variantImages
          .map(
            (path) => Container(
              margin: const EdgeInsets.only(right: 10),
              width: 70,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(path),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildSpecificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Specifications"),
        const SizedBox(height: 15),
        const Text(
          "Material",
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildTag("Cotton 95%", color: Color(0xFFFFEBEE)),
            const SizedBox(width: 8),
            _buildTag("Nylon 5%", color: Color(0xFFFFEBEE)),
          ],
        ),
        const SizedBox(height: 15),
        const Text(
          "Origin",
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        _buildTag("EU", color: Color(0xFFE3F2FD)),
        const SizedBox(height: 10),
        _buildArrowLink("Size guide"),
      ],
    );
  }

  Widget _buildArrowLink(String text, {bool isHeader = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            fontSize: isHeader ? 18 : 16,
          ),
        ),
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
        _buildDeliveryBox("Standard", "5-7 days", "\$3.00"),
        const SizedBox(height: 10),
        _buildDeliveryBox("Express", "1-2 days", "\$12.00"),
      ],
    );
  }

  Widget _buildDeliveryBox(String type, String days, String price) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4.5),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 27, 92, 242)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            type,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 10),
          _buildTag(
            days,
            color: const Color.fromARGB(255, 246, 247, 247),
            textColor: const Color.fromARGB(
              255,
              40,
              133,
              232,
            ), // <--- Add Sky Blue here
          ),
          const Spacer(),
          Text(
            price,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
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
            ...List.generate(
              4,
              (index) =>
                  const Icon(Icons.star, color: Colors.orangeAccent, size: 20),
            ),
            const Icon(
              Icons.star_outline,
              color: Colors.orangeAccent,
              size: 20,
            ),
            const SizedBox(width: 8),
            _buildTag("4/5", color: Color(0xFFE3F2FD)),
          ],
        ),
        const SizedBox(height: 20),
        _buildReviewerCard(),
        const SizedBox(height: 20),
        _buildActionBtn(
          "View All Reviews",
          const Color(0xFF0055FF),
          isFullWidth: true,
        ),
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
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/MP2.png'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Veronika",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: Colors.orangeAccent,
                    size: 14,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
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
            children: popularItems
                .map(
                  (item) => _buildSmallProduct(
                    item['image']!,
                    item['likes']!,
                    item['tag']!,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderSectionWithSeeAll() {
    return Row(
      children: [
        _buildSectionTitle("Most Popular"),
        const Spacer(),
        const Text(
          "See All",
          style: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.arrow_circle_right, color: Colors.blue, size: 32),
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
            child: Image.asset(
              path,
              height: 130,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                likes,
                style: const TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(Icons.favorite, color: Colors.blue, size: 16),
              const Spacer(),
              Text(
                tag,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildYouMightLikeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("You Might Like"),
        const SizedBox(height: 20),
        Wrap(
          spacing: 15,
          runSpacing: 20,
          alignment: WrapAlignment.spaceBetween,
          children: [
            _buildGridItem(
              'assets/images/YML1.png',
              'Lorem ipsum dolor sit amet consectetur',
              '\$17.00',
            ),
            _buildGridItem(
              'assets/images/YML2.png',
              'Lorem ipsum dolor sit amet consectetur',
              '\$17.00',
            ),
            _buildGridItem(
              'assets/images/YML3.png',
              'Lorem ipsum dolor sit amet consectetur',
              '\$17.00',
            ),
            _buildGridItem(
              'assets/images/YML4.png',
              'Lorem ipsum dolor sit amet consectetur',
              '\$17.00',
            ),
            _buildGridItem(
              'assets/images/YML5.png',
              'Lorem ipsum dolor sit amet consectetur',
              '\$17.00',
            ),
            _buildGridItem(
              'assets/images/YML6.png',
              'Lorem ipsum dolor sit amet consectetur',
              '\$17.00',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGridItem(String path, String title, String price) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                path,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 13,
              color: Colors.black87,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  // --- NEW: BOTTOM BAR HELPERS ---
  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 25),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.favorite_border),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionBtn('Add to cart', const Color(0xFF1A1A1A)),
          ),
          const SizedBox(width: 8),
          Expanded(child: _buildActionBtn('Buy now', const Color(0xFF0055FF))),
        ],
      ),
    );
  }

  Widget _buildActionBtn(String text, Color color, {bool isFullWidth = false}) {
    return Container(
      height: 40,
      width: isFullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
