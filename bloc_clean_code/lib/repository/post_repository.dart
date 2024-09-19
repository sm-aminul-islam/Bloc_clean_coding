import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_code/model/post_api_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostApiModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostApiModel(
              postId: e['postId'],
              id: e['id'],
              name: e['name'],
              email: e['email'],
              body: e['body']);
        }).toList();
      }
    } on SocketException {
      throw ("Error while Fetching Data");
    } on TimeoutException {
      throw ("No Internet Connection");
    }
    throw Exception("Error while fetching data");
  }
}
