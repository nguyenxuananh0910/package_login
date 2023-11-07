import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailCustomerController extends GetxController {
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
}
