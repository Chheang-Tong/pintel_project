import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/core.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan to Pay',
          style: boldOverLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Scan. Pay. Done.',
            style: semiBoldLarge,
          ),
          const SizedBox(height: 24),
          Center(
            child: SvgPicture.asset(
              'assets/image/sampleofaba.svg',
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.space90,
              ),
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: ColorResources.black5,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/image/down.svg',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Save QR',
                    style: semiBoldDefault,
                    textAlign: TextAlign.center,
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
