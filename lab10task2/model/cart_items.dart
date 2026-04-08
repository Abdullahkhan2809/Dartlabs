import 'product.dart';

class CartItem {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) =>
    CartItem(product: product, quantity: quantity ?? this.quantity);

  double get subtotal => product.price * quantity;
}