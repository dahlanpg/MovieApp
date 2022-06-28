import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/repositories/movie_repository.dart';

import '../services/dio_service.dart';
import '../utils/api_utils.dart';

class MovieRepositoryImp implements MovieRepository {
  final DioService _dioService;

  MovieRepositoryImp(this._dioService);

  @override
  Future<Movie> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movie.fromJson(result.data);
  }
}
