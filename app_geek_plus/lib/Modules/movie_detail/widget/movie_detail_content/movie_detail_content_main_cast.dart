import 'package:app_geek_plus/models/movies_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_geek_plus/application/ui/theme_extensions.dart';

import 'movie_cast.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MoviesDetailsModel? movie;

  final showPanel = false.obs;

  MovieDetailContentMainCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.greyColor,
        ),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              showPanel.toggle();
            },
            children: [
              ExpansionPanel(
                  canTapOnHeader: false,
                  backgroundColor: Colors.white,
                  isExpanded: showPanel.value,
                  headerBuilder: (context, isExpanded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Elenco',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                  body: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          movie?.cast.map((c) => MovieCast(cast: c)).toList() ??
                              [],
                    ),
                  ))
            ],
          );
        })
      ],
    );
  }
}
