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
    return const Scaffold(
     
      backgroundColor: Color.fromARGB(255, 238, 237, 237),
      body: Center(
        child: Text("Background Setup Complete"),
      ),
    );
  }
}