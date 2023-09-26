import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/models/bn_item.dart';
import 'package:nft/screens/cart/cart_screen.dart';
import 'package:nft/screens/create_product.dart';
import 'package:nft/screens/home/home_screen.dart';
import 'package:nft/screens/account/profile_Screen.dart';
import 'package:nft/screens/search/search_screen.dart';

import '../constants/app.colors.dart';

class BnScreen extends StatefulWidget {
  const BnScreen({Key? key}) : super(key: key);

  @override
  _BnScreenState createState() => _BnScreenState();
}

class _BnScreenState extends State<BnScreen> {
  int _currentIndex = 0;

  final List<BnItem> _bnScreens = <BnItem>[
    const BnItem(widget: HomeScreen(), title: 'Home'),
    const BnItem(widget: SearchScreen(), title: 'ٍSearch'),
    const BnItem(widget: CreateProduct(), title: 'AddProduct'),
    const BnItem(widget: CartScreen(), title: 'Cart'),
    const BnItem(widget: ProfileScreen(), title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bnScreens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int itemIndex) {
          setState(() {
            _currentIndex = itemIndex;
          });
        },
        currentIndex: _currentIndex,
        //******************************
        // type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        //******************************
        backgroundColor:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.white
            : AppColors.black2,
        //******************************
        showSelectedLabels: true,
        showUnselectedLabels: true,
        //******************************
        // fixedColor: Colors.pink,
        selectedItemColor:
        Theme.of(context).brightness == Brightness.light
            ? Colors.blue.shade900
            : AppColors.white,

        unselectedItemColor:
        Theme.of(context).brightness == Brightness.light
            ? Colors.black26
            : AppColors.grey,
        //******************************
        //******************************
        selectedLabelStyle: GoogleFonts.nunito(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          // fontSize: 20,
        ),
        unselectedLabelStyle: GoogleFonts.nunito(
          fontWeight: FontWeight.w300,
        ),
        //******************************
        selectedFontSize: 14,
        unselectedFontSize: 10,
        //******************************
        elevation: 10,
        //******************************

        // iconSize: 36,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 29),
              activeIcon: Icon(Icons.home, size: 29),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                size: 29,
              ),
              activeIcon: Icon(
                Icons.search,
                size: 29,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 29,
              ),
              activeIcon: Icon(Icons.add_outlined, size: 29),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 29,
              ),
              activeIcon: Icon(
                Icons.shopping_cart,
                size: 29,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 29,
              ),
              activeIcon: Icon(
                Icons.person,
                size: 29,
              ),
              label: ''),
        ],
      ),
    );
  }
}
