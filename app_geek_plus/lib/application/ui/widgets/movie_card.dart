import 'package:app_geek_plus/application/layout/geek_plus_icons_icons.dart';
import 'package:app_geek_plus/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {

  final dateFormat = DateFormat('y');
  final MovieModel movie;
  final VoidCallback favoriteCallback;

  MovieCard({
     Key? key,
     required this.movie,
     required this.favoriteCallback
      }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return InkWell(
         onTap: (){
           Get.toNamed('/movie/detail', arguments: movie.id);
         },
         child: Container(
          //  padding: EdgeInsets.all(8),
           width: 158,
           height: 280,
           child: Stack(
             children: [
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Material(
                       elevation: 2,
                       borderRadius: BorderRadius.circular(20),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                         clipBehavior: Clip.antiAlias,
                         child: Image.network(
                           'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                           width: 148,
                           height: 184,
                           fit: BoxFit.cover,
                         )
                         ),
                     ),
                       SizedBox(height: 20,),
                       Text(
                         movie.title,
                         style: TextStyle(
                           fontSize: 12,
                           fontWeight: FontWeight.w600
                         ),
                         overflow: TextOverflow.ellipsis,
                         maxLines: 2,
                         ),
                       Text(
                         dateFormat.format(DateTime.parse(movie.releaseDate)),
                         style: TextStyle(
                           fontSize: 11,
                           fontWeight: FontWeight.w300,
                           color: Colors.grey
                         ),
                         ),
                   ],
                 ),
               ),
               Positioned(
                 bottom: 90,
                 right: -10,
                 child: Material(
                   elevation: 5,
                   shape: CircleBorder(),
                   clipBehavior: Clip.antiAlias,
                   child: SizedBox(
                     height: 30,
                     child: IconButton(
                       iconSize: 13,
                       onPressed: favoriteCallback,
                       icon: Icon(
                         movie.favorite ? GeekPlusIcons.heart : GeekPlusIcons.heart_empty,
                         color: movie.favorite ? Colors.red: Colors.grey,
                         ),
                     ),
                     ),
                 ),
               )
             ],
           ),
         ),
       );
  }
}