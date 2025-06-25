import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

deleteConfirm({required Function onTap}){
  return  Get.dialog(
    AlertDialog(
      backgroundColor: ColorResources.whiteColor,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: Dimensions.space16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      actionsPadding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      title: Center(child: Text('Delete Confirming')),
      titleTextStyle: boldOverLarge.copyWith(
        color: ColorResources.blackColor,
      ),
      content: Text(
        'Are you sure want to delete your address?',
        style: regularDefault.copyWith(),
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.space48,
                  vertical: Dimensions.space10,
                ),
                margin: EdgeInsets.only(right: Dimensions.defaultMagin),
                decoration: BoxDecoration(
                  color: ColorResources.black5,
                  borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
                ),
                child: Center(
                  child: Text(
                    'Cancel',
                    style: semiBoldMediumLarge.copyWith(
                      color: ColorResources.black75,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () =>onTap(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.space48,
                  vertical: Dimensions.space10,
                ),
                margin: EdgeInsets.only(
                  left: Dimensions.defaultMagin,
                ),
                decoration: BoxDecoration(
                  color: ColorResources.primaryColor,
                  borderRadius: BorderRadius.circular(
                    Dimensions.defaultRadius,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Yes',
                    style: semiBoldMediumLarge.copyWith(
                      color: ColorResources.whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}