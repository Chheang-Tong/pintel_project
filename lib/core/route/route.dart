import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../feature/feature.dart';

class RouteHelper {
  static const String splashScreen = "/splash_screen";
  static const String onboardScreen = '/onboard_screen';
  static const String authScreen = "/auth_screen";
  static const String dashboardScreen = "/dashboard_screen";
  static const String loginNavbar = '/login_navbar';
  static const String nologNavbar = '/no_login_navbar';
  static const String filterScreen = '/filter_screen';
  static const String cartScreen = "/cart_screen";
  static const String checkoutScreen = "/checkout_screen";
  static const String paymentScreen = "/payment_method";
  static const String paybyABA = "/pay_by_aba";
  static const String productDetails = "/product_detail";
  static const String verifyScreen = "/verify_otp_screen";
  static const String profileScreen = "/profile_screen";

  

  List<GetPage> routes = [
    GetPage( name: splashScreen,page: () => const SplashScreen(), transition: Transition.downToUp,curve: Curves.fastEaseInToSlowEaseOut,),

    GetPage(name: authScreen,page: () => const AuthScreen(),),
    GetPage(name: dashboardScreen,page: () => const DashboardScreen(),transition: Transition.downToUp,curve: Curves.fastOutSlowIn,),
    GetPage(name: loginNavbar, page: () => LoginNavbar()),
    GetPage(name: nologNavbar, page: () => NoLoginNavbar()),
    GetPage(name: filterScreen, page: () => FilterScreen(), transition: Transition.rightToLeft,),
    GetPage(name: cartScreen,page: () => const CartScreen(),transition: Transition.rightToLeft,curve: Curves.fastOutSlowIn,),
    GetPage(name: checkoutScreen,page: () => const CheckoutScreen(),transition: Transition.rightToLeft,curve: Curves.fastOutSlowIn,),
    GetPage(name: paymentScreen, page: () => const PaymentMethod()),
    GetPage(name: paybyABA, page: () => PayByABA()),
    GetPage(name: productDetails,page: () => ProductDetail(),),
    GetPage(name: verifyScreen, page: () => const VerifyOtpScreen(),),
    GetPage(name: profileScreen, page: () => const ProfileScreen(),),  
  ];
}
