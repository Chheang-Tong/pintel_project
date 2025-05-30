import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final TextEditingController fullnameController = TextEditingController(),
      phoneController = TextEditingController(),
      addNameController = TextEditingController(),
      addressController = TextEditingController();
  final FocusNode fullnameFocus = FocusNode(),
      phoneFocus = FocusNode(),
      addNameFocus = FocusNode(),
      addressFocus = FocusNode();
  Map<String, dynamic> data = {
    "5.00": "Cambodia Express",
    "3.00": "DHL Express",
  };
  int selectedIndex = 0;
  onSelected(int index) {
    selectedIndex = index;
    update();
  }
}
