import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/utils/extension.dart';
import 'package:package_login/src/presentation/pages/booking/booking_widgets/finish_booking/finish_booking_controller.dart';

class FinishBookingPage extends StatelessWidget {
  static const String routeName = '/BookingOverview';
  const FinishBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FinishBookingController>(
        init: FinishBookingController(),
        builder: (controller) => Container(
              width: Get.width,
              height: Get.height,
              color: Colors.grey[100],
              child: const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      PaymentMethod(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Payment(),
                      ),
                      BookingInformation(),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment method',
                style: Get.textTheme.titleMedium!.copyWith(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  'Choose a payment method',
                  style: Get.textTheme.bodySmall!.copyWith(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border:
                                Border.all(color: Colors.grey[300]!, width: 2),
                          ),
                          child: const Icon(Icons.paypal_outlined),
                        ),
                        Text(
                          'Paypal',
                          style: Get.textTheme.bodySmall!.copyWith(),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.redAccent.shade100, width: 2),
                          ),
                          child: const Icon(Icons.wallet),
                        ),
                        Text(
                          'e-wallet',
                          style: Get.textTheme.bodySmall!.copyWith(),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border:
                                Border.all(color: Colors.grey[300]!, width: 2),
                          ),
                          child: const Icon(Icons.add),
                        ),
                        const Text(
                          '',
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment ',
                    style: Get.textTheme.titleMedium!.copyWith(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.payment_outlined,
                                color: Colors.blue),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              '3294 **** **** **14',
                              style: Get.textTheme.bodyMedium!.copyWith(),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.payment_outlined,
                                color: Colors.blue),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              '3294 **** **** **14',
                              style: Get.textTheme.bodyMedium!.copyWith(),
                            ),
                          ],
                        ),
                        const Icon(Icons.radio_button_off),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.payment_outlined),
                    Text(
                      'Add New Card',
                      style: Get.textTheme.bodyMedium!.copyWith(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookingInformation extends StatelessWidget {
  const BookingInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoàng Văn Thắng ',
                style: Get.textTheme.titleMedium!.copyWith(),
              ),
              Text(
                'hvthang002@gmail.com',
                style: Get.textTheme.bodyMedium!.copyWith(),
              ),
              Text(
                '0847263884',
                style: Get.textTheme.bodyMedium!.copyWith(),
              ),
              Text(
                'Royale President Hotel',
                style: Get.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check-in',
                          style: Get.textTheme.titleMedium!.copyWith(),
                        ),
                        Text(
                          DateTime.now().formatDateToString(),
                          style: Get.textTheme.bodySmall?.copyWith(),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check-out',
                          style: Get.textTheme.titleMedium!.copyWith(),
                        ),
                        Text(
                          DateTime.now().formatDateToString(),
                          style: Get.textTheme.bodySmall?.copyWith(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Rooms : ',
                        style: Get.textTheme.titleMedium!.copyWith(),
                      ),
                      Text(
                        '1',
                        style: Get.textTheme.titleMedium?.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Max guests:',
                        style: Get.textTheme.titleMedium!.copyWith(),
                      ),
                      Text(
                        ' 2',
                        style: Get.textTheme.titleMedium?.copyWith(),
                      ),
                    ],
                  ),
                  const Text('')
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    Text(
                      'Final price: ',
                      style: Get.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '4,600,000đ',
                      style: Get.textTheme.titleLarge?.copyWith(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Includes taxes',
                  style: Get.textTheme.titleSmall!.copyWith(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
