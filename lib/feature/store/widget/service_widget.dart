import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.largeRadius,
          vertical: Dimensions.vertical4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(vertical: Dimensions.vertical8),
              padding: EdgeInsets.all(Dimensions.largeRadius),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorResources.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorResources.black5,
                    ),
                    child: SvgPicture.asset(
                      'assets/image/customize.svg',
                      width: 24,
                    ),
                  ),
                  Text(
                    'Customizable Store Design & Setup',
                    style: semiBoldMediumLarge,
                  ),
                  Text(
                    'Create a  unique and professional online store with a fully customizable design.  We handle branding, templates, and user-friendly layouts for your  business. this is mem',
                    style: regularDefault,
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(vertical: Dimensions.vertical8),
              padding: EdgeInsets.all(Dimensions.largeRadius),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorResources.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorResources.black5,
                    ),
                    child: SvgPicture.asset(
                      'assets/image/customize.svg',
                      width: 24,
                    ),
                  ),
                  Text(
                    'Secure Payment Gateway Integration',
                    style: semiBoldMediumLarge,
                  ),
                  Text(
                    'Ensure  smooth transactions with secure payment integration. We support credit  cards, PayPal, and other methods for seamless checkout experiences.',
                    style: regularDefault,
                  ),
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
