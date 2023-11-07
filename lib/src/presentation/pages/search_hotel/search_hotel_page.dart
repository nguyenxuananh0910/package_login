import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/constrants/localVariable.dart';
import 'package:package_login/core/gen/assets.gen.dart';
import 'package:package_login/core/utils/extension.dart';
import 'package:package_login/src/domain/models/model_search.dart';
import 'package:package_login/src/presentation/pages/hotel_detal/hotel_detail_page.dart';
import 'package:package_login/src/presentation/pages/search_hotel/search_hotel_controller.dart';
import 'package:package_login/src/presentation/widgets/bottomsheet/filter/filter_page.dart';
import 'package:package_login/src/presentation/widgets/search_hotel_widget/widget_search_hotel_.dart';

class SearchHotelPage extends GetView<SearchHotelController> {
  static const String routeName = '/SearchHotelPage';

  const SearchHotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // body: Center(
      //   child: Lottie.asset(Assets.assset.animations.loading,
      //       package: LocalVariable.packageName, height: 150, width: 150),
      // ),
      appBar: const Appbar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  // controller: controller.soBienNhanController,
                  style: context.theme.textTheme.titleMedium?.copyWith(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    isCollapsed: true,
                    alignLabelWithHint: true,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: context.theme.textTheme.bodyLarge
                        ?.copyWith(color: Colors.grey.withOpacity(0.6)),

                    // errorText: controller.noiDungError.value,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ListHotel(),
              )
            ],
          ),
        ),
      ),
      bottomSheet: const BottomSheetFilter(),
    );
  }
}

class Appbar extends GetView<SearchHotelController>
    implements PreferredSizeWidget {
  const Appbar({
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Expanded(
                          child: Text(
                            controller.location.value == ""
                                ? 'Choose your location'
                                : controller.location.value ??
                                    'Choose your location',
                            style: Get.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: controller.location.value == ""
                                    ? Colors.white.withOpacity(0.4)
                                    : Colors.white),
                          ),
                        ),
                      ),
                      Obx(
                        () => Expanded(
                          child: Row(
                            children: [
                              Text(
                                controller.dateRange.value!.start
                                    .formatDateToString(),
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " - ",
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                controller.dateRange.value!.end
                                    .formatDateToString(),
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => Expanded(
                          child: Row(
                            children: [
                              Text(
                                '${controller.numberRoom.value} room(s),',
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${controller.numberAdult.value} adlut(s)',
                                style: Get.textTheme.bodySmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final data = await Get.dialog<SearchModel>(
                      const FilterOverlay(),
                    );
                    if (data != null) {
                      controller.dateRange.value = DateTimeRange(
                          start: data.fromDay!, end: data.todDay!);
                      controller.numberAdult.value = data.numberAdult ?? -1;
                      controller.numberRoom.value = data.numberRoom ?? -1;
                      controller.location.value = data.location ?? '';
                    }
                  },
                  child: Text(
                    'CHANGE',
                    style: Get.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}

class FilterOverlay extends StatelessWidget {
  const FilterOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  child: WidgetSearchHotelPage(
                    title: 'Modify',
                    onChange: (SearchModel data) {
                      final result = data;
                      Get.back(result: result);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListHotel extends StatelessWidget {
  const ListHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 0, bottom: 42),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Hero(
            tag: UniqueKey(),
            child: InkWell(
              onTap: () => Get.toNamed(HotelDetailPage.routeName),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: ExtendedImage.network(
                                'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
                                fit: BoxFit.cover,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
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
                            const SizedBox(
                              width: 18,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Intercontinental Hotel',
                                    style: Get.textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 16,
                                      ),
                                      Text(
                                        'Hồ Chí Minh',
                                        style:
                                            Get.textTheme.bodySmall!.copyWith(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: '200.600.000đ',
                                      style: Get.textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    TextSpan(
                                      text: '\n/per night',
                                      style: Get.textTheme.bodySmall!
                                          .copyWith(color: Colors.grey[500]),
                                    ),
                                  ]))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.redAccent,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5.0',
                                style: Get.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '(1000000 View)',
                            style: Get.textTheme.bodySmall,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Icon(
                            Icons.bookmark_outline_outlined,
                            size: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BottomSheetFilter extends StatelessWidget {
  const BottomSheetFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(''),
            InkWell(
              onTap: () => Get.bottomSheet(SizedBox(
                height: 500,
                width: Get.width,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: FilterPage(),
                ),
              )),
              child: Row(
                children: [
                  const Icon(
                    Icons.filter_alt,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Filter',
                    style: Get.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              width: 2,
              indent: 8,
              endIndent: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.sort,
                  color: Colors.redAccent,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Sort',
                  style: Get.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Text(''),
          ],
        ),
      ),
    );
  }
}
