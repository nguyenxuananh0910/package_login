import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/utils/error_empty.dart';
import 'package:package_login/core/utils/extension.dart';
import 'package:package_login/src/presentation/pages/booking/booking_widgets/detail_customer_booking/detail_customer_controller.dart';

class DetailCustomerPage extends StatelessWidget {
  static const String routeName = '/DetailCustomerPage';
  const DetailCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailCustomerController>(
      init: DetailCustomerController(),
      builder: (controller) => Container(
        width: Get.width,
        height: Get.height,
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Your detail',
                style: Get.textTheme.titleMedium!.copyWith(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Form(
                key: controller.keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
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
                        style: context.theme.textTheme.bodyMedium?.copyWith(
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
                      'Phone',
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
                        style: context.theme.textTheme.bodyMedium?.copyWith(
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
                      'Email',
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
                        style: context.theme.textTheme.bodyMedium?.copyWith(
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
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 2,
              endIndent: 22,
              indent: 22,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Attentive: * ',
                      style: Get.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    TextSpan(
                      text: 'Please check personal information before payment.',
                      style: Get.textTheme.bodyLarge!.copyWith(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
