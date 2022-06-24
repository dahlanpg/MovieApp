import '../models/post_model.dart';

abstract class HomeRepository {
  //Future<List<dynamic>> getList();
  Future<List<PostModel>> getList();
  //Future, pois não sabemos quando o retorno irá ocorrer
}
