import 'package:app_geek_plus/models/movies_details_model.dart';
import 'package:flutter/material.dart';

class MovieDetailContentProductionCredits extends StatelessWidget {

    final MoviesDetailsModel? movie;


  const MovieDetailContentProductionCredits({ Key? key, required this.movie }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Container(
         padding: EdgeInsets.all(8),
         margin: EdgeInsets.only(bottom: 5),
         child: RichText(
           text: TextSpan(
             text: 'Companhia(s) produtora(s): ',
             style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF222222)),
             children: [
               TextSpan(
                 text: movie?.productionCompanies.join(', ') ?? '',
                 style: TextStyle(fontWeight: FontWeight.normal, color: Color(0xFF222222)),

               )
             ]
           ),
         ),
       );
  }
}