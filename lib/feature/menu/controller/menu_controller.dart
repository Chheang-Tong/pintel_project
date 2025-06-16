import 'package:get/get.dart';
import '/core/core.dart';

class MenuControllers extends GetxController{
 
  final List<Map<String, String>> menuItemss = [
    {
      'title': 'Profile',
      'asset': 'assets/image/profile.svg',
      'route': RouteHelper.profileScreen,
    },
    {
      'title': 'Address',
      'asset': 'assets/image/marker.svg',
      'route': RouteHelper.addressScreen,
    },
    {
      'title': 'About Store',
      'asset': 'assets/image/store.svg',
      'route': RouteHelper.aboutStore,
    },
    {
      'title': 'Notification',
      'asset': 'assets/image/notification.svg',
      'route':  RouteHelper.notificationScreen,
    },
    {
      'title': 'Store Saved',
      'asset': 'assets/image/save.svg',
      'route': RouteHelper.saveStoreScreen,
    },
    // {
    //   'title': 'Share Store',
    //   'asset': 'assets/image/share.svg',
    //   'route': '',
    // },
    // {
    //   'title': 'Reset Password',
    //   'asset': 'assets/image/reset_password.svg',
    //   'route':  RouteHelper.resetPassword,
    // }
   
  ];

  final Map<String, String> langItems = {
    'English': 'assets/image/usa_flag.jpg',
    'Khmer': 'assets/image/cambodia_flag.jpg',
  };
 
  int selectedLangIndex = 0;
  onLang(int index) {
    selectedLangIndex = index;
    update();
  }
}