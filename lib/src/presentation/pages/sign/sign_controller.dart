import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/utils/error_empty.dart';

class SignController extends GetxController {
  late TextEditingController nameEditController;
  late RxnString nameError = RxnString(null);
  late TextEditingController phoneEditController;
  late RxnString phoneError = RxnString(null);
  late TextEditingController emailEditController;
  late RxnString emailError = RxnString(null);
  late TextEditingController passwordEditController;
  final RxnString passwordError = RxnString(null);
  late TextEditingController confirmPasswordEditController;
  final RxnString confirmPasswordError = RxnString(null);
  final RegExp phoneRegex = RegExp(r'^([1-9])?\d{10}$');
  final RegExp specialCharsRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool isChecked = false;
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;
  final keyForm = GlobalKey<FormState>();
  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    passwordEditController = TextEditingController();
    nameEditController = TextEditingController(text: 'anh');
    phoneEditController = TextEditingController(text: '0987654321');
    confirmPasswordEditController = TextEditingController();
    super.onInit();
  }

  void togglePasswordVisibility() {
    showPassword.toggle();
  }

  Future<void> onSend() async {
    if (keyForm.currentState!.validate()) {
      if (nameEditController.text.length > 20) {
        nameError.call('Tên Không Quá 20 Kí Tự');
        return;
      }
      if (!phoneRegex.hasMatch(phoneEditController.text.trim())) {
        phoneError.call('SDT không hợp lệ!');
        return;
      }
      if (!emailEditController.text.contains('@')) {
        emailError.call(ErrorEmptys.emailWrongFormat);
        return;
      }
      if (passwordEditController.text.contains(' ') ||
          !specialCharsRegex.hasMatch(passwordEditController.text.trim())) {
        passwordError.call(
            'password phải có 8 Ký Tự,Chữ Hoa, Kí Tự Đặc Biệt,\n Không Có Khoảng Trống');
        return;
      }
      if (confirmPasswordEditController.text.trim() !=
          passwordEditController.text.trim()) {
        confirmPasswordError.call('Confirm Password phải trừng với Password ');
        return;
      }
    }
    // Get.toNamed(HotelDetailPage.routeName);
    _cleanInput();
  }

  void _cleanInput() {
    nameEditController.text = '';
    phoneEditController.text = '';
    confirmPasswordEditController.text = '';
    emailEditController.text = '';
    passwordEditController.text = '';
    emailError.value = null;
    nameError.value = null;
    phoneError.value = null;
    passwordError.value = null;
    confirmPasswordError.value = null;
  }
}
