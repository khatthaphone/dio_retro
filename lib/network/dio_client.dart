import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DioClient {

  Dio provideDao(/*SharedPreferences, etc...*/) {
    final dio = Dio();
    dio
      ..options.baseUrl = 'https://jsonplaceholder.typicode.com'
      ..interceptors.add(LogInterceptor(request: true, responseBody: true, requestBody: true, requestHeader: true))
      ..interceptors.add(InterceptorsWrapper(onRequest: (options) async {
        // get token then add to options.headers:
        // options.headers.putIfAbsent('Authorization', () => 'Bearer ${token}');
      }))
      ..interceptors.add(InterceptorsWrapper(onResponse: (res) async {
        // if response status is successful and response body contains token
        // save token for later use
      }))
      ..interceptors.add(GetIt.instance.get<Alice>().getDioInterceptor());

    return dio;
  }
}
