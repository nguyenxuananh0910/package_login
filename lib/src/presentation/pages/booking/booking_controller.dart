import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/booking/booking_widgets/booking_overview/booking_overview_page.dart';
import 'package:package_login/src/presentation/pages/booking/booking_widgets/detail_customer_booking/detail_customer_page.dart';
import 'package:package_login/src/presentation/pages/booking/booking_widgets/finish_booking/finish_booking_page.dart';
import 'package:package_login/src/presentation/widgets/dia_log/dialog_custom.dart';

import '../navigator_menu/navigator_menu_page.dart';

class BookingController extends GetxController {
  final _currentStepAndPage = 0.obs;
  final pageController = PageController();
  int get currentStepAndPage => _currentStepAndPage.value;
  final pages = const [
    DetailCustomerPage(),
    BookingOverviewPage(),
    FinishBookingPage()
  ].obs;
  @override
  void onInit() {
    pageController.addListener(() {
      _currentStepAndPage.value = pageController.page!.round();
    });
    super.onInit();
  }

  void goToStepAndPage(int index) {
    pageController.jumpToPage(index);
    _currentStepAndPage.value = index;
  }

  void nextToStepAndPage() {
    final isLastPage = _currentStepAndPage.value == pages.length - 1;
    if (isLastPage) {
      onPayMent();
      return;
    }
    final next = _currentStepAndPage.value + 1;
    goToStepAndPage(next);
  }

  Future<void> onPayMent() async {
    Get.dialog(DiaLogCustom(
      onTap: () => Get.offAllNamed(NavigatorMenuPage.routeName),
    ));
  }
}
