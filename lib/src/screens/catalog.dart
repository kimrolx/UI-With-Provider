import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  final TextEditingController _searchController = TextEditingController();

  var results = cats;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(inputListener);
  }

  @override
  void dispose() {
    _searchController.removeListener(inputListener);
    _searchController.dispose();
    super.dispose();
  }

  void inputListener() {
    search(_searchController.text);
  }

  void search(String input) {
    if (input.isEmpty) {
      setState(() {
        results = cats;
      });
    } else {
      setState(() {
        results = cats
            .where((cat) =>
                cat.catBreed.toLowerCase().contains(input.toLowerCase()) ||
                cat.price.toString().contains(input))
            .toList();
      });
    }
  }

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
              expandedHeight: height * 0.17,
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
                    searchBar(context, width, height),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.03,
              ),
              sliver: buildContent(width, height),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(double width, double height) {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: height * 0.02,
      crossAxisSpacing: width * 0.05,
      itemBuilder: (BuildContext context, int index) {
        CatInformation currentCat = results[index];
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InformationPage(currentCat: currentCat),
              ),
            );
          },
          child: myCatCard(context, currentCat),
        );
      },
      childCount: results.length,
    );
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
            Gap(height * 0.01),
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

  Widget searchBar(BuildContext context, double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
      child: TextField(
        controller: _searchController,
        style: GoogleFonts.poppins(
          color: black,
          fontSize: width * 0.045,
          fontWeight: FontWeight.w500,
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
            fontSize: width * 0.045,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            decorationThickness: 6,
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              size: width * 0.06,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.mic,
              size: width * 0.06,
            ),
          ),
        ),
      ),
    );
  }
}
