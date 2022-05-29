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
    dio.options.headers=
    {

      'Authorization': token??'',
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
    dio.options.headers=
    {
      'Content-Type': 'application/json',
      'Authorization': token??'',

    };
    return await dio.get(
      path,
    );
  }



  static Future<Response> getSearchData({
    required String path,
      String? token,
      String? name,
      int? year
  }) async {
    dio.options.headers=
    {
      'Content-Type': 'application/json',
      'Authorization': token??'',

    };
    return await dio.get(
      path,queryParameters: {
        
        'name':name,
        'year':year,
      }
    );
  }
}
