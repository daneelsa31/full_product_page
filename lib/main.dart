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
          width: 375, // Your final spec
          margin: const EdgeInsets.symmetric(vertical: 5), // Your final spec
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40), // Your final spec
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15), // Your final spec
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: const Center(child: Text("Device Frame Ready")),
        ),
      ),
    );
  }
}