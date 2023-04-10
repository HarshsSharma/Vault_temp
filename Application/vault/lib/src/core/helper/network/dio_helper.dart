import 'dart:developer';

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        baseUrl: 'https://dummyjson.com/',
        receiveDataWhenStatusError: true,
      ),
    );
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        log(options.path);
        // Do something before request is sent.
        // If you want to resolve the request with custom data,
        // you can resolve a `Response` using `handler.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject with a `DioError` using `handler.reject(dioError)`.
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        log(response.toString());

        // Do something with response data.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object using `handler.reject(dioError)`.
        return handler.next(response);
      },
      onError: (DioError e, ErrorInterceptorHandler handler) {
        // e.requestOptions.path = 'products';
        log('Error has occurred');
        DioHelper.getData(url: 'products');
        // Do something with response error.
        // If you want to resolve the request with some custom data,
        // you can resolve a `Response` object using `handler.resolve(response)`.
        //  return handler.next(e);
      },
    ));
  }

  static Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      bool auth = true}) async {
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return await _dio.get(url, queryParameters: query);
  }
}
