import 'package:flutter/material.dart';
import 'package:pintel_project/core/core.dart';

import '../../../common/common.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.bgColor,
        title: const Text(
          'Shoping Cart',
          style: boldOverLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyCart(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
