import 'package:flutter/material.dart';
import 'package:nft/models/bn_item.dart';
import 'package:nft/screens/cart/checkout2_screen.dart';
import 'package:nft/screens/cart/checkout3_Screen.dart';
import 'package:nft/screens/cart/checkout_screen.dart';

class BnCart extends StatefulWidget {
  const BnCart({Key? key}) : super(key: key);

  @override
  _BnCartState createState() => _BnCartState();
}

class _BnCartState extends State<BnCart> {
  int _currentIndex = 0;

  final List<BnItem> _bnScreens = <BnItem>[
    const BnItem(widget: CheckoutScreen(), title: 'Checkout'),
    const BnItem(widget: CheckoutScreen2(), title: 'Checkout'),
    const BnItem(widget: CheckoutScreen3(), title: 'Checkout'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bnScreens[_currentIndex].widget,
    );
  }
}
