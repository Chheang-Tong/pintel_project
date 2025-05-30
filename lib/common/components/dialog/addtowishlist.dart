import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

addToWishDialog() {
  return Get.showSnackbar(
    GetSnackBar(
      messageText: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(width: 8),
          Text(
            "Add to Wish",
            style: semiBoldDefault.copyWith(
              color: ColorResources.whiteColor,
              fontFamily: 'Urbanist',
            ),
          ),
        ],
      ),
      maxWidth: 150,
      backgroundColor: Colors.green,
      borderRadius: 30,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      isDismissible: true,
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
    ),
  );
}
