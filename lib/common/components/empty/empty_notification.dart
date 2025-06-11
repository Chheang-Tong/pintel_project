import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/core.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.space20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/image/empty_notification.svg',
          ),
          SizedBox(
            height: Dimensions.space24,
          ),
          Text(
            'No notification',
            style: semiBoldMediumLarge.copyWith(
              color: ColorResources.black45,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * .1,
          )
        ],
      ),
    );
  }
}
