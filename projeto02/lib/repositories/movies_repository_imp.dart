import 'package:projeto02/models/movies_model.dart';
import 'package:projeto02/repositories/movies_repository.dart';
import 'package:projeto02/services/dio_service.dart';

import '../utils/api_utils.dart';

class MoviesRepositoryImp implements MovieRepository {
  final DioService _dioService;
  MoviesRepositoryImp(this._dioService); // injeção de dependência

  @override
  Future<Movie> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movie.fromJson(result.data);
  }
}
