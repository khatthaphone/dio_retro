import 'dart:async';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dao/post_dao.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio) = _AppApi;

  @GET('/posts')
  Future<List<PostDao>> getPosts();
}