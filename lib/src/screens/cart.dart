import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: Text('I am the cart page.'),
    );
  }
}
