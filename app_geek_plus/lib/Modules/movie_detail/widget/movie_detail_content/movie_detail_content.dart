import 'package:app_geek_plus/Modules/movie_detail/widget/movie_detail_content/movie_detail_content_credits.dart';
import 'package:app_geek_plus/Modules/movie_detail/widget/movie_detail_content/movie_detail_content_main_cast.dart';
import 'package:app_geek_plus/Modules/movie_detail/widget/movie_detail_content/movie_detail_content_title.dart';
import 'package:app_geek_plus/models/movies_details_model.dart';
import 'package:flutter/material.dart';

import 'movie_detail_content_production_credits.dart';

class MovieDetailContent extends StatelessWidget {
     
   final MoviesDetailsModel? movie;

  const MovieDetailContent({ Key? key, required this.movie}) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             MovieDetailContentTitle(movie: movie),
             MovieDetailContentCredits(movie: movie),
             MovieDetailContentProductionCredits(movie : movie),
             MovieDetailContentMainCast(movie: movie)
           ],
         ),
       );
  }
}