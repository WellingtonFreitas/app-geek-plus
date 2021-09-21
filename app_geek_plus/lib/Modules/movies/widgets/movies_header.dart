import 'package:app_geek_plus/Modules/movies/movies_controller.dart';
import 'package:app_geek_plus/application/layout/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesHeader extends GetView<MoviesController> {

  const MoviesHeader({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return SizedBox(
        width: Get.width, 
        height: 196,
        child: Stack(
          alignment:Alignment.center,
          children: [
            SizedBox(
              width: Get.width,
              child: Image.asset(
                AppImages.banner, 
                fit: BoxFit.cover,
                ),
            ),
            Container(
              width: Get.width *.9,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20),
              child: TextField(
                onChanged: (value) => controller.filterByName(value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Procurar filme',
                  labelStyle: TextStyle(fontSize: 15, color: Colors.grey),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.zero,
                  floatingLabelBehavior: FloatingLabelBehavior.never
                ),
              ),
            )
          ],
        ),
       );
  }
}