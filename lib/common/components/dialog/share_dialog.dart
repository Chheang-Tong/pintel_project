import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../common.dart';

shareDialog({required String link}) {
  final List<Map<String, String>> socialLinks = [
    {
      'title': 'Facebook',
      'icon': 'assets/image/facebook_f.svg',
    },
    {
      'title': 'Twitter',
      'icon': 'assets/image/twitter.svg',
    },
    {
      'title': 'LinkedIn',
      'icon': 'assets/image/linkin.svg',
    },
    {
      'title': 'Instagram',
      'icon': 'assets/image/instagram.svg',
    },
  ];
  return Get.dialog(
    AlertDialog(
      backgroundColor: ColorResources.whiteColor,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: Dimensions.space16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      actionsPadding: EdgeInsets.all(16),
      titlePadding: EdgeInsets.all(16),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Share Store'),
              Spacer(),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorResources.black5,
                  ),
                  child: Icon(
                    Icons.close,
                    color: ColorResources.blackColor,
                    size: 16,
                  ),
                ),
              )
            ],
          ),
          Divider(
            color: ColorResources.black5,
            thickness: 1,
          ),
        ],
      ),
      titleTextStyle: boldOverLarge.copyWith(
        color: ColorResources.blackColor,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            socialLinks.length,
            (index) => AppLink(
              onTap: () {},
              title: socialLinks[index]['title']!,
              leading: SvgPicture.asset(
                socialLinks[index]['icon']!,
                width: 24,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Copy Link',
              style: mediumLarge,
            ),
            SizedBox(
              height: Dimensions.space8,
            ),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: link,
                hintStyle: regularDefault.copyWith(
                  color: ColorResources.black75,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.largeRadius),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: Dimensions.space8,
                  horizontal: Dimensions.space15,
                ),
                fillColor: ColorResources.black5,
                filled: true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: link,
                      ),
                    );
                    // Get.snackbar(
                    //   'Link Copied',
                    //   'The link has been copied to your clipboard.',
                    //   backgroundColor: ColorResources.whiteColor,
                    //   colorText: ColorResources.blackColor,
                    //   duration: Duration(seconds: 2),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: Dimensions.space8,
                      right: Dimensions.space15,
                    ),
                    child: SvgPicture.asset(
                      'assets/image/copy.svg',
                      width: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
