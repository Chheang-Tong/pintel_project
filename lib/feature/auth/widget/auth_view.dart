import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

class AuthView extends StatefulWidget {
  const AuthView({
    super.key,
    required this.storeName,
    required this.aboutStore,
    required this.title,
    this.imageUrl,
  });
  final String storeName, aboutStore, title;
  final String? imageUrl;

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF200309),
            Color(0xFF8F3749),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -37,
            left: -107,
            child: Container(
              width: size.width * 0.95,
              height: size.width * 0.95,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorResources.white10,
              ),
            ),
          ),
          Positioned(
            top: -152,
            left: -222,
            child: Container(
              width: size.width * 1.5,
              height: size.width * 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorResources.white5,
              ),
            ),
          ),
          Positioned(
            top: 65,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorResources.whiteColor,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 116,
            right: 20,
            child: Row(
              children: [
                Container(
                  height: 83,
                  width: 83,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: ColorResources.white45,
                      width: 5,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: widget.imageUrl != null
                          ? DecorationImage(
                              image: NetworkImage(widget.imageUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: widget.imageUrl == null
                        ? Padding(
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              'assets/image/bag.svg',
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.storeName,
                        style: boldOverLarge.copyWith(
                          color: ColorResources.whiteColor,
                        ),
                      ),
                      Text(
                        widget.aboutStore,
                        style: regularDefault.copyWith(
                          color: ColorResources.whiteColor,
                        ),
                        maxLines: 3,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.1,
              decoration: BoxDecoration(
                color: ColorResources.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.largePadding,
                      // vertical: Dimensions.space23,
                    ),
                    child: Text(
                      widget.title,
                      style: boldMegaLarge.copyWith(
                        color: ColorResources.blackColor,
                        fontSize: 36,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
