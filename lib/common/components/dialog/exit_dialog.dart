
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../common.dart';

showExitDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: ColorResources.getCardBgColor(),
      insetPadding: const EdgeInsets.symmetric(horizontal: Dimensions.space40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: Dimensions.space40,
                  bottom: Dimensions.space15,
                  left: Dimensions.space15,
                  right: Dimensions.space15),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: ColorResources.getCardBgColor(),
                  borderRadius:
                      BorderRadius.circular(Dimensions.defaultRadius)),
              child: Column(
                children: [
                  const SizedBox(height: Dimensions.space10),
                  Text(
                    LocalStrings.exit.tr,
                    style: regularSmall.copyWith(
                        color: ColorResources.getTextColor(),
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontDefault + 3),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  Text(
                    LocalStrings.exitTitle.tr,
                    style: regularSmall.copyWith(
                        color: ColorResources.getTextColor(),
                        fontSize: Dimensions.fontDefault),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  const SizedBox(height: Dimensions.space20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RoundedButton(
                          text: LocalStrings.no.tr,
                          press: () {
                            Navigator.pop(context);
                          },
                          horizontalPadding: 3,
                          verticalPadding: 3,
                          color: ColorResources.black25,
                          textColor: ColorResources.whiteColor,
                        ),
                      ),
                      const SizedBox(width: Dimensions.space10),
                      Expanded(
                        child: RoundedButton(
                            text: LocalStrings.yes.tr,
                            press: () {
                              SystemNavigator.pop();
                            },
                            horizontalPadding: 3,
                            verticalPadding: 3,
                            color: ColorResources.getPrimaryColor(),
                            textColor: ColorResources.whiteColor,),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: -40,
              left: MediaQuery.of(context).padding.left,
              right: MediaQuery.of(context).padding.right,
              child: Image.asset(
                MyImages.warningImage,
                height: 80,
                width: 80,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
