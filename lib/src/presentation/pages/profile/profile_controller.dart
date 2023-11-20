import 'package:get/get.dart';
import 'package:package_login/src/presentation/pages/login/login_page.dart';
import 'package:package_login/src/presentation/widgets/dia_log/dialog_sign_out.dart';

class ProfileController extends GetxController {
  Future<void> logOut() async {
    Get.dialog(
      DiaLogSignOut(
        onTap: () => Get.offAllNamed(LoginView.routeName),
      ),
    );
  }
}
