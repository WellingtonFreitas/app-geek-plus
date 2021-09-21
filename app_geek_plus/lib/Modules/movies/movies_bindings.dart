import 'package:app_geek_plus/Modules/movies/movies_controller.dart';
import 'package:app_geek_plus/repositories/generes/genres_repository.dart';
import 'package:app_geek_plus/repositories/generes/genres_repository_impl.dart';
import 'package:app_geek_plus/services/genres/genres_service.dart';
import 'package:app_geek_plus/services/genres/genres_service_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesController(genresService: Get.find(), moviesService: Get.find(), authService: Get.find()));
    Get.lazyPut<GenresRepository>(() => GenresRepositoryImpl(restClient: Get.find()));
    Get.lazyPut<GenresService>(() => GenresServiceImpl(genresRepository: Get.find()));
  }
}