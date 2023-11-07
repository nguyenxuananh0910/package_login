import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/constrants/localVariable.dart';
import 'package:package_login/core/gen/assets.gen.dart';
import 'package:package_login/src/presentation/pages/add_hotel/add_hotel_controller.dart';

class AddHotelPage extends GetView<AddHotelController> {
  static const String routeName = '/AddHotelPage';
  const AddHotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Product',
          style: Get.textTheme.titleMedium!.copyWith(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedBorder(
                color: Colors.grey[400]!,
                strokeWidth: 2,
                borderType: BorderType.RRect,
                radius: const Radius.circular(22),
                child: Container(
                  height: 150,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: 80,
                        height: 80,
                        Assets.assset.icons.upload.path,
                        package: LocalVariable.packageName,
                      ),
                      const Text('UpLoad up to 5 images')
                    ],
                  ),
                ),
              ),
              const InputHotel(),
            ],
          ),
        ),
      ),
    );
  }
}

class InputHotel extends StatelessWidget {
  const InputHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Text(
            'Hotel Name *',
            style: Get.textTheme.titleSmall!.copyWith(color: Colors.grey),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22)),
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
                hintText: 'tên khách sạn',
                hintStyle: context.theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500]),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Text(
            'Description *',
            style: Get.textTheme.titleSmall!.copyWith(color: Colors.grey),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22)),
          child: TextFormField(
              maxLines: 4,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  // color: context.theme.hintColor,
                  ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                alignLabelWithHint: true,
                hintText: 'Giới thiệu về sản phẩm của bạn... ',
                hintStyle: context.theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500]),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Text(
            'Address *',
            style: Get.textTheme.titleSmall!.copyWith(color: Colors.grey),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22)),
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
                hintText: 'Địa chỉ',
                hintStyle: context.theme.textTheme.bodySmall
                    ?.copyWith(color: Colors.grey[500]),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Text(
            'Price *',
            style: Get.textTheme.titleSmall!.copyWith(color: Colors.grey),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22)),
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: context.theme.textTheme.bodyMedium?.copyWith(
                // color: context.theme.hintColor,
                ),
            decoration: InputDecoration(
              suffixText: 'VND',
              suffixStyle: context.theme.textTheme.bodySmall?.copyWith(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              alignLabelWithHint: true,
              hintText: 'price... vd: 4,600,000',
              hintStyle: context.theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey[500]),
            ),
          ),
        )
      ],
    );
  }
}
