import 'package:get/get.dart';

class MenuControllers extends GetxController{
  final Map<String, String> menuItems = {
    'Profile': 'assets/image/profile.svg',
    'Address': 'assets/image/marker.svg',
    'About Store': 'assets/image/store.svg',
    'Notification': 'assets/image/notification.svg',
    'Store Saved': 'assets/image/save.svg',
    'Share Store': 'assets/image/share.svg',
    'Reset Password': 'assets/image/reset_password.svg',
  };
  final List<Map<String, String>> menuItemss = [
    {
      'title': 'Profile',
      'asset': 'assets/image/profile.svg',
      'route': '/profile',
    },
    {
      'title': 'Address',
      'asset': 'assets/image/marker.svg',
      'route': '/address',
    },
   
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