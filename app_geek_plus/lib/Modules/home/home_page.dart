import 'package:app_geek_plus/Modules/favorites/favorites_binding.dart';
import 'package:app_geek_plus/Modules/favorites/favorites_page.dart';
import 'package:app_geek_plus/Modules/home/home_controller.dart';
import 'package:app_geek_plus/Modules/movies/movies_bindings.dart';
import 'package:app_geek_plus/Modules/movies/movies_page.dart';
import 'package:app_geek_plus/application/layout/geek_plus_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:app_geek_plus/application/ui/theme_extensions.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.secondColor,
          unselectedItemColor: context.greyColor,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(GeekPlusIcons.heart_empty), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: 'Sair')
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
              settings: settings, 
              page: () => MoviesPage(),
              binding: MoviesBindings()
              );
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
                settings: settings, 
                page: () => FavoritesPage(),
                binding: FavoritesBindings()
                );
          }
          return null;
        },
      ),
    );
  }
}
