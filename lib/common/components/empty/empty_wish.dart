import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/core.dart';

class EmptyWish extends StatelessWidget {
  const EmptyWish({
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
            'assets/image/empty_wish.svg',
          ),
          Text(
            'No items added!.',
            style: semiBoldMediumLarge,
          ),
          Text(
            'Looks like your wishlist is empty. Start exploring and add your favorites!',
            style: regularLarge.copyWith(letterSpacing: 0.02),
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
