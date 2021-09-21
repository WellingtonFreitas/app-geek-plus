
import 'dart:convert';

import 'package:app_geek_plus/models/cast_model.dart';

import 'genre_model.dart';

class MoviesDetailsModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;
  MoviesDetailsModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'stars': stars,
      'gentes': genres.map((x) => x.toMap()).toList(),
      'urlImages': urlImages,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'productionCompanies': productionCompanies,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MoviesDetailsModel.fromMap(Map<String, dynamic> map) {
    //Faz o mesmo que o productionCompanies, porém aqui é um jeito mais simples de se entender
    var urlImagesPosters = map['images']['posters'];
    var urlImages = urlImagesPosters?.map<String>((i) =>  'https://image.tmdb.org/t/p/w200${i['file_path']}').toList() ?? [];

    return MoviesDetailsModel(
      title: map['title'],
      stars: map['vote_average'],
      genres: List<GenreModel>.from(map['genres']?.map((x) => GenreModel.fromMap(x))),
      urlImages: urlImages,
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'],
      productionCompanies: List<dynamic>.from(map['production_companies'] ?? const []).map<String>((p) => p['name']).toList(),
      originalLanguage: map['original_language'],
      cast: List<CastModel>.from(map['credits']['cast']?.map((x) => CastModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesDetailsModel.fromJson(String source) => MoviesDetailsModel.fromMap(json.decode(source));
}
