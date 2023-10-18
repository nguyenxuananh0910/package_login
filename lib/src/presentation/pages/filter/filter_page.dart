import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/filter/filter_controller.dart';

class FilterPage extends GetView<FilterController> {
  const FilterPage({Key? key}) : super(key: key);
  static const String routeName = '/FilterPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => RangeSlider(
                activeColor: Colors.red,
                inactiveColor: Colors.grey[300],
                divisions: 100,
                labels: RangeLabels(
                    controller.minPrice.value.toStringAsFixed(2),
                    controller.maxPrice.value.toStringAsFixed(2)),
                values: RangeValues(
                    controller.minPrice.value, controller.maxPrice.value),
                min: 0.0,
                max: 1000.0,
                onChanged: (RangeValues values) {
                  controller.updatePriceRange(values.start, values.end);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red)),
                        child: Text(
                            ' \$${controller.minPrice.value.toStringAsFixed(0)}'),
                      )),
                  Obx(() => DecoratedBox(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red)),
                        child: Text(
                            ' \$${controller.maxPrice.value.toStringAsFixed(0)}'),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
