import 'package:flutter/cupertino.dart';
import 'package:movieapp/repositories/movie_repository.dart';

import '../models/movie_model.dart';

class MovieController {
  final MovieRepository _movieRepository;

  MovieController(this._movieRepository) {
    fetch();
  }

  ValueNotifier<Movie?> movies = ValueNotifier<Movie?>(null);

  Movie? _cachedMovies;

  onChanged(String value) {
    List<Movies> list = _cachedMovies!.moviesList
        .where((e) => e.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
    movies.value =
        movies.value!.copyWith(results: list); // Prototype Design Patterns
  }

  fetch() async {
    movies.value = await _movieRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
