import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/core.dart';

class LoginNavbar extends StatefulWidget {
  const LoginNavbar({super.key});
  @override
  State<LoginNavbar> createState() => _LoginNavbarState();
}

class _LoginNavbarState extends State<LoginNavbar> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginNavbar'),
      ),
      extendBody: true,
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
            iconNav(
              icon: 'assets/image/home.svg',
              text: 'Home',
              index: 0,
            ),
            iconNav(
              icon: 'assets/image/store.svg',
              text: 'Store Info',
              index: 1,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 45,
                width: 64,
                margin: EdgeInsets.symmetric(vertical: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(67),
                  color: ColorResources.primaryColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/image/cart.svg',
                    color: ColorResources.whiteColor,
                  ),
                ),
              ),
            ),
            iconNav(
              icon: 'assets/image/order.svg',
              text: 'Order',
              index: 2,
            ),
            iconNav(
              icon: 'assets/image/list.svg',
              text: 'Menu',
              index: 3,
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
