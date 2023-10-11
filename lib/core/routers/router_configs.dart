import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/login/login_controller.dart';
import 'package:package_login/src/presentation/pages/login/login_page.dart';

class RouterUserConfigs {
  static final List<GetPage<void>> routes = [
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => LoginController());
        },
      ),
    ),
  ];
}
