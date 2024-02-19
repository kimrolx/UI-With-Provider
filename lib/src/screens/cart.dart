import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.back),
        ),
        title: Text(
          'My Cart',
          style: GoogleFonts.inter(
            fontSize: width * 0.05,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<CartProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: height * 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                    ),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: provider.cats.length,
                      itemBuilder: (context, index) {
                        CatInformation cat = provider.cats[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.01,
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {},
                            child: myCartProducts(context, cat, provider),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                color: white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.005,
                  ),
                  child: Column(
                    children: [
                      Divider(
                        color: theme,
                        thickness: 2,
                      ),
                      Gap(height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.inter(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: grayFont2,
                            ),
                          ),
                          Text(
                            '\$${provider.getCartTotal()}',
                            style: GoogleFonts.inter(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w700,
                              color: black,
                            ),
                          ),
                        ],
                      ),
                      Gap(height * 0.04),
                      SizedBox(
                        width: width * 0.8,
                        height: height * 0.06,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme,
                            elevation: 1.0,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Order Now!',
                            style: GoogleFonts.inter(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w700,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget myCartProducts(
    BuildContext context, CatInformation cat, CartProvider provider) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return Ink(
    width: width * 0.75,
    height: height * 0.15,
    decoration: BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Color(0xffDDDDDD),
          blurRadius: 6.0,
          spreadRadius: 2.0,
          offset: Offset(0.0, 0.0),
        )
      ],
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.015,
        vertical: height * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width * 0.35,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                cat.catImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(width * 0.025),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${cat.catBreed} Cat',
                style: GoogleFonts.inter(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
              Text(
                '\$${cat.price}',
                style: GoogleFonts.poppins(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.w600,
                  color: theme,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              provider.remove(cat);
            },
            icon: const Icon(CupertinoIcons.delete),
            color: theme,
            iconSize: width * 0.08,
          ),
        ],
      ),
    ),
  );
}
