// import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
// import 'package:flutter/material.dart';
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

  final  CarouselSliderController carouselController =
      CarouselSliderController();
  RxInt currentIndex = 0.obs;

}
