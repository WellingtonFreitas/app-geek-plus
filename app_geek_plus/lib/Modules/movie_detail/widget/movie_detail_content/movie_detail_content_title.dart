import 'package:app_geek_plus/models/movies_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:app_geek_plus/application/ui/theme_extensions.dart';


class MovieDetailContentTitle extends StatelessWidget {

  final MoviesDetailsModel? movie;
  const MovieDetailContentTitle({ Key? key, required this.movie }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Padding(
         padding: EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 20,),
             Text(
               movie?.title ?? '',
               style: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.w600,
               ),
             ),
             SizedBox(height: 10),
             RatingStars(
               value: (movie?.stars ?? 1) / 2,
               valueLabelVisibility: false,
               starColor: context.orangeColor,
               starSize: 14,
             ),
              SizedBox(height: 10),
              Text(
                movie?.genres.map((e) => e.name).join(', ') ?? '',
                style: TextStyle(
                  fontSize: 11,
                  color: context.greyColor
                ),
              )
           ],
         ),
       );
  }
}