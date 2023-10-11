import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailEditController =
      TextEditingController(text: 'nguyenxuananh@gmail.com');
  final RxnString emailChiError = RxnString(null);
  final TextEditingController passwordEditController =
      TextEditingController(text: 'abc');
}
