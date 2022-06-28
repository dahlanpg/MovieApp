import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/controllers/movie_controller.dart';
import 'package:movieapp/repositories/movie_repository_imp.dart';
import 'package:movieapp/services/dio_service_imp.dart';
import 'package:movieapp/services/prefs_service.dart';

import '../models/movie_model.dart';
import '../widget/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _movieController =
      MovieController(MovieRepositoryImp(DioServiceImp()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder(
                    valueListenable: _movieController.movies,
                    builder: (_, movies, __) {
                      return Visibility(
                        child: Column(
                          children: [
                            Text('Movies',
                                style: Theme.of(context).textTheme.headline3),
                          ],
                        ),
                        visible: movies != null,
                      );
                    },
                  ),
                  ValueListenableBuilder(
                      valueListenable: _movieController.movies,
                      builder: (_, movies, __) {
                        return Visibility(
                          visible: movies != null,
                          child: IconButton(
                            onPressed: () {
                              PrefsService.logout();
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            },
                            icon: Icon(Icons.logout),
                          ),
                        );
                      })
                ],
              ),
              SizedBox(height: 30),
              ValueListenableBuilder(
                  valueListenable: _movieController.movies,
                  builder: (_, movies, __) {
                    return Visibility(
                      visible: movies != null,
                      child: TextField(
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
                    );
                  }),
              SizedBox(height: 40),
              ValueListenableBuilder<Movie?>(
                valueListenable: _movieController.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.moviesList.length,
                          separatorBuilder: (_, __) => Divider(),
                          itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.moviesList[idx]))
                      : Lottie.asset('assets/lottie_data.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
