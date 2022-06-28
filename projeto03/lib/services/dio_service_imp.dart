import 'package:dio/dio.dart';
import 'package:movieapp/services/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNzc3YWE5Nzg3ZWY3ODM5OTRjNzg5ODk4ZTI3YTViZCIsInN1YiI6IjYyMmU2NWM0OThmMWYxMDA0NTljMTU5NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HIVINkLWazJcYFDR5igTarha44yU83K2J2x3FBgYMCU',
        },
      ),
    );
  }
}
