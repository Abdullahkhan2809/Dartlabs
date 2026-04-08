import 'package:flutter_riverpod/legacy.dart';
import 'package:lab_practic_eapp/lab10task2/model/cart_items.dart';
import 'package:lab_practic_eapp/lab10task2/model/product.dart';


class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addProduct(Product product) {
    final idx = state.indexWhere((i) => i.product.id == product.id);
    if (idx >= 0) {
      // already in cart — increment qty
      state = [
        ...state.sublist(0, idx),
        state[idx].copyWith(quantity: state[idx].quantity + 1),
        ...state.sublist(idx + 1),
      ];
    } else {
      state = [...state, CartItem(product: product)];
    }
  }

  void removeProduct(int productId) {
    state = state.where((i) => i.product.id != productId).toList();
  }

  void decrementProduct(int productId) {
    final idx = state.indexWhere((i) => i.product.id == productId);
    if (idx < 0) return;
    if (state[idx].quantity == 1) {
      removeProduct(productId);
    } else {
      state = [
        ...state.sublist(0, idx),
        state[idx].copyWith(quantity: state[idx].quantity - 1),
        ...state.sublist(idx + 1),
      ];
    }
  }

  void clearCart() => state = [];

  double get totalPrice =>
    state.fold(0.0, (sum, item) => sum + item.subtotal);

  int get totalItems =>
    state.fold(0, (sum, item) => sum + item.quantity);
}

// The global provider — accessible anywhere, no context needed
final cartProvider =
  StateNotifierProvider<CartNotifier, List<CartItem>>(
    (ref) => CartNotifier(),
  );
