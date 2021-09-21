

import 'package:app_geek_plus/models/genre_model.dart';

abstract class GenresService {
  Future<List<GenreModel>> getGenres();
}