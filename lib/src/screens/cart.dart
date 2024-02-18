import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_with_provider/src/models/cat_model.dart';
import 'package:ui_with_provider/src/providers/cart_provider.dart';
import '../constants/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundGray,
      body: Consumer<CartProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              SizedBox(
                height: height * 0.80,
                child: ListView.builder(
                  itemCount: provider.cats.length,
                  itemBuilder: (context, index) {
                    CatInformation cat = provider.cats[index];
                    return ListTile(
                      title: Text(
                        cat.catBreed,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
