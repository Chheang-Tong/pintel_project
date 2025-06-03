import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature.dart';

class NologController extends GetxController {
  int selectIndex = 0;
  List<Widget> screen = [
    HomeScreen(),
    StoreScreen(),
  ];
  void onChange(int index) {
    selectIndex = index;
    update();
  }
}
