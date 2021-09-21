import 'package:app_geek_plus/Modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
@override
void dependencies() {
    Get.lazyPut(() => LoginController(loginService: Get.find()));
  }
}