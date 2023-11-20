import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/booking/booking_controller.dart';
import 'package:timeline_tile/timeline_tile.dart';

class BookingPage extends GetView<BookingController> {
  static const String routeName = '/BookingPage';
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarBooking(),
      body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: controller.pages),
      bottomNavigationBar: Container(
        height: 80,
        width: Get.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('Total Price', style: Get.textTheme.bodySmall),
                  Text('4,600,000đ', style: Get.textTheme.bodySmall),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    controller.nextToStepAndPage();
                    // controller.nextToStep();
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Obx(
                          () => Text(
                            (controller.currentStepAndPage ==
                                    controller.pages.length - 1)
                                ? 'Confirm Booking'
                                : 'Next Step',
                            style: Get.textTheme.bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppbarBooking extends GetView<BookingController>
    implements PreferredSizeWidget {
  const AppbarBooking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(14),
          ),
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Obx(
                          () {
                            if (controller.currentStepAndPage ==
                                controller.pages.length - 1) {
                              return Text(
                                'Finish booking',
                                style: Get.textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                ),
                              );
                            }
                            return Text(
                              (controller.currentStepAndPage ==
                                      controller.pages.length - 2)
                                  ? 'Booking overview'
                                  : 'Fill in your details',
                              style: Get.textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.pages.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => TimelineTile(
                                axis: TimelineAxis.horizontal,
                                isFirst: index == 0,
                                isLast: index == controller.pages.length - 1,
                                beforeLineStyle: LineStyle(
                                    color:
                                        controller.currentStepAndPage >= index
                                            ? Colors.white
                                            : Colors.grey[300]!),
                                indicatorStyle: IndicatorStyle(
                                    width: 20,
                                    color:
                                        controller.currentStepAndPage >= index
                                            ? Colors.white
                                            : Colors.grey[300]!,
                                    iconStyle: IconStyle(
                                        iconData:
                                            controller.currentStepAndPage >=
                                                    index
                                                ? Icons.done
                                                : Icons.circle,
                                        fontSize: 14,
                                        color: controller.currentStepAndPage ==
                                                index
                                            ? Colors.redAccent
                                            : Colors.redAccent)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sing in',
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(110);
}
