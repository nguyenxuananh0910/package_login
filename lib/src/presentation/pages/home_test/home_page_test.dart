import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/constrants/localVariable.dart';
import 'package:package_login/core/gen/assets.gen.dart';
import 'package:package_login/src/presentation/pages/home_test/home_controller_test.dart';
import 'package:package_login/src/presentation/pages/hotel_detal/hotel_detail_page.dart';

class HomePageTest extends GetView<HomeTestController> {
  const HomePageTest({Key? key}) : super(key: key);
  static const String routeName = '/HomePageTest';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.withOpacity(0.1)),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      // controller: controller.soBienNhanController,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        isCollapsed: true,
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(
                          Icons.filter_list_outlined,
                          color: Colors.green,
                        ),
                        hintText: 'Search',
                        hintStyle: context.theme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.grey.withOpacity(0.6)),

                        // errorText: controller.noiDungError.value,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    height: 50,
                    child: Obx(() => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listitem.length,
                        itemBuilder: (context, index) {
                          var item = controller.listitem[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 2, color: Colors.green)),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Text(item),
                                ))),
                          );
                        })),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recommended  (484,579)',
                        style: Get.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.menu_outlined,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.add_box_outlined)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration:
                BoxDecoration(color: Colors.greenAccent.withOpacity(0.2)),
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Hero(
                      tag: UniqueKey(),
                      child: InkWell(
                        onTap: () => Get.toNamed(HotelDetailPage.routeName),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: ExtendedImage.network(
                                          'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
                                          fit: BoxFit.cover,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          shape: BoxShape.rectangle,
                                          loadStateChanged:
                                              (ExtendedImageState state) {
                                            switch (
                                                state.extendedImageLoadState) {
                                              case LoadState.loading:
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              case LoadState.completed:
                                                return null;
                                              case LoadState.failed:
                                                return Image.asset(
                                                  Assets.assset.images.noImage
                                                      .path,
                                                  package:
                                                      LocalVariable.packageName,
                                                );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Intercontinental Hotel',
                                          style: Get.textTheme.titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Lagos, Nigeria',
                                          style: Get.textTheme.titleMedium!
                                              .copyWith(),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 18,
                                                ),
                                                Text(
                                                  '5.0',
                                                  style:
                                                      Get.textTheme.titleSmall,
                                                )
                                              ],
                                            ),
                                            Text(
                                              ' (4,345 reviews)',
                                              style: Get.textTheme.bodyMedium,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "\$205",
                                      style: Get.textTheme.titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("/night",
                                        style: Get.textTheme.bodyLarge),
                                    const SizedBox(
                                      height: 5,
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
                }),
          ),
        )
      ]),
    );
  }
}
