import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with GetTickerProviderStateMixin {
  final TextEditingController phoneNumberController = TextEditingController(),
      emailController = TextEditingController(),
      firstnameController = TextEditingController(),
      lastnameController = TextEditingController(),
      confirmationController = TextEditingController(),
      otpController = TextEditingController(),

      passwordController = TextEditingController();

  final FocusNode firstnameFocusNode = FocusNode(),
      lastnameFocusNode = FocusNode(),
      phoneNumberFocusNode = FocusNode(),
      confirmationFocusNode = FocusNode(),
      emailFocusNode = FocusNode(),
      passwordFocusNode = FocusNode();
  late TabController tabController;

  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tab.length, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        currentIndex.value = tabController.index;
      }
      update();
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  List<String> tab = [
    'Phone Number',
    'Email',
  ];
  
}
