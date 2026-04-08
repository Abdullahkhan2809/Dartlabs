import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lab_practic_eapp/lab10task2/screens/cart_screen.dart';
import 'package:lab_practic_eapp/lab10task2/screens/product_list_screen.dart';


final _router = GoRouter(routes: [
  GoRoute(path: '/',     builder: (_, __) => const ProductListScreen()),
  GoRoute(path: '/cart', builder: (_, __) => const CartScreen()),
]);

void main() {
  runApp(
    const ProviderScope(  // ← single wrap, covers entire app
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) =>
    MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Shop',
    );
}