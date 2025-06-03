import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pintel_project/feature/feature.dart';

import '../../../core/core.dart';

class LoginNavbar extends StatefulWidget {
  const LoginNavbar({super.key});
  @override
  State<LoginNavbar> createState() => _LoginNavbarState();
}

class _LoginNavbarState extends State<LoginNavbar> {
  final LogController logController = Get.put(LogController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LogController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        body: controller.screen[controller.selectIndex],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                controller.screen.length,
                (index) => iconNav(
                  icon: controller.title.values.elementAt(index),
                  text: controller.title.keys.elementAt(index),
                  index: index,
                  selectIndex: controller.selectIndex,
                  onTap: () => controller.onChange(index),
                ),
              ),
              // iconNav(
              //   icon: '',
              //   text: 'Home',
              //   index: 0,
              // ),

              // GestureDetector(
              //   onTap: () {},
              //   child: Container(
              //     height: 45,
              //     width: 64,
              //     margin: EdgeInsets.symmetric(vertical: 6),
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(67),
              //       color: ColorResources.primaryColor,
              //     ),
              //     child: Center(
              //       child: SvgPicture.asset(
              //         'assets/image/cart.svg',
              //         color: ColorResources.whiteColor,
              //       ),
              //     ),
              //   ),
              // ),
              // iconNav(
              //   icon: '',
              //   text: 'Order',
              //   index: 1,
              // ),
              // iconNav(
              //   icon: '',
              //   text: 'Wishlist',
              //   index: 2,
              // ),
              // iconNav(
              //   icon: '',
              //   text: 'Menu',
              //   index: 3,
              // ),
            ],
          ),
        ),
      );
    });
  }

  Widget iconNav({
    required String icon,
    required String text,
    required int index,
    required int selectIndex,
    required Function() onTap,
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
}
