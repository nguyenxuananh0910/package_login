import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_login/core/constrants/localVariable.dart';
import 'package:package_login/core/gen/assets.gen.dart';
import 'package:package_login/src/presentation/pages/hotel_detal/hotel_detail_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HotelDetailPage extends GetView<HotelDetailController> {
  const HotelDetailPage({Key? key}) : super(key: key);
  static const String routeName = '/HotelDetailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      body: Hero(
        tag: UniqueKey(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SafeArea(
                    child: Obx(() => CarouselSlider.builder(
                          itemCount: controller.listImage.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              SizedBox(
                            width: Get.width,
                            child: ExtendedImage.network(
                              controller.listImage[itemIndex],
                              fit: BoxFit.cover,
                              // borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                          options: CarouselOptions(
                              viewportFraction: 1,
                              // pageSnapping: false,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) =>
                                  controller.activeIndex.value = index),
                        )),
                  ),
                  Positioned(
                    top: 60,
                    left: 10,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 10,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.bookmark_outline_outlined,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 150,
                      child: Obx(
                        () => AnimatedSmoothIndicator(
                          activeIndex: controller.activeIndex.value,
                          count: controller.listImage.length,
                          effect: const ExpandingDotsEffect(
                              dotColor: Colors.white,
                              activeDotColor: Colors.deepOrangeAccent,
                              dotHeight: 10,
                              dotWidth: 10),
                        ),
                      )),
                ],
              ),
              const AddressView(),
              SizedBox(
                  height: 120,
                  child: Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listImage.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 6),
                            child: ExtendedImage.network(
                              controller.listImage[index],
                              width: 120,
                              fit: BoxFit.cover,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
                          );
                        }),
                  )),
              const Description(),
              const Review(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GetFooter(),
    );
  }
}

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Royale President Hotel',
              style: Get.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.red,
                ),
                Text(
                  'istanbul,Turkiya,20050',
                  style: Get.textTheme.titleSmall!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 6),
            child: Divider(
              indent: 6,
              height: 2,
              endIndent: 6,
              thickness: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Detail',
              style: Get.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  // var item = controller.listitem[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.hotel_class,
                                color: Colors.deepOrangeAccent,
                              ),
                              Text(
                                'item item',
                                style: Get.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        )),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gallery Photos',
                  style: Get.textTheme.titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: Get.textTheme.bodyMedium!
                        .copyWith(color: Colors.deepOrangeAccent),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Description extends GetView<HotelDetailController> {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Detail',
            style: Get.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: controller.isExpanded.value
                            ? controller.fullText
                            : (controller.fullText.length > 200
                                ? '${controller.fullText.substring(0, 200)}...'
                                : controller.fullText),
                        style: Get.theme.textTheme.bodyMedium?.copyWith(
                          color: Get.theme.colorScheme.onSurface,
                        ),
                      ),
                      if (controller.fullText.length > 200)
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.toggleExpanded,
                          text: controller.isExpanded.value
                              ? ' Read Less'
                              : ' Read More',
                          style: Get.theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Facilites',
            style: Get.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 220,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 8),
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.hotel_class,
                          color: Colors.deepOrangeAccent,
                        ),
                        Text(
                          'item item',
                          style: Get.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Review',
                    style: Get.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
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
                            '4.9',
                            style: Get.textTheme.titleSmall,
                          )
                        ],
                      ),
                      Text(
                        ' (4,345 reviews)',
                        style: Get.textTheme.bodySmall,
                      )
                    ],
                  )
                ],
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'See All',
                  style: Get.textTheme.bodyMedium!
                      .copyWith(color: Colors.deepOrangeAccent),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              itemCount: 5,
              // controller.data.length > 5 ? 5 : controller.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                  child: InkWell(
                    onTap: () => Get.toNamed(HotelDetailPage.routeName),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: ExtendedImage.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvNVVeso-U6DZ5v4Py3n5hYAttB7PVgb_6rA&usqp=CAU',
                                      fit: BoxFit.cover,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      shape: BoxShape.rectangle,
                                      loadStateChanged:
                                          (ExtendedImageState state) {
                                        switch (state.extendedImageLoadState) {
                                          case LoadState.loading:
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          case LoadState.completed:
                                            return null;
                                          case LoadState.failed:
                                            return Image.asset(
                                              Assets.assset.images.noImage.path,
                                              package:
                                                  LocalVariable.packageName,
                                            );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jenny Wilson',
                                      style: Get.textTheme.titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      DateFormat('dd/MM/yyyy')
                                          .format(DateTime.now())
                                          .toString(),
                                      style:
                                          Get.textTheme.titleSmall!.copyWith(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    maxLines: 3,
                                    'Nestled in the heart of a vibrant city, our hotel is an oasis of luxury and comfort. With its impeccable service, stylish décor, and world-class amenities, it stands out as a top choice for discerning travelers.',
                                    style: Get.textTheme.bodyMedium,
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6.0),
                                          child: Text(
                                            '5',
                                            style: Get.textTheme.bodyLarge!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}

class GetFooter extends StatelessWidget {
  const GetFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          color: Colors.white30),
      width: Get.width,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Select Room',
                  style: Get.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  '\$ 30',
                  style: Get.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text('/ per night ', style: Get.textTheme.bodySmall!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
