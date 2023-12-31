import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/utils/error_empty.dart';
import 'package:package_login/core/utils/extension.dart';
import 'package:package_login/src/presentation/pages/login/login_controller.dart';
import 'package:package_login/src/presentation/pages/sign/sign_page.dart';

class LoginView extends GetView<LoginController> {
  static const String routeName = '/LoginView';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 40),
                  child: Column(
                    children: [
                      Text('Welcome Back!',
                          style: Get.theme.textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "To your favorite Book app.",
                        style: Get.theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(28)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 36.0, horizontal: 20),
                    child: Form(
                      key: controller.keyForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Email',
                            style: Get.theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Obx(
                            () => TextFormField(
                              validator: (value) =>
                                  value?.checkEmpty(ErrorEmptys.email),
                              // onTap: () => controller.slideController.hide(),
                              controller: controller.emailEditController,
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                      // color: context.theme.hintColor,
                                      ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                errorText: controller.emailError.value,
                                hintText: 'mail@example.com',
                                hintStyle: context.theme.textTheme.bodySmall
                                    ?.copyWith(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Your Password',
                            style: Get.theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Obx(
                            () => TextFormField(
                              controller: controller.passwordEditController,
                              obscureText: !controller.showPassword.value,
                              validator: (value) =>
                                  value?.checkEmpty(ErrorEmptys.password),
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                      // color: context.theme.hintColor,
                                      ),
                              decoration: InputDecoration(
                                errorText: controller.passwordError.value,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.showPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed:
                                      controller.togglePasswordVisibility,
                                ),
                                alignLabelWithHint: true,
                                hintText: 'Enter your password',
                                hintStyle: context.theme.textTheme.bodySmall
                                    ?.copyWith(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(''),
                              Text(
                                'Forgot password?',
                                style: Get.textTheme.bodySmall!
                                    .copyWith(color: Colors.redAccent),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: Get.width,
                            child: GestureDetector(
                              onTap: () => controller.onSend(),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.redAccent),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Login',
                                      style: Get.theme.textTheme.titleMedium
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[300]!)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Text(
                          //   'Or Login With',
                          //   style: Get.theme.textTheme.bodyMedium,
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have ann account? ",
                                  style: Get.theme.textTheme.bodyMedium),
                              InkWell(
                                onTap: () => Get.toNamed(SignPage.routeName),
                                child: Text(
                                  "Sign Up ",
                                  style: Get.theme.textTheme.bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
