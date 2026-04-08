import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_practic_eapp/lab10task2/model/product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(id: 1, name: 'Wireless Headphones', category: 'Electronics', price: 79.99, imageEmoji: '🎧'),
    Product(id: 2, name: 'Running Shoes',      category: 'Sports',      price: 54.99, imageEmoji: '👟'),
    Product(id: 3, name: 'Coffee Mug',         category: 'Kitchen',     price: 14.99, imageEmoji: '☕'),
    Product(id: 4, name: 'Desk Lamp',          category: 'Home',        price: 34.99, imageEmoji: '💡'),
    Product(id: 5, name: 'Yoga Mat',           category: 'Sports',      price: 24.99, imageEmoji: '🧘'),
    Product(id: 6, name: 'Mechanical Keyboard', category: 'Electronics', price: 99.99, imageEmoji: '⌨️'),
  ];
});