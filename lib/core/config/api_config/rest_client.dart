import 'package:dio/dio.dart';

import '../../constant/api_const.dart';
import 'client_interceptor.dart';

class RestClient {
  late Dio dio;
  final String baseUrl;
  static RestClient? _instance;

  RestClient._({this.baseUrl = ApiConst.baseUrl}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(ClientInterceptor());
  }

  static RestClient getInstance({String? baseUrl}) {
    if (_instance != null) {
      return _instance!;
    }

    _instance = RestClient._(baseUrl: baseUrl ?? ApiConst.baseUrl);
    return _instance!;
  }
}
