import '../models/movie_model.dart';

abstract class MovieRepository {
  Future<Movie> getMovies();
}
