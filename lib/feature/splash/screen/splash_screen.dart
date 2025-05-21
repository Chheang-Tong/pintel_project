import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pintel_project/feature/dashboard/dashboard.dart';
import 'package:pintel_project/feature/splash/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(
    SplashController(
      apiClient: Get.find(),
      localizationController: Get.find(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              top: size.height * controller.topPosition.value,
              left: controller.leftPosition.value,
              right: controller.rightPosition.value,
              child: AnimatedOpacity(
                opacity: controller.opacity.value,
                duration: Duration(milliseconds: 700),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 64,
                  ),
                  width: size.width,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/image.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              top: size.height * controller.dasTop.value,
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 800),
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: DashboardScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
