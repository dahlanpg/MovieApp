import 'package:flutter/material.dart';
import 'package:projeto02/controllers/movie_controller.dart';
import 'package:projeto02/repositories/movies_repository_imp.dart';
import 'package:projeto02/services/dio_service_imp.dart';
import 'package:lottie/lottie.dart';
import '../models/movies_model.dart';
import '../widget/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _movieController =
      MovieController(MoviesRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<Movie?>(
                  valueListenable: _movieController.movies,
                  builder: (_, movies, __) {
                    return Visibility(
                      child: Text('Movies',
                          style: Theme.of(context).textTheme.headline3),
                      visible: movies != null,
                    );
                  }),
              SizedBox(height: 40),
              TextField(
                style: TextStyle(color: Colors.white),
                onChanged: _movieController.onChanged,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Buscar Filme',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ValueListenableBuilder<Movie?>(
                valueListenable: _movieController.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.results.length,
                          separatorBuilder: (_, __) => Divider(),
                          itemBuilder: (_, idx) =>
                              CustomListCardWidget(movie: movies.results[idx]))
                      : Lottie.asset('assets/lottie_movie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
