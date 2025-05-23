import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pintel_project/core/core.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/common.dart';
import '../../feature.dart';

class NoLoginNavbar extends StatefulWidget {
  const NoLoginNavbar({super.key});
  @override
  State<NoLoginNavbar> createState() => _NoLoginNavbarState();
}

class _NoLoginNavbarState extends State<NoLoginNavbar> {
  int selectIndex = 0;
  List<Widget> screen = [
    HomeScreen(),
    StoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: screen[selectIndex],
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: ColorResources.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(screen.length, (index) {
              return iconNav(
                icon: index == 0
                    ? 'assets/image/home.svg'
                    : 'assets/image/store.svg',
                text: index == 0 ? 'Home' : 'Store Info',
                index: index,
              );
            }),
            iconNavs(
              icon: 'assets/image/share.svg',
              text: 'Shared',
              onTap: () {
                shareDialog(link: 'https://tostenhstore.pintel.biz');
              },
            ),
            iconNavs(
              icon: 'assets/image/login.svg',
              text: 'Login',
              onTap: () {
                Get.toNamed(RouteHelper.authScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget iconNav({
    required String icon,
    required String text,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              color: selectIndex == index
                  ? ColorResources.primaryColor
                  : ColorResources.black45,
            ),
            Text(
              text,
              style: TextStyle(
                color: selectIndex == index
                    ? ColorResources.primaryColor
                    : ColorResources.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconNavs({
    required String icon,
    required String text,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              color: ColorResources.black45,
            ),
            Text(
              text,
              style: TextStyle(
                color: ColorResources.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
