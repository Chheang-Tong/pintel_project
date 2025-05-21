import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> banner = [
    'assets/image/slide1.png',
    'assets/image/slide2.png',
    'assets/image/slide3.png',
  ];
  Map<String, String> cate = {
    'Shirt': 'assets/image/shirt.svg',
     'Pant':'assets/image/pant.svg',
    'Dress':'assets/image/dress.svg',
    'Necklance':'assets/image/necklace.svg',
    'Shoe':'assets/image/shoe.svg',
    'bag':'assets/image/bag.svg',
  };

  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentIndex.value < banner.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }
      pageController.animateToPage(
        currentIndex.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}
