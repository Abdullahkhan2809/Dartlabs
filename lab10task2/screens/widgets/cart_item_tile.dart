import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_practic_eapp/lab10task2/model/cart_items.dart';
import 'package:lab_practic_eapp/lab10task2/provider/cart_provider.dart';


class CartItemTile extends ConsumerWidget {
  final CartItem item;
  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(cartProvider.notifier);

    return ListTile(
      leading: Text(item.product.imageEmoji,
        style: const TextStyle(fontSize: 28)),
      title: Text(item.product.name),
      subtitle: Text('\$${item.subtotal.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () =>
              notifier.decrementProduct(item.product.id),
          ),
          Text('${item.quantity}',
            style: const TextStyle(fontWeight: FontWeight.w600)),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => notifier.addProduct(item.product),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () =>
              notifier.removeProduct(item.product.id),
          ),
        ],
      ),
    );
  }
}