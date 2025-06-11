import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../common/common.dart';

class ColorResources {
  static const Color primaryColor = Color(0xffDE2348);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xff231F20);
  static const Color bgColor = Color(0xffF0F0F0);
  static const Color shadowColor = Color(0xff3A090B);
  static const Color errorColor = Color(0xffB13439);
  static const Color successColor = Color(0xff34B164);
  static const Color pendingColor = Color(0xffDE9307);
  static const Color shippingColor = Color(0xff1F6BCF);

  static const Color transparentColor = Colors.transparent;

  static Color black75 = blackColor.withOpacity(0.75);
  static Color black45 = blackColor.withOpacity(0.45);
  static Color black25 = blackColor.withOpacity(0.25);
  static Color black10 = blackColor.withOpacity(0.10);
  static Color black5 = blackColor.withOpacity(0.05);

  static Color white75 = whiteColor.withOpacity(0.75);
  static Color white45 = whiteColor.withOpacity(0.45);
  static Color white25 = whiteColor.withOpacity(0.25);
  static Color white10 = whiteColor.withOpacity(0.10);
  static Color white5 = whiteColor.withOpacity(0.05);

  static Color success75 = successColor.withOpacity(0.75);
  static Color success45 = successColor.withOpacity(0.45);
  static Color success25 = successColor.withOpacity(0.25);
  static Color success10 = successColor.withOpacity(0.10);
  static Color success5 = successColor.withOpacity(0.05);

  static Color primary75 = primaryColor.withOpacity(0.75);
  static Color primary45 = primaryColor.withOpacity(0.45);
  static Color primary25 = primaryColor.withOpacity(0.25);
  static Color primary10 = primaryColor.withOpacity(0.10);
  static Color primary5 = primaryColor.withOpacity(0.05);

  // button

  // screen-bg & primary color
  static Color getPrimaryColor() {
    return primaryColor;
  }

  // static Color getScreenBgColor() {
  //   return Get.find<ThemeController>().darkTheme ? cardColorDark : cardColor;
  // }

  static Color orderStatusColor(String state) {
    Color color = ColorResources.primaryColor;
    switch (state) {
      case '1': // Pending
        color = ColorResources.pendingColor;
        break;
      case '2': // Shipping
        color = ColorResources.shippingColor;
        break;
      case '3': // Completed
        color = ColorResources.successColor;
        break;
      case '4': // Cancelled
        color = ColorResources.primaryColor;
        break;
    }
    return color;
  }

  static Color notificationStatusColor(String state) {
    Color color = ColorResources.primaryColor;
    switch (state) {
      case '1': // Place
        color = Color(0xFF8F9F5A);
        break;
      case '2'://pending
        color = Color(0xFFE2BE30);
        break;
      case '3': // Shipping
        color = Color(0xFFDA6822);
        break;
      case '4': // Completed
        color = ColorResources.successColor;
        break;
      case '5': // Cancelled
        color = ColorResources.errorColor;
        break;
    }
    return color;
  }

  static Color getblack45() {
    return black45;
  }

  static Color getPrimaryButtonColor() {
    return primaryColor;
  }

  static Color getCardBgColor() {
    return black45;
  }

  static Color getTextColor() {
    return black75;
  }

  // transparent color
  static Color getTransparentColor() {
    return transparentColor;
  }
}
