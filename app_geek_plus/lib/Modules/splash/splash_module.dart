import 'package:app_geek_plus/Modules/splash/splash_bindings.dart';
import 'package:app_geek_plus/Modules/splash/splash_page.dart';
import 'package:app_geek_plus/application/Modules/module.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module{
  @override
  List<GetPage> routers= [
    GetPage(
      name: '/',
      page: () => SplashPage(),
      binding: SplashBindings()
      ),
  ];
}