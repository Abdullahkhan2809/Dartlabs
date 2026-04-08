import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_practic_eapp/lab10task2/model/product.dart';
import 'package:lab_practic_eapp/lab10task2/provider/cart_provider.dart';


class ProductCard extends ConsumerWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInCart = ref.watch(cartProvider)
      .any((i) => i.product.id == product.id);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.grey.shade100,
              child: Center(
                child: Text(product.imageEmoji,
                  style: const TextStyle(fontSize: 48)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 13)),
                const SizedBox(height: 2),
                Text('\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => ref
                      .read(cartProvider.notifier)
                      .addProduct(product),
                    style: isInCart
                      ? FilledButton.styleFrom(
                          backgroundColor: Colors.green)
                      : null,
                    child: Text(isInCart ? 'Added' : 'Add to cart',
                      style: const TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}