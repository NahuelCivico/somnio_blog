import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:somnio_blog/core/helpers/constants.dart';
import 'package:somnio_blog/core/helpers/failure.dart';
import 'package:somnio_blog/core/models/post.dart';
import 'package:http/http.dart' as http;

class BlogRepository {
  BlogRepository();

  Future<Either<Failure, List<Post>>> fetchPosts(
      {required int page, int limit = 20}) async {
    List<Post> posts = [];
    try {
      final response = await http
          .get(Uri.parse('${Constants.apiURL}?_page=$page&_limit=$limit'));
      if (response.statusCode == 200) {
        json.decode(response.body).forEach((post) {
          posts.add(Post.fromMap(post));
        });
      }
      return Right(posts);

      // Emular un error para ver el el resultado en la UI
      // return const Left(ServerFailure('Server Failure'));
    } on Exception catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
  }
}
