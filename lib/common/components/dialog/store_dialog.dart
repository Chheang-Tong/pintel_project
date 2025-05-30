import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

storeDialog({bool ispublic = true}) {
  return Get.showSnackbar(
    GetSnackBar(
      messageText: Text(
        ispublic ? "Your Store is Public" : 'Your Store is Unpublic',
        textAlign: TextAlign.center,
        style: semiBoldDefault.copyWith(
          color: ColorResources.whiteColor,
        ),
      ),
      maxWidth: ispublic ? 150 : 170,
      backgroundColor: ispublic ? Colors.green : ColorResources.errorColor,
      borderRadius: 16,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
      isDismissible: true,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    ),
  );
}
