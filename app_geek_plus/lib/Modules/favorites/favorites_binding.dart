import 'package:app_geek_plus/Modules/favorites/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoritesController(authService: Get.find(), movieService: Get.find()));
  }
}