import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/constrants/localVariable.dart';
import 'package:package_login/core/gen/assets.gen.dart';
import 'package:package_login/core/utils/extension.dart';
import 'package:package_login/src/presentation/pages/booking/booking_widgets/booking_overview/booking_overview_controller.dart';

class BookingOverviewPage extends StatelessWidget {
  static const String routeName = '/BookingOverview';
  const BookingOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingOverviewController>(
      init: BookingOverviewController(),
      builder: (controller) => Container(
        width: Get.width,
        height: Get.height,
        color: Colors.grey[50],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HotelSelected(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      const Divider(
                        color: Colors.grey,
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'For',
                              style: Get.textTheme.titleMedium!.copyWith(),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2 nights, ',
                                    style: Get.textTheme.bodySmall!.copyWith(),
                                  ),
                                  TextSpan(
                                    text: '1 room ',
                                    style: Get.textTheme.bodySmall!.copyWith(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Standard Room',
                          style: Get.textTheme.titleMedium!.copyWith(),
                        ),
                        Text(
                          '4,500,000đ',
                          style: Get.textTheme.titleMedium?.copyWith(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxes',
                            style: Get.textTheme.bodySmall!.copyWith(),
                          ),
                          Text(
                            '8%',
                            style: Get.textTheme.bodySmall?.copyWith(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          alignLabelWithHint: true,
                          hintText: 'Add your coupon code',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Coupon',
                            style: Get.textTheme.bodySmall!.copyWith(),
                          ),
                          Text(
                            '-500,000đ',
                            style: Get.textTheme.bodySmall?.copyWith(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Note',
                        style: Get.textTheme.titleMedium!.copyWith(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          style: context.theme.textTheme.bodyMedium?.copyWith(
                              // color: context.theme.hintColor,
                              ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(22),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            alignLabelWithHint: true,
                            hintText: 'Fill your note',
                            hintStyle: context.theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.grey[500]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Final price',
                          style: Get.textTheme.titleLarge!.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '4,500,000đ',
                          style: Get.textTheme.titleLarge?.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Review your booking conditions',
                        style: Get.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Non-refundable',
                        style: Get.textTheme.bodyMedium!.copyWith(),
                      ),
                      Text(
                        'Cancellation is not allowed',
                        style: Get.textTheme.bodyMedium!.copyWith(),
                      ),
                    ],
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

class HotelSelected extends StatelessWidget {
  const HotelSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Royale President Hotel',
                style: Get.textTheme.titleMedium!.copyWith(),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.location_on,
                        size: 18,
                      ),
                    ),
                    const TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: '01 Phan Chu Trinh, Ward 9, TP.HCM, Vietnam',
                      style: Get.textTheme.bodySmall!.copyWith(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: ExtendedImage.network(
            'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
            fit: BoxFit.cover,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            shape: BoxShape.rectangle,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case LoadState.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case LoadState.completed:
                  return null;
                case LoadState.failed:
                  return Image.asset(
                    Assets.assset.images.noImage.path,
                    package: LocalVariable.packageName,
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
