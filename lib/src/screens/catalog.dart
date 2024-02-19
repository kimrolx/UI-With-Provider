import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ui_with_provider/src/providers/cart_provider.dart';
import 'package:ui_with_provider/src/screens/information.dart';
import '../constants/colors.dart';
import '../models/cat_model.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundGray,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: backgroundGray,
              automaticallyImplyLeading: false,
              floating: true,
              expandedHeight: height * 0.165,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Gap(height * 0.015),
                    Text(
                      'Store',
                      style: GoogleFonts.inter(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gap(height * 0.025),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                      child: TextField(
                        //* TODO: Replace with searchbar functionality
                        style: GoogleFonts.poppins(
                          color: black,
                          fontSize: width * 0.038,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: searchBarGray,
                          hintText: 'Search Breed or Price',
                          hintStyle: GoogleFonts.poppins(
                            color: grayFont,
                            fontSize: width * 0.038,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                            decorationThickness: 6,
                          ),
                          prefixIcon: const Icon(CupertinoIcons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.03,
              ),
              sliver: SliverGrid.count(
                mainAxisSpacing: height * 0.02,
                crossAxisSpacing: width * 0.05,
                crossAxisCount: 2,
                childAspectRatio: width / (height * 0.6),
                children: List.generate(
                  cats.length,
                  (index) {
                    CatInformation currentCat = cats[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InformationPage(currentCat: currentCat),
                          ),
                        );
                      },
                      child: myCatCard(context, currentCat),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myCatCard(BuildContext context, CatInformation cat) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

  CartProvider cartProvider = Provider.of<CartProvider>(context);
  bool value = cartProvider.cats.contains(cat);

  return Ink(
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
      padding: EdgeInsets.only(
        left: width * 0.02,
        right: width * 0.02,
        top: height * 0.01,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                cat.catImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            '${cat.catBreed} Cat',
            style: GoogleFonts.poppins(
              fontSize: width * 0.038,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${cat.price}',
                style: GoogleFonts.poppins(
                  fontSize: width * 0.038,
                  fontWeight: FontWeight.w600,
                  color: theme,
                ),
              ),
              IconButton(
                onPressed: () {
                  (value == true)
                      ? cartProvider.remove(cat)
                      : cartProvider.add(cat);
                },
                icon: (value == true)
                    ? Icon(
                        CupertinoIcons.cart_fill_badge_minus,
                        color: theme,
                        size: width * 0.068,
                      )
                    : Icon(
                        CupertinoIcons.cart_fill_badge_plus,
                        color: theme,
                        size: width * 0.068,
                      ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

// Widget searchBar(double width, double height) {

//   final List<String> _results = [];

//   void _handleSearch(String input) {
//     _results.clear();
//     for (var str in myCoolStrings) {
//       if (str.toLowerCase().contains(input.toLowerCase())) {
//         setState(() {
//           _results.add(str);
//         });
//       }
//     }
//   }

//   return TextField(
//     style: GoogleFonts.poppins(
//       color: black,
//       fontSize: width * 0.038,
//       fontWeight: FontWeight.w400,
//       letterSpacing: 0.5,
//     ),
//     onChanged: _handleSearch,
//     decoration: InputDecoration(
//       filled: true,
//       fillColor: grayFont,
//       hintText: 'Search Breed or Price',
//       hintStyle: GoogleFonts.poppins(
//         color: black,
//         fontSize: width * 0.038,
//         fontWeight: FontWeight.w400,
//         letterSpacing: 0.5,
//         decorationThickness: 6,
//       ),
//       prefixIcon: const Icon(CupertinoIcons.search),
//     ),
//   );
// }