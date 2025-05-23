import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pintel_project/core/core.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(Dimensions.largeRadius),
              margin: EdgeInsets.symmetric(vertical: Dimensions.vertical8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.largeRadius),
                color: ColorResources.whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We're Here",
                    style: semiBoldLarge,
                  ),
                  Text(
                    "Looking for us? Use the map to find our location. We're excited to meet you in person!",
                    style: regularDefault,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: Dimensions.vertical8),
                    width: size.width,
                    height: size.height * .25,
                    decoration: BoxDecoration(
                      color: ColorResources.black45,
                      borderRadius:
                          BorderRadius.circular(Dimensions.smallRadius),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      width: size.width,
                      height: size.height * .06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorResources.black5,
                        borderRadius:
                            BorderRadius.circular(Dimensions.smallRadius),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/image/map.svg'),
                          SizedBox(width: 8),
                          Text(
                            "Get Directions",
                            style: mediumLarge,
                          ),
                        ],
                      ),
                    ),
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
