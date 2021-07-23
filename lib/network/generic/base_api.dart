import 'dart:async';
import 'package:car_seller_app/network/generic/dio_logger.dart';
import 'package:dio/dio.dart';

class BaseApi {
  static String _baseURL = "https://www.particleforward.com/api/challenge/";
  static const String TAG = 'BaseAPI';
  Dio dio = Dio();

  BaseApi() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers.addAll({"Accept": "application/json", "content-type": "application/json"});
      DioLogger.onSend("TAG", options);
      print(options);
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    // http options
    dio.options.baseUrl = _baseURL;
    dio.options.connectTimeout = 100000; //10s
    dio.options.receiveTimeout = 100000;
  }

  Future<dynamic> post(String url, dynamic body, Map<String, dynamic> queryParams) async {
    var responseJson;
    var response = await dio.post(url, data: body, queryParameters: queryParams);
    responseJson = response.data;
    return responseJson;
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) async {
    var responseJson;
    final response = await dio.get(url, queryParameters: queryParameters);
    responseJson = response.data;
    return responseJson;
  }

  Future<dynamic> patch(String url, {Map<String, dynamic>? queryParameters}) async {
    var responseJson;
    final response = await dio.patch(url, queryParameters: queryParameters);
    responseJson = response.data;
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    final response = await dio.put(url, data: body);
    responseJson = response.data;
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var apiResponse;
    final response = await dio.delete(url);
    apiResponse = response.data;
    return apiResponse;
  }
}
