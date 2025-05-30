import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

logoutDialogs({required Function tap}) {
  return Get.defaultDialog(
      title: 'Logout Confirm'.tr,
      titlePadding: EdgeInsets.all(8),
      middleText: 'Are you sure you want to Logout from this store?'.tr,
      middleTextStyle: TextStyle(),
      confirmTextColor: ColorResources.whiteColor,
      radius: 16,
      confirm: SizedBox(
        height: 40,
        width: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: ColorResources.primaryColor,
          ),
          onPressed: () => tap(),
          child: Text(
            'Yes',
            style: semiBoldDefault.copyWith(
              color: ColorResources.whiteColor,
            ),
          ),
        ),
      ),
      cancel: SizedBox(
        height: 40,
        width: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorResources.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Cancel',
            style: semiBoldDefault.copyWith(
              color: ColorResources.successColor,
            ),
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8));
}
