import 'package:app_geek_plus/Modules/home/home_module.dart';
import 'package:app_geek_plus/Modules/login/login_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Modules/movie_detail/movie_detail_module.dart';
import 'Modules/splash/splash_module.dart';
import 'application/bindings/application_bindings.dart';
import 'application/ui/geek_plus_app_ui_config.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  var theme = GeekPlusAppUiConfig.lightTheme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    changeTheme();
  }

  changeTheme() {
    var brightness = WidgetsBinding.instance!.window.platformBrightness;
    brightness == Brightness.dark
        ? theme = GeekPlusAppUiConfig.darkTheme
        : theme = GeekPlusAppUiConfig.lightTheme;

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: GeekPlusAppUiConfig.title,
      initialBinding: ApplicationBindings(),
      theme: theme,
      getPages: [
          ...SplashModule().routers,
          ...LoginModule().routers,
          ...HomeModule().routers,
          ...MovieDetailModule().routers,
        ],
    );
  }
}
