import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/utils/error_empty.dart';
import 'package:package_login/core/utils/extension.dart';
import 'package:package_login/src/presentation/pages/sign/sign_controller.dart';

class SignPage extends GetView<SignController> {
  static const String routeName = '/SignPage';
  const SignPage({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Column(
                    children: [
                      Text('Sign Up to!',
                          style: Get.theme.textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "To TravelEase Book app.",
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
                        vertical: 20.0, horizontal: 20),
                    child: Form(
                      key: controller.keyForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Name',
                            style: Get.theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Obx(
                            () => TextFormField(
                              validator: (value) =>
                                  value?.checkEmpty(ErrorEmptys.name),
                              // onTap: () => controller.slideController.hide(),
                              controller: controller.nameEditController,
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                      // color: context.theme.hintColor,
                                      ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                errorText: controller.nameError.value,
                                hintText: 'Your Name',
                                hintStyle: context.theme.textTheme.bodySmall
                                    ?.copyWith(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Your Phone',
                            style: Get.theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Obx(
                            () => TextFormField(
                              validator: (value) =>
                                  value?.checkEmpty(ErrorEmptys.phone),
                              // onTap: () => controller.slideController.hide(),
                              controller: controller.phoneEditController,
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                      // color: context.theme.hintColor,
                                      ),
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                errorText: controller.phoneError.value,
                                hintText: 'Your Phone',
                                hintStyle: context.theme.textTheme.bodySmall
                                    ?.copyWith(color: Colors.grey[500]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
                            height: 10,
                          ),
                          Text(
                            'Password',
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
                          Text(
                            'Confirm Password',
                            style: Get.theme.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Obx(
                            () => TextFormField(
                              controller:
                                  controller.confirmPasswordEditController,
                              obscureText: !controller.showPassword.value,
                              validator: (value) =>
                                  value?.checkEmpty(ErrorEmptys.password),
                              style:
                                  context.theme.textTheme.bodyMedium?.copyWith(
                                      // color: context.theme.hintColor,
                                      ),
                              decoration: InputDecoration(
                                errorText:
                                    controller.confirmPasswordError.value,
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
                            height: 20,
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
                                      'Sign In',
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
                              Text("Already have account? ",
                                  style: Get.theme.textTheme.bodyMedium),
                              InkWell(
                                onTap: () => Get.back(),
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
