import 'package:app_geek_plus/application/rest_client/rest_client.dart';
import 'package:app_geek_plus/models/movie_model.dart';
import 'package:app_geek_plus/models/movies_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final RestClient _restClient;

  MoviesRepositoryImpl({
      required RestClient restClient,
    } ) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key' : RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page' : '1'
      },
      decoder:(data){
        final results = data['results'];
        if(results != null){
          return results.map<MovieModel>((m) => MovieModel.fromMap(m)).toList();
        }else{
          return <MovieModel>[];
        }
      });

      if(result.hasError){
        throw Exception('Erro ao buscar filmes populares');
      }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key' : RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page' : '1'
      },
      decoder:(data){
        final results = data['results'];
        if(results != null){
          return results.map<MovieModel>((m) => MovieModel.fromMap(m)).toList();
        }else{
          return <MovieModel>[];
        }
      });

      if(result.hasError){
        throw Exception('Erro ao buscar Top filmes');
      }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MoviesDetailsModel?> getDetail(int id) async {
    final result = await _restClient.get<MoviesDetailsModel?>(
      '/movie/$id',
      query: {
        'api_key' : RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'append_to_response':'images,credits',
        'include_image_language':'en,pt-br'
      },
      decoder: (data){
        return MoviesDetailsModel.fromMap(data);
      }
      );
      if(result.hasError){
        throw Exception('Erro ao buscar detalhes do filme');
      }
    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      var favoriteCollection = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('movies');
      
        if(movie.favorite){
          favoriteCollection.add(movie.toMap());
        }else{
          var favoriteData = await favoriteCollection
              .where('id', isEqualTo: movie.id)
              .limit(1)
              .get();
          favoriteData.docs.first.reference.delete();
        }
    } catch (e) {
      print('Erro ao favoritar filme');
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritesMovies(String userId) async {
    var favoriteMovies = await FirebaseFirestore.instance.collection('favorites')
    .doc(userId)
    .collection('movies')
    .get(); 
    final listFavorites = <MovieModel>[];
    for(var movie in favoriteMovies.docs){
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }
    return listFavorites;
  }

}