import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';

import '../pages/details_page.dart';
import '../utils/api_utils.dart';

class CustomListCardWidget extends StatelessWidget {
  final Movies movie;
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsPage(movie: movie),
                fullscreenDialog: true,
              ));
        },
        child: Container(
            height: 210,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: movie.id,
                    child: Image.network(
                      API.REQUEST_IMG(movie.posterPath),
                      loadingBuilder: (_, child, progess) {
                        if (progess == null) return child;
                        return CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.grey.shade200,
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headline6,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        Spacer(),
                        Text('Popularidade: ' + movie.popularity.toString()),
                        SizedBox(height: 10),
                        Text('Votos: ' + movie.voteAverage.toString()),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
