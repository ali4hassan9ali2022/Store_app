import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
      headers: {'Content-Type': 'application/json', 'lang': 'ar'},
    ),
  );

  static Future<Response> getData({
    required path,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String token = '',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio.get(path, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    String lang = 'ar',
    String token = '',
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    String lang = 'ar',
    String token = '',
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return dio.put(url, queryParameters: query, data: data);
  }
}
