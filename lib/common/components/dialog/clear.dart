import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

clearDialogs({required Function tap}) {
  return Get.defaultDialog(
    title: 'Confirm Clearing',
    titleStyle: semiBoldExtraLarge.copyWith(
      fontFamily: 'Urbanist',
    ),
    titlePadding: EdgeInsets.all(8),
    middleText: 'Are you sure you want to remove everything from your cart?',
    middleTextStyle: semiBoldDefault.copyWith(fontFamily: 'Urbanist'),
    confirmTextColor: ColorResources.whiteColor,
    radius: 16,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    confirm: SizedBox(
      height: 40,
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorResources.successColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => tap(),
        child: Text(
          'Yes',
          style: semiBoldDefault.copyWith(
            color: ColorResources.whiteColor,
            fontFamily: 'Urbanist',
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
            color: ColorResources.blackColor,
            fontFamily: 'Urbanist',
          ),
        ),
      ),
    ),
  );
}
