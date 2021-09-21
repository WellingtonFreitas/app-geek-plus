import 'package:app_geek_plus/application/layout/loader/loader_mixin.dart';
import 'package:app_geek_plus/application/ui/messages/messages_mixin.dart';
import 'package:app_geek_plus/models/movies_details_model.dart';
import 'package:app_geek_plus/services/movies/movies_service.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController with LoaderMixin,MessagesMixin {
  final MoviesService _moviesService;
  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MoviesDetailsModel>();

  MovieDetailController({
    required MoviesService moviesService
  }) : _moviesService = moviesService;

@override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }
@override
  Future<void> onReady() async {
    super.onReady();
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await  _moviesService.getDetail(movieId);
      movie.value = movieDetailData;
      loading(false);
    }catch(e,s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(title: 'Error', message: 'Erro ao buscar detalhes do filme'));
    }
  }
}