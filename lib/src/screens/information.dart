import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ui_with_provider/src/models/cat_model.dart';
import 'package:ui_with_provider/src/providers/cart_provider.dart';
import '../constants/colors.dart';

class InformationPage extends StatelessWidget {
  final CatInformation currentCat;
  const InformationPage({required this.currentCat, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    CartProvider cartProvider = Provider.of<CartProvider>(context);
    bool value = cartProvider.cats.contains(currentCat);

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.transparent,
          ),
          SizedBox(
            height: height * 0.5,
            width: width,
            child: Image.asset(
              currentCat.catImage,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.back),
              color: Colors.white,
              iconSize: width * 0.075,
            ),
          ),
          Positioned(
            top: height * 0.45,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.5,
              color: backgroundGray,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.02,
                    ),
                    child: Column(
                      children: [
                        Gap(height * 0.06),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.paw,
                              size: width * 0.0525,
                            ),
                            Gap(width * 0.02),
                            Text(
                              'About ${currentCat.catBreed}',
                              style: GoogleFonts.poppins(
                                fontSize: width * 0.0525,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Gap(height * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myDetailContainer(context, 'Weight',
                                '${currentCat.catWeight} kg'),
                            myDetailContainer(context, 'Height',
                                '${currentCat.catWeight} cm'),
                          ],
                        ),
                        Gap(height * 0.025),
                        Text(
                          currentCat.catDescription,
                          style: GoogleFonts.poppins(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        Gap(height * 0.035),
                        SizedBox(
                          width: width,
                          height: height * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              (value == true)
                                  ? cartProvider.remove(currentCat)
                                  : cartProvider.add(currentCat);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme,
                              elevation: 1.0,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              (value == true)
                                  ? 'Remove from Cart!'
                                  : 'Add to Cart!',
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
                  );
                },
              ),
            ),
          ),
          Positioned(
            //* Breed and Country
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
              ),
              child: Container(
                height: height * 0.13,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75))
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                    vertical: height * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${currentCat.catBreed} Cat',
                              style: GoogleFonts.poppins(
                                fontSize: width * 0.055,
                                fontWeight: FontWeight.w700,
                                color: black,
                              ),
                            ),
                            Text(
                              '${currentCat.origin} · 8m',
                              style: GoogleFonts.poppins(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w400,
                                color: grayFont2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.07 + 16.0,
                        height: width * 0.07 + 16.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Material(
                            color: theme,
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.arrow_up_left_arrow_down_right,
                                  color: white,
                                  size: width * 0.065,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget myDetailContainer(BuildContext context, String text, String info) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  return Container(
    width: width * 0.43,
    height: height * 0.1,
    decoration: BoxDecoration(
      color: informationContainer,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: width * 0.045,
              fontWeight: FontWeight.w400,
              color: grayFont2,
            ),
          ),
          Text(
            info,
            style: GoogleFonts.poppins(
              fontSize: width * 0.045,
              fontWeight: FontWeight.w600,
              color: theme,
            ),
          ),
        ],
      ),
    ),
  );
}
