
import 'package:app_geek_plus/Modules/movie_detail/movie_detail_bindings.dart';
import 'package:app_geek_plus/Modules/movie_detail/movie_detail_page.dart';
import 'package:app_geek_plus/application/Modules/module.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MovieDetailModule extends Module{
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/movie/detail', 
      page: ()=> MovieDetailPage(),
      binding: MovieDetailBindings()
      )
  ];
  
}