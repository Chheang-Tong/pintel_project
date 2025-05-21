import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Tos Tenh Group',
                        style: semiBoldMediumLarge,
                      ),
                      Text(
                        'The Tos Tenh Group is a leading organization dedicated to excellence  and innovation across various industries. With a strong focus on  quality, integrity, and customer satisfaction, we aim to deliver  exceptional products and services that drive success and growth for our  clients.',
                        style: regularDefault,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Container(
                    width: size.width,
                    height: size.height * .33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimensions.extrasmallRadius,
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.pinimg.com/736x/54/03/76/54037652b872fed8cae5979731a6372e.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset('assets/image/quality_check.svg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We Provide The Hight Quality Product',
                    style: semiBoldMediumLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'At the heart of our business is a commitment to delivering high-quality products. We focus on precision, durability, and innovation to ensure that every item meets the highest standards. Trust us to provide you with exceptional products designed to enhance your experience and exceed your expectations.',
                    style: regularDefault,
                    textAlign: TextAlign.center,
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
