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
      // The background color for the actual page content
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 1. HERO IMAGE HEADER
              SliverAppBar(
                expandedHeight: 439, // Exact height from your final code
                pinned: true,        // Keeps the back button visible at the top
                backgroundColor: Colors.white,
                elevation: 0,
                leading: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/mainpic.png', // Using your specific asset path
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 2. MAIN CONTENT AREA (Placeholder to allow scrolling)
              const SliverToBoxAdapter(
                child: SizedBox(height: 1000), 
              ),
            ],
          ),
        ],
      ),
    );
  }
}