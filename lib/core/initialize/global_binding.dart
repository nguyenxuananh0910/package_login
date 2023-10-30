import 'package:get/get.dart';
import 'package:package_login/core/utils/noti_config.dart';
import 'package:package_login/core/utils/notication_config_implement.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoTiConfig>(() => NoTiConfigImplement(), fenix: true);
    // TODO: implement dependencies
  }
}
