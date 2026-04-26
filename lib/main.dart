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
                          _buildTag("Pink", isSelected: true),
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
                      // --- NEW: Specifications ---
                      _buildSpecificationsSection(),
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

  // --- NEW: Specifications Sections & Helper ---
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
            _buildTag("Cotton 95%", color: Colors.red.shade50),
            const SizedBox(width: 8),
            _buildTag("Nylon 5%", color: Colors.red.shade50),
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
        _buildTag("EU", color: Colors.blue.shade50),
        const SizedBox(height: 20),
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
            fontWeight: FontWeight.bold,
            fontSize: isHeader ? 18 : 14,
          ),
        ),
        const Icon(Icons.arrow_circle_right, color: Colors.blue, size: 28),
      ],
    );
  }
}