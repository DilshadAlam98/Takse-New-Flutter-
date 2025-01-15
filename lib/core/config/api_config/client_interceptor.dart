import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:screwdriver/screwdriver.dart';
import 'package:takse/core/local/app_session.dart';
import 'package:takse/core/local/local_const.dart';
import 'package:takse/src/features/auth/model/login_with_password_res.dart';

import '../../constant/global_const.dart';

class ClientInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final user = await AppSession().getString(LocalConst.loginDetails);
    LoginWithPasswordResponse? loginUser;
    if (user != null) {
      loginUser = LoginWithPasswordResponse.fromJson(jsonDecode(user));
    }
    options.headers.addAll({
      "Authorization": "Bearer ${loginUser?.token}",
    });

    _apiLogger(options);
    super.onRequest(options, handler);
  }

  void _apiLogger(RequestOptions options) {
    log("Ⓜ️Ⓜ️Ⓜ️ 𝑴𝒆𝒕𝒉𝒐𝒅------->> ${options.method.toString()}");
    log("🌐🌐🌐 𝑬𝑵𝑫𝑷𝑶𝑰𝑵𝑻---->>${options.uri.toString()}\n");
    if (jsonEncode(options.headers).isNotNullOrBlank) {
      reqPrint(message: jsonEncode(options.headers), type: "𝑯𝑬𝑨𝑫𝑬𝑹𝑺");
    }
    if (options.data is Map) {
      if (jsonEncode(options.data).isNotNullOrBlank) {
        reqPrint(message: jsonEncode(options.data), type: "𝑫𝑨𝑻𝑨(𝑩𝒐𝒅𝒚)");
      }
    } else if (options.data is FormData) {
      final data = options.data as FormData;
      reqPrint(message: data.fields.toString());
    } else {
      console("Data body (type:${options.data.runtimeType})::  ${options.data.toString()}    ");
    }

    if (options.queryParameters.isNotEmpty) {
      reqPrint(message: jsonEncode(options.queryParameters), type: "𝙌𝙐𝙀𝙍𝙔 𝙋𝘼𝙍𝘼𝙈𝙎");
    }
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    errorLog("#### Error for the Api: --> ${err.requestOptions.path} \n${jsonEncode(err.response?.data)}");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    successPrint(url: "Response of-->${response.requestOptions.uri}", message: jsonEncode(response.data));

    super.onResponse(response, handler);
  }
}
