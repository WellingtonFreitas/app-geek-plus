import 'package:app_geek_plus/Modules/login/login_controller.dart';
import 'package:app_geek_plus/application/layout/app_gradients.dart';
import 'package:app_geek_plus/application/layout/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  Image.asset(AppImages.logo),
                  SizedBox(height:50),
                  SizedBox(
                    width: Get.size.width * .9,
                    height: 42,
                    child: SignInButton(
                      Buttons.Google, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      onPressed: () => controller.login(),
                      text: 'Entrar com o Google',
                      ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
