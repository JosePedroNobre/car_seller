import 'package:dio/dio.dart';

class DioLogger {
  static void onSend(String tag, RequestOptions options) {
    print('$tag - Request Path : [${options.method}] ${options.baseUrl}${options.path}${options.queryParameters}');
    print('$tag - Request Data : ${options.data.toString()}');
  }
}
