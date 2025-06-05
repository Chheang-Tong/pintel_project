import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature.dart';

class LogController extends GetxController {
  int selectIndex = 0;
  List<Widget> screen = [
    HomeScreen(),
    OrderScreen(),
    WishScreen(),
    MenuScreen(),
  ];
  Map<String, String> title = {
    'Home': 'assets/image/home.svg',
    'Order': 'assets/image/order.svg',
    'Wishlist': 'assets/image/favorite.svg',
    'Menu': 'assets/image/list.svg',
  };
  void onChange(int index) {
    selectIndex = index;
    update();
  }
}
