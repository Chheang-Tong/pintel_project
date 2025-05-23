import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../core/core.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(vertical: Dimensions.vertical8),
              padding: EdgeInsets.all(Dimensions.largePadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.largeRadius,
                ),
                color: ColorResources.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Information',
                    style: semiBoldMediumLarge,
                  ),
                  Divider(),
                  CustomListTile(
                    leading: SvgPicture.asset('assets/image/call.svg'),
                    title: 'Call',
                    subtitle: '0123456789',
                    onTap: () {
                      Get.snackbar('title', 'message');
                    },
                  ),
                  CustomListTile(
                    leading: SvgPicture.asset('assets/image/mail.svg'),
                    title: 'Email',
                    subtitle: 'tostenh82@gmail.com',
                    onTap: () {
                      Get.snackbar('title', 'message');
                    },
                  ),
                  CustomListTile(
                    leading: SvgPicture.asset('assets/image/category.svg'),
                    title: 'Category',
                    subtitle: 'Ecommerce',
                  ),
                  CustomListTile(
                    leading: SvgPicture.asset('assets/image/clock.svg'),
                    title: 'Status',
                    subtitle: 'Opens at 8 AM - 10 PM',
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(vertical: Dimensions.vertical8),
              padding: EdgeInsets.all(Dimensions.largePadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.largeRadius,
                ),
                color: ColorResources.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Follow Us',
                    style: semiBoldMediumLarge,
                  ),
                  Divider(),
                  Row(
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * .1,
            )
          ],
        ),
      ),
    );
  }
}
