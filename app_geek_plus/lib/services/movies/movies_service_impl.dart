import 'package:app_geek_plus/models/movie_model.dart';
import 'package:app_geek_plus/models/movies_details_model.dart';
import 'package:app_geek_plus/repositories/movies/movies_repository.dart';

import './movies_service.dart';

class MoviesServiceImpl implements MoviesService {

  final MoviesRepository _moviesRepository;

  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() => _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();

  @override
  Future<MoviesDetailsModel?> getDetail(int id) => _moviesRepository.getDetail(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) => _moviesRepository.addOrRemoveFavorite(userId, movie);

  @override
  Future<List<MovieModel>> getFavoritesMovies(String userId) => _moviesRepository.getFavoritesMovies(userId);


}