import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'app_string.dart';
import 'http_model.dart';
import 'json_result.dart';

const String baseUrl = 'https://okrserv.dcatgame.com';
// const String baseUrl = 'http://192.168.8.225:8081';
//const String baseUrl = 'http://192.168.10.132:8081';

const String getGroupUrl = "/okr/group";
const String _phoneCode = '/api/p/get';

Dio _dio;

Dio getDio() {
  if (_dio == null) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
    _dio.interceptors.add(CookieManager(CookieJar()));
    // _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  return _dio;
}

Future<ApiResponse> get(BuildContext context, String url, {Map<String, dynamic> queryParams}) async {
  var dio = getDio();
  try {
    var response = await dio.get(url, queryParameters: queryParams);

    var apiResponse = ApiResponse.fromJson(response.data);
    if (apiResponse.res == RESULT_OK) {
      return Future.value(apiResponse);
    }

    switch (apiResponse.res) {
      case AUTHENTICATE_FAILED:
        EasyLoading.showToast("请求失败:${apiResponse.err}");
        return Future.error('session expired');
      case UNAUTHENTICATED:
        // 发生错误了。
        EasyLoading.showToast('发生错误，请重新登陆');
        // var loginModel = context.read<LoginModel>();
        // loginModel.loginOk = false;
        return Future.error('session expired');
      case UNAUTHORIZED:
        EasyLoading.showToast('无权访问');
        return Future.error('unauthorized');
      default:
        return Future.error('error happened');
    }
  } catch (err) {
    return Future.error(err);
  }
}

Future<ApiResponse> post(
  BuildContext context,
  String url, {
  String contentType,
  dynamic data,
}) async {
  var dio = getDio();
  try {
    var response = await dio.post(
      url,
      options: Options(
        contentType: contentType,
      ),
      data: data,
    );

    var apiResponse = ApiResponse.fromJson(response.data);
    if (apiResponse.res == RESULT_OK) {
      return Future.value(apiResponse);
    }

    switch (apiResponse.res) {
      case AUTHENTICATE_FAILED:
        EasyLoading.showToast("请求失败: ${apiResponse.err}");
        return Future.error('session expired');
      case UNAUTHENTICATED:
        // 发生错误了。
        EasyLoading.showToast('发生错误，请重新登陆');
        // var loginModel = context.read<LoginModel>();
        // loginModel.loginOk = false;
        return Future.error('session expired');
      case UNAUTHORIZED:
        EasyLoading.showToast('无权访问');
        return Future.error('unauthorized');
      default:
        return Future.error('error happened');
    }
  } catch (err) {
    return Future.error(err);
  }
}

// 获取验证码
Future<JsonResult<bool>> getPhoneCode(BuildContext context, String phoneNum) async {
  JsonResult<bool> jsonResult = JsonResult<bool>();
  try {
    var parameters = {"phoneNumber": phoneNum};
    var response = await get(context, _phoneCode, queryParams: parameters);
    if (response.res == 0) {
      jsonResult.isSuccess = true;
      jsonResult.data = true;
    } else {
      jsonResult.isSuccess = false;
      var msg = response.err;
      jsonResult.message = msg != null ? msg : AppStrings.SERVER_EXCEPTION;
    }
  } catch (e) {
    jsonResult.isSuccess = false;
    jsonResult.message = AppStrings.SERVER_EXCEPTION;
  }
  return jsonResult;
}

Future<ApiResponse> clientExceptionPost(
  String url, {
  String contentType,
  dynamic data,
}) async {
  var dio = getDio();
  try {
    var response = await dio.post(
      url,
      options: Options(
        contentType: contentType,
      ),
      data: data,
    );

    var apiResponse = ApiResponse.fromJson(response.data);
    if (apiResponse.res == RESULT_OK) {
      return Future.value(apiResponse);
    }

    switch (apiResponse.res) {
      case AUTHENTICATE_FAILED:
        EasyLoading.showToast("请求失败: ${apiResponse.err}");
        return Future.error('session expired');
      case UNAUTHORIZED:
        EasyLoading.showToast('无权访问');
        return Future.error('unauthorized');
      default:
        return Future.error('error happened');
    }
  } catch (err) {
    return Future.error(err);
  }
}
