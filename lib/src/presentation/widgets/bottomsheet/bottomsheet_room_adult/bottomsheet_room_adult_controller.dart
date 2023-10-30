import 'package:get/get.dart';
import 'package:package_login/core/utils/noti_config.dart';

class BottomSheetRoomAdultController extends GetxController {
  // var numberRoom = RxInt(0);
  final NoTiConfig tinTucConfig = Get.find();
  final RxInt numberRoom = 0.obs;
  final RxInt numberAdult = 0.obs;
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
}
