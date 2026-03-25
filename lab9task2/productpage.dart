import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final String name;
  final double price;
  final Image img;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: img, // Using the same image widget passed in
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("\$${price.toStringAsFixed(2)}", 
                  style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text("Full product description goes here. This item is part of the premium Furor collection."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}