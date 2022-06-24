import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/posts_model.dart';

class PostsController {
  ValueNotifier<List<Post>> posts = ValueNotifier([]);
  ValueNotifier<bool> inLoader = ValueNotifier(false);

  // random() async {
  //   for (int i = 0; i < 100; ++i) {
  //     await Future.delayed(Duration(milliseconds: 100));
  //     pseudoAleatorio.value = Random().nextInt(100);
  //   }
  // }

  callAPI() async {
    var client = http.Client();
    try {
      inLoader.value = true;
      var response = await client.get(
        Uri.parse('http://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
    } finally {
      client.close();
      await Future.delayed(Duration(seconds: 1));
      inLoader.value = false;
    }
  }
}
