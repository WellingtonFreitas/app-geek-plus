
import 'package:app_geek_plus/Modules/home/home_bindings.dart';
import 'package:app_geek_plus/Modules/home/home_page.dart';
import 'package:app_geek_plus/application/Modules/module.dart';
import 'package:get/get.dart';

class HomeModule extends Module{
  @override
  List<GetPage> routers =[
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBindings()
    )
  ];
}