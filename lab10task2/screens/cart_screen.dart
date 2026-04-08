import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab_practic_eapp/lab10task2/provider/cart_provider.dart';
import 'package:lab_practic_eapp/lab10task2/screens/widgets/order_summery.dart';
import 'widgets/cart_item_tile.dart';


class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${cartItems.length} items)'),
        actions: [
          if (cartItems.isNotEmpty)
            TextButton(
              onPressed: () =>
                ref.read(cartProvider.notifier).clearCart(),
              child: const Text('Clear all'),
            ),
        ],
      ),
      body: cartItems.isEmpty
        ? const Center(
            child: Text('Your cart is empty',
              style: TextStyle(color: Colors.grey)),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: cartItems.length,
                  separatorBuilder: (_, __) =>
                    const Divider(height: 1),
                  itemBuilder: (_, i) =>
                    CartItemTile(item: cartItems[i]),
                ),
              ),
              const OrderSummary(),
            ],
          ),
    );
  }
}