import 'package:flutter/material.dart';
import 'package:pintel_project/core/core.dart';
import 'package:pintel_project/feature/feature.dart';

class AboutStore extends StatefulWidget {
  const AboutStore({super.key});
  @override
  State<AboutStore> createState() => _AboutStoreState();
}

class _AboutStoreState extends State<AboutStore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 30,
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: StoreScreen(),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: size.width,
              height: 75,
              color: ColorResources.bgColor,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: ColorResources.blackColor,
                          // size: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'About Store',
                        style: boldOverLarge,
                      )
                    ],
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
