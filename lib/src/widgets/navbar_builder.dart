import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui_with_provider/src/screens/home.dart';
import 'package:ui_with_provider/src/screens/profile.dart';
import '../screens/cart.dart';
import '../screens/catalog.dart';
import '../constants/colors.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int currentIndex = 1;

  final screens = [
    const HomePage(),
    const CatalogPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        color: white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.018,
            vertical: height * 0.008,
          ),
          child: GNav(
            selectedIndex: currentIndex,
            backgroundColor: white,
            color: grayFont,
            activeColor: theme,
            tabBackgroundColor: Colors.grey.shade200,
            gap: width * 0.02,
            padding: const EdgeInsets.all(18),
            onTabChange: (index) => setState(() => currentIndex = index),
            tabs: const [
              GButton(
                icon: CupertinoIcons.house_fill,
                text: 'Home',
              ),
              GButton(
                icon: CupertinoIcons.book_fill,
                text: 'Catalog',
              ),
              GButton(
                icon: CupertinoIcons.cart_fill,
                text: 'Cart',
              ),
              GButton(
                icon: CupertinoIcons.person_alt_circle_fill,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
