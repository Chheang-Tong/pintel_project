import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '/common/common.dart';
import '../../../core/core.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final Map<String, String> menuItems = {
    'Profile': 'assets/image/profile.svg',
    'Address': 'assets/image/marker.svg',
    'About Store': 'assets/image/store.svg',
    'Notification': 'assets/image/notification.svg',
    'Store Saved': 'assets/image/save.svg',
    'Share Store': 'assets/image/share.svg',
    'Reset Password': 'assets/image/reset_password.svg',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorResources.black75,
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
                menuItems.length,
                (index) {
                  String title = menuItems.keys.elementAt(index);
                  String assets = menuItems.values.elementAt(index);
                  return menuList(
                    onTap: () {},
                    assets: assets,
                    title: title,
                  );
                },
              ),
              GestureDetector(
                onTap: () {},
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
                                      'assets/image/language_english1.png',
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
