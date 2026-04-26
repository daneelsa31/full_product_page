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
          // --- NEW: Clipping the contents to match the 40px radius ---
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
                      const SizedBox(height: 15),
                      // --- NEW: Description Section ---
                      _buildDescription(),
                      const SizedBox(height: 25),
                      // Testing the title helper
                      _buildSectionTitle("Variations"),
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

  // Header helper from previous commit
  Widget _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('\$17,00', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Raleway')),
        CircleAvatar(backgroundColor: Colors.grey[100], radius: 18, child: const Icon(Icons.ios_share, size: 16, color: Colors.black)),
      ],
    );
  }

  // --- NEW: Helper for Description ---
  Widget _buildDescription() {
    return const Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.',
      style: TextStyle(
        color: Colors.black54,
        height: 1.5,
        fontFamily: 'NunitoSans', // Matching your final font spec
      ),
    );
  }

  // --- NEW: Reusable Section Title ---
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Raleway', // Matching your final font spec
      ),
    );
  }
}