import 'package:app_geek_plus/Modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBindings implements Bindings{
  @override 
  void dependencies(){
    Get.put(SplashController());
  }
}