library package_login;

import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/login/login_page.dart';

class CoreUserPackage {
  static void goLogin() {
    Get.toNamed(LoginView.routeName);
  }

  static Future init({
    required String urlAPI,
  }) async {
    urlAPI = urlAPI;
  }
}
