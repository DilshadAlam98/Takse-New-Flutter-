// --------------------------------------------------------
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config/api_config/error_res.dart';

void successPrint({String? message, String url = ""}) {
  log("----------👌✅👌✅👌-----𝑺𝑼𝑪𝑪𝑬𝑺𝑺-----👌✅👌✅👌-------------👇👇\n$message\n$url\n");
}

void reqPrint({String? message, String? type}) {
  log("------- ⚡️⚡️⚡️⚡️⚡️⚡️------$type-----⚡️⚡️⚡️⚡️⚡️⚡️-------------👇👇👇\n$message\n");
}

void errorLog([String? message]) {
  log("---------- ❌❌❌❌	-----𝑬𝑹𝑹𝑶𝑹------❌❌❌❌-------------👇👇👇\n$message\n");
}

void printLn({String? msg, required String value}) {
  debugPrint(" 🎌🎌🎌-${msg ?? "Hey Your Value"}-👇👇\n$value");
}

void console(String message, {String purpose = ''}) {
  log("𝖈𝖔𝖓𝖘𝖔𝖑𝖊 🫣🫣🫣 ==>\n$purpose ::::    $message");
}

enum ApiState { loading, error, loaded, idle }

Future<T?> sendRequest<T>({
  required FutureOr<T> Function() onTry,
  required Function(ErrorRes e)? onError,
  Function()? onFinally,
}) async {
  try {
    return await onTry.call();
  } on SocketException catch (e) {
    return onError?.call(ErrorRes(title: "Error Occurred", message: "Something Went Wrong"));
  } on TimeoutException catch (e) {
    return onError?.call(ErrorRes(message: "Request Time out", title: 'Error Occurred'));
  } on FormatException catch (e) {
    return onError?.call(ErrorRes(message: "Something Went Wrong", title: "Error Occurred"));
  } on DioException catch (e) {
    return onError?.call(ErrorRes.fromJson(e.response?.data ?? {}));
  } on Exception catch (e) {
    return onError?.call(ErrorRes(message: "Something Went Wrong", title: "Error Occurred"));
  } on TypeError catch (e, s) {
    console("Error:- ${e.toString()}\nStacktrace:-${s.toString()}");
    return onError?.call(ErrorRes(message: "Something went wrong", title: "Error Occurred"));
  } catch (e, s) {
    console("Error:- ${e.toString()}\nStacktrace:-${s.toString()}");
    return onError?.call(ErrorRes(message: "Something Went Wrong", title: "Error Occurred"));
  } finally {
    if (onFinally != null) {
      onFinally.call();
    }
  }
}
