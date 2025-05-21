import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  TextEditingController fromController = TextEditingController(),
      toController = TextEditingController();
  FocusNode fromNode = FocusNode(), toNode = FocusNode();
  List<String> items = ['Discount'];

  List<String> sorts = ['New', 'In Stock', 'Out of Stock'];

  String? selectedValue;
  int selectSort = -1;
  sort(int index) {
    if (selectSort == index) {
      selectSort = -1;
    } else {
      selectSort = index;
    }
    update();
  }

  nullValue() {
    selectedValue = null;
    update();
  }

  void reset() {
    fromController.text = '';
    toController.text = '';
    selectedValue = null;
    selectSort = -1;
    update();
  }

  void onChanged(String newValue) {
    selectedValue = newValue;
    update();
  }
}
