import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/filter/filter_controller.dart';
import 'package:package_login/src/presentation/pages/filter/filter_page.dart';
import 'package:package_login/src/presentation/pages/home/home_controller.dart';
import 'package:package_login/src/presentation/pages/home/home_page.dart';
import 'package:package_login/src/presentation/pages/hotel_detal/hotel_detail_controller.dart';
import 'package:package_login/src/presentation/pages/hotel_detal/hotel_detail_page.dart';
import 'package:package_login/src/presentation/pages/login/login_controller.dart';
import 'package:package_login/src/presentation/pages/login/login_page.dart';
import 'package:package_login/src/presentation/pages/sign/sign_controller.dart';
import 'package:package_login/src/presentation/pages/sign/sign_page.dart';

class RouterUserConfigs {
  static final List<GetPage<void>> routes = [
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(LoginController.new),
      ),
    ),
    GetPage(
      name: SignPage.routeName,
      page: () => const SignPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(SignController.new),
      ),
    ),
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(HomeController.new),
      ),
    ),
    GetPage(
      name: HotelDetailPage.routeName,
      page: () => const HotelDetailPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(HotelDetailController.new),
      ),
    ),
    GetPage(
      name: FilterPage.routeName,
      page: () => const FilterPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(FilterController.new),
      ),
    ),
  ];
}
