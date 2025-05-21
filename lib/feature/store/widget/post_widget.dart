import 'package:flutter/material.dart';
import 'package:pintel_project/feature/feature.dart';
import '../../../common/components/component.dart';
import '../../../core/core.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  List<String> image = [
    'https://i.pinimg.com/736x/65/ac/a6/65aca6b00a3483fe7999530123e67551.jpg',
    'https://i.pinimg.com/736x/a5/df/2c/a5df2c4668208d5a30e90f761f321bff.jpg',
    'https://i.pinimg.com/736x/fa/d7/38/fad738afd9d1b97d71e40d561e6e1ff7.jpg',
    'https://i.pinimg.com/736x/b7/09/63/b7096352ab6691cbd1315f278819750c.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.defaultRadius),
        color: ColorResources.black10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              8,
              (index) => bodyWidget(),
            ),
            SizedBox(
              height: size.height * 0.09,
            )
          ],
        ),
      ),
    );
  }

  Widget bodyWidget() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: Dimensions.maginH16V8,
      padding: EdgeInsets.all(Dimensions.largeRadius),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.largeRadius),
        color: ColorResources.whiteColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '7 February, 25',
                style: boldMediumLarge,
              ),
              Text(
                '2:35 PM',
                style: boldMediumLarge,
              ),
            ],
          ),
          SeeMoreText(
            text:
                'Lorem Ipsum is simply dummy text of the printing and  typesetting indus Lorem Ipsum is simply dummy text of the printing and  typesetting indus',
          ),
          SizedBox(height: 16),
          StagGrid(
            length: image.length,
            image: image,
          )
        ],
      ),
    );
  }
}
