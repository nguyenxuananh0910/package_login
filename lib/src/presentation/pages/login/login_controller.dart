import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/utils/error_empty.dart';
import 'package:package_login/src/presentation/pages/home/home_page.dart';

class LoginController extends GetxController {
  late TextEditingController emailEditController;
  late RxnString emailError = RxnString(null);
  late TextEditingController passwordEditController;
  final RxnString passwordError = RxnString(null);
  bool isChecked = false;
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;
  final keyForm = GlobalKey<FormState>();
  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    passwordEditController = TextEditingController();
    super.onInit();
  }

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  Future<void> onSend() async {
    if (keyForm.currentState!.validate()) {
      if (!emailEditController.text.contains('@')) {
        emailError.call(ErrorEmptys.emailWrongFormat);
        return;
      }
      if (passwordEditController.text.contains(' ')) {
        passwordError.call(ErrorEmptys.passwordSpace);
        return;
      }
      Get.toNamed(HomePage.routeName);
      _cleanInput();
    }
  }

  void _cleanInput() {
    emailEditController.text = '';
    passwordEditController.text = '';
    emailError.value = null;
    passwordError.value = null;
  }
}
