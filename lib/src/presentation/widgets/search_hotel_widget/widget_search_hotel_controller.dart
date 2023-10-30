import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/core/utils/noti_config.dart';
import 'package:package_login/src/domain/models/model_search.dart';

class WidgetSearchHotelController extends GetxController {
  final Rxn<SearchModel> search = Rxn<SearchModel>();
  Rx<DateTimeRange> dateRange = DateTimeRange(
    end: DateTime.now().add(const Duration(days: 2)),
    start: DateTime.now(),
  ).obs;
  final NoTiConfig tinTucConfig = Get.find();
  final RxInt numberRoom = 0.obs;
  final RxInt numberAdult = 0.obs;
  List<String> dsTp = ['Hồ Chi Minh', 'Đà Lạt', 'Đà Nẵng', 'Hà Nội'];
  final RxList<String> listitem = <String>[].obs;
  final Rxn<String> selectedLocation = Rxn();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> onUpdateSearch(SearchModel data) async {
    search.call(data);
  }

  void updateDateRange(DateTimeRange newDateRange) {
    dateRange.value = newDateRange;
  } // var numberRoom = RxInt(0);

  void incrementRoom() {
    numberRoom.value++; // Tăng giá trị
  }

  void decrementRoom() {
    if (numberRoom.value > 0) {
      numberRoom.value--;
    } // Giảm giá trị
  }

  void incrementAdult() {
    numberAdult.value++; // Tăng giá trị
  }

  void decrementAdult() {
    if (numberAdult.value > 0) {
      numberAdult.value--;
    } // Giảm giá trị
  }

  Future<void> fetchData() async {
    listitem.call(dsTp);
  }

  void selectLocation(String? value) {
    if (selectedLocation.value != value) {
      selectedLocation.call(value);
      // location = value;
      // Get.back(result: selectedLocation.value);
      return;
    }
  }

  void updateRoomAndAdult(int room, int adult) {
    numberRoom.value = room;
    numberAdult.value = adult;
  }
}
