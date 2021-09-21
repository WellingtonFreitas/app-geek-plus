import 'package:app_geek_plus/models/movie_model.dart';
import 'package:app_geek_plus/models/movies_details_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRated();
  Future<MoviesDetailsModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoritesMovies(String userId);

}