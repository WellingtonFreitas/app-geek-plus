import 'package:app_geek_plus/application/auth/auth_service.dart';
import 'package:app_geek_plus/models/movie_model.dart';
import 'package:app_geek_plus/services/movies/movies_service.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController { 
  final MoviesService _moviesService;
  final AuthService _authService;

  var movies = <MovieModel>[].obs;

  FavoritesController({
    required MoviesService movieService,
    required AuthService authService
  }) : _authService = authService, _moviesService = movieService;

  @override
  void onReady() {
    super.onReady();
   _getFavorites();
  }

  Future<void> _getFavorites() async {
    var user = _authService.user;
    if(user != null){
      var favorites = await _moviesService.getFavoritesMovies(user.uid);
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorite(MovieModel movie) async {
    var user = _authService.user;
    if(user != null){
      await _moviesService.addOrRemoveFavorite(user.uid, movie.copyWith(favorite: false));
      movies.remove(movie);
    }
  }
}