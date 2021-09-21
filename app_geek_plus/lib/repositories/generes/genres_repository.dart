import 'package:app_geek_plus/models/genre_model.dart';

abstract class GenresRepository {

  Future<List<GenreModel>> getGenres();
}