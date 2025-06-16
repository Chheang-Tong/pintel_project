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
    return Scaffold(
      //  appBar: AppBar(
      //    title:Text('AboutStore'),
      //   ),
      body: Stack(
        children: [
          StoreScreen(),
          Positioned(
            top: 26,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorResources.white25,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorResources.blackColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
