import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://thebook.tech/api/',
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };
    return await dio.post(
      path,
      data: data,
    );
  }

  static Future<Response> getData({
    required String path,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio.get(
      path,
    );
  }

  static Future<Response> deleteData({
    required String path,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio.delete(path);
  }

  static Future<Response> getSearchData({
    required String path,
    String? keyword,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(path, queryParameters: {
      'keyword': keyword,
    });
  }

  static Future<Response> getWantToReadData({
    required String path,
    dynamic uID,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(path, queryParameters: {
      'user_id': uID,
    });
  }
}


//  54, 187, 178, 1        54, 187, 178, 5