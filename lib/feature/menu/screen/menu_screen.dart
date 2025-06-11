import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../feature.dart';
import '/common/common.dart';
import '../../../core/core.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final MenuControllers menuController = Get.put(MenuControllers());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<MenuControllers>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultMagin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.largeMagin,
                        vertical: Dimensions.defaultMagin,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorResources.black10,
                          width: 5,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorResources.black5,
                          shape: BoxShape.circle,
                          // image: DecorationImage(
                          //   image: AssetImage('assets/image/fashion.png'),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child: SvgPicture.asset(
                          'assets/image/user.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Customer 01',
                      style: boldMegaLarge,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimensions.defaultPadding,
                  ),
                  child: DotDivider(color: ColorResources.black10),
                ),
                Text(
                  'Menu',
                  style: boldOverLarge,
                ),
                ...List.generate(
                  controller.menuItemss.length,
                  (index) {
                    final item = controller.menuItemss[index];
                    return menuList(
                      onTap: () {
                        Get.toNamed(item['route']!);
                      },
                      assets: item['asset']!,
                      title: item['title']!,
                    );
                  },
                ),
                menuList(
                  onTap: () {
                    shareDialog(link: 'link');
                  },
                  assets: 'assets/image/share.svg',
                  title: 'Share Store',
                ),
                menuList(
                  onTap: () {
                    Get.toNamed(RouteHelper.resetPassword);
                  },
                  assets: 'assets/image/reset_password.svg',
                  title: 'Reset Password',
                ),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      persistent: true,
                      enableDrag: true,
                      AnimatedPadding(
                        padding: MediaQuery.of(context).viewInsets,
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.decelerate,
                        child: Container(
                          padding: EdgeInsets.all(
                            Dimensions.largePadding,
                          ),
                          height: size.height * 0.4,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: ColorResources.bgColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                Dimensions.largeRadius,
                              ),
                              topRight: Radius.circular(
                                Dimensions.largeRadius,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 6,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: ColorResources.black45
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              SizedBox(height: Dimensions.space16),
                              Text(
                                'Choose Language',
                                style: boldOverLarge,
                              ),
                              SizedBox(height: Dimensions.space10),
                              ...List.generate(
                                controller.langItems.length,
                                (index) {
                                  String title = controller.langItems.keys
                                      .elementAt(index);
                                  String assets = controller.langItems.values
                                      .elementAt(index);
                                  return GestureDetector(
                                    onTap: () => controller.onLang(index),
                                    child: GetBuilder<MenuControllers>(
                                        builder: (controller) {
                                      return Container(
                                        width: size.width,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.defaultPadding,
                                          vertical: Dimensions.largePadding,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          vertical: Dimensions.defaultMagin,
                                        ),
                                        decoration: BoxDecoration(
                                          color: controller.selectedLangIndex ==
                                                  index
                                              ? ColorResources.primary5
                                              : ColorResources.whiteColor,
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.defaultRadius,
                                          ),
                                          border: Border.all(
                                            color: controller
                                                        .selectedLangIndex ==
                                                    index
                                                ? ColorResources.primaryColor
                                                : ColorResources
                                                    .transparentColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 24,
                                              width: 24,
                                              margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    Dimensions.defaultMagin,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 3.33,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color:
                                                      ColorResources.blackColor,
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      assets,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              title,
                                              style: boldMediumLarge,
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        // controller.setLanguage();
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.largeMagin,
                                          vertical: Dimensions.space10,
                                        ),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.defaultRadius,
                                          ),
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
                                  ),
                                  SizedBox(width: Dimensions.space10),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        // controller.setLanguage();
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.largeMagin,
                                          vertical: Dimensions.space10,
                                        ),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            Dimensions.defaultRadius,
                                          ),
                                          color: ColorResources.primaryColor,
                                        ),
                                        child: Text(
                                          'Save',
                                          style: semiBoldMediumLarge.copyWith(
                                            color: ColorResources.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/image/language.svg',
                        color: ColorResources.black75,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.defaultMagin,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.defaultPadding,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Languages',
                                style: boldOverLarge,
                              ),
                              const Spacer(),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ColorResources.black25,
                                    width: 1,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/image/usa_flag.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.space30),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.largeMagin,
                      vertical: Dimensions.space10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.defaultRadius,
                      ),
                      color: ColorResources.primary10,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/image/logout.svg'),
                        SizedBox(width: Dimensions.space10),
                        Text(
                          'Logout',
                          style: semiBoldMediumLarge.copyWith(
                            color: ColorResources.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget menuList({
    required Function onTap,
    required String assets,
    required String title,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        children: [
          SvgPicture.asset(
            assets,
            color: ColorResources.black75,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultMagin,
              ),
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.defaultPadding,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorResources.black10,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    title,
                    style: boldOverLarge,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorResources.black75,
                      size: 18,
                      weight: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
