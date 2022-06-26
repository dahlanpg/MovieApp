import '../models/movies_model.dart';

abstract class MovieRepository {
  // SOLID: {Segregação de Interface - Princípio da Responsabilidade}
  Future<Movie> getMovies();
}
