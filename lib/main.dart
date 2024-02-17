import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_with_provider/src/providers/cart_provider.dart';
import 'package:ui_with_provider/src/screens/cart.dart';
import 'package:ui_with_provider/src/screens/catalog.dart';
import 'package:ui_with_provider/src/widgets/navbar_builder.dart';
import 'src/screens/onboarding.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
      routes: {
        '/navbar': (context) => const MyNavBar(),
        '/catalogpage': (context) => const CatalogPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
