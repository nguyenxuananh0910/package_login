import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<String> listitem = <String>[].obs;

  List<String> dsGoiy = ['All Hotel', 'Recommended', 'Popular', 'Trending'];
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    listitem.call(dsGoiy);
  }
}
