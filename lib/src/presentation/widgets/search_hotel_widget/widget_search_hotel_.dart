import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/utils/extension.dart';
import 'package:package_login/src/domain/models/model_search.dart';
import 'package:package_login/src/presentation/widgets/bottomsheet/bottomsheet_location/bottomsheet_location_page.dart';
import 'package:package_login/src/presentation/widgets/bottomsheet/bottomsheet_room_adult/bottomsheet_room_adult_page.dart';
import 'package:package_login/src/presentation/widgets/dia_log/dialog_date/dialog_date_page.dart';
import 'package:package_login/src/presentation/widgets/search_hotel_widget/widget_search_hotel_controller.dart';

class WidgetSearchHotelPage extends StatelessWidget {
  final String title;
  final void Function(SearchModel data) onChange;
  const WidgetSearchHotelPage({
    Key? key,
    required this.title,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WidgetSearchHotelController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: Get.textTheme.titleMedium?.copyWith(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.location_on_outlined),
                    TextButton(
                      onPressed: () async {
                        final data = await Get.bottomSheet<String>(
                          BottomSheetLocation(
                              location:
                                  controller.selectedLocation.value ?? ''),
                        );
                        if (data != null) {
                          controller.selectLocation(data);
                        }
                      },
                      // Get.bottomSheet(const BottomSheetLocation()),
                      child: Obx(
                        () => Text(
                          controller.selectedLocation.value ??
                              'Choose your location',
                          style: Get.textTheme.bodySmall?.copyWith(
                              color: controller.selectedLocation.value != null
                                  ? null
                                  : Colors.grey[400]),
                        ),
                      ),
                    ),
                    const Text(''),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[400],
                height: 2,
                endIndent: 10,
                indent: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  // onTap: () => Get.dialog(const DiaLogDatePage()),
                  onTap: () async {
                    final data = await Get.dialog<DateTimeRange>(
                      DiaLogDatePage(dateTimeRange: controller.dateRange.value),
                    );
                    if (data != null) {
                      final newDateRange = DateTimeRange(
                        start: data.start,
                        end: data.end,
                      );
                      controller.updateDateRange(newDateRange);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.calendar_month_outlined),
                      Obx(
                        () => Text(
                          controller.dateRange.value.start.formatDateToString(),
                          style: Get.textTheme.bodySmall?.copyWith(),
                        ),
                      ),
                      Text(
                        '-',
                        style: Get.textTheme.bodyLarge?.copyWith(),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            controller.dateRange.value.end.formatDateToString(),
                            style: Get.textTheme.bodySmall?.copyWith(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[400],
                height: 2,
                endIndent: 10,
                indent: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    final data = await Get.bottomSheet<List<int>>(
                      BottomSheetRoomAdultPage(
                          adultNumber: controller.numberAdult.value,
                          roomNumber: controller.numberRoom.value),
                    );
                    if (data != null) {
                      controller.updateRoomAndAdult(data.first, data.last);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.meeting_room_outlined),
                      Obx(
                        () => Text(
                          controller.numberRoom.value == 0
                              ? 'Room'
                              : ('${controller.numberRoom.toString()} Phòng'),
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: controller.numberRoom.value != 0
                                ? null
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                      const Icon(Icons.people_outlined),
                      Padding(
                        padding: const EdgeInsets.only(right: 48.0),
                        child: Obx(
                          () => Text(
                            controller.numberAdult.value == 0
                                ? 'Adult'
                                : ('${controller.numberAdult.toString()} Nguời Lớn'),
                            style: Get.textTheme.bodySmall!.copyWith(
                              color: controller.numberAdult.value != 0
                                  ? null
                                  : Colors.grey[400],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[400],
                height: 2,
                endIndent: 10,
                indent: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: InkWell(
                  onTap: () {
                    final searchModel = SearchModel(
                      todDay: controller.dateRange.value.end,
                      numberRoom: controller.numberRoom.value,
                      numberAdult: controller.numberAdult.value,
                      location: controller.selectedLocation.value,
                      fromDay: controller.dateRange.value.start,
                    );

                    onChange.call(searchModel);
                  },
                  child: SizedBox(
                    width: Get.width,
                    height: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'Search',
                          style: Get.textTheme.titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      init: WidgetSearchHotelController(),
    );
  }
}
