
import 'package:app_geek_plus/Modules/login/login_bindings.dart';
import 'package:app_geek_plus/application/Modules/module.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class LoginModule implements Module{
  @override 
  List<GetPage> routers = [
    GetPage(
      name: '/login', 
      page: ()=> LoginPage(),
      binding: LoginBindings(),
    )
  ];
}