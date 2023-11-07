import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/home/home_page.dart';
import 'package:package_login/src/presentation/pages/mybooking/mybooking_page.dart';
import 'package:package_login/src/presentation/pages/profile/profile_page.dart';

class NavigatorMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = const [HomePage(), MyBookingPage(), ProfilePage()];
}
