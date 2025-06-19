import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

logoutDialogs({required Function tap}) {
  return Get.defaultDialog(
      title: 'Logout Confirm'.tr,
      titlePadding: EdgeInsets.only(top: 18),
      middleText: 'Are you sure you want to Logout from your account?'.tr,
      middleTextStyle: TextStyle(),
      confirmTextColor: ColorResources.whiteColor,
      radius: 16,
      confirm: GestureDetector(
        onTap: () => tap(),
        child: Container(
          height: 40,
          width: 120,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorResources.primaryColor,
          ),
          child: Text(
            'Ok',
            style: semiBoldMediumLarge.copyWith(
              color: ColorResources.whiteColor,
            ),
          ),
        ),
      ),
      cancel: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          height: 40,
          width: 120,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorResources.black5,
          ),
          child: Text(
            'Cancel',
            style: semiBoldMediumLarge.copyWith(
              color: ColorResources.black75,
            ),
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8));
}
