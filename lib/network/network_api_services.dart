import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/api/response/app_exception.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/network/base_api_services.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NetworkApiServices extends BaseApiServices {
  Dio dio = Dio();
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  Options options = Options(
    contentType: "application/json",
    validateStatus: (status) {
      return status! <= 500;
    },
  );

  @override
  Future get({required String url, required bool isTokenRequired}) async {
    dynamic responseJson;
    eLocalLogWriter('GET API CALLED>>>>>>>> $url');
    if (isTokenRequired == true) {
      requestHeaders['Authorization'] =
          'Bearer ${PreferenceUtils.getString(eToken) ?? ''}';
      options.headers = requestHeaders;
      eLocalLogWriter('>>>>>>>> Token <<<<<<<<');
      ePrintWrapped('Bearer ${PreferenceUtils.getString(eToken) ?? ''}');
    } else {
      requestHeaders['Authorization'] = '';
      options.headers = requestHeaders;
    }

    try {
      Response response = await dio.get(
        url,
        options: options,
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  @override
  Future post({
    required String url,
    required request,
    required bool isTokenRequired,
  }) async {
    dynamic responseJson;
    if (kDebugMode) {
      eLocalLogWriter('POST API CALLED>>>>>>>> $url');
      eLocalLogWriter(request);
    }

    if (isTokenRequired) {
      requestHeaders['Authorization'] =
          'Bearer ${PreferenceUtils.getString(eToken) ?? ''}';
      options.headers = requestHeaders;
      eLocalLogWriter('>>>>>>>> Token <<<<<<<<');
      ePrintWrapped('Bearer ${PreferenceUtils.getString(eToken) ?? ''}');
    } else {
      requestHeaders['Authorization'] = '';
      options.headers = requestHeaders;
    }
    try {
      Response response = await dio.post(
        url,
        options: options,
        data: jsonEncode(request),
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  Future postBkashToken({
    required String url,
    required request,
    required header,
  }) async {
    dynamic responseJson;
    if (kDebugMode) {
      eLocalLogWriter('POST API CALLED>>>>>>>> $url');
      eLocalLogWriter(request);
      eLocalLogWriter(header);
    }

    try {
      Response response = await dio.post(
        url,
        options: Options(headers: header),
        data: jsonEncode(request),
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  Future postBkash({
    required String url,
    required request,
    required idToken,
  }) async {
    dynamic responseJson;
    if (kDebugMode) {
      eLocalLogWriter('POST API CALLED>>>>>>>> $url');
      eLocalLogWriter(request);
    }

    final headers = {
      "accept": 'application/json',
      "Authorization": idToken,
      "X-APP-Key": APIConfig.bkashAppKey,
      'content-type': 'application/json'
    };

    try {
      Response response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(request),
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  Future postBkashExecute({
    required String url,
    required request,
    required idToken,
  }) async {
    dynamic responseJson;
    if (kDebugMode) {
      eLocalLogWriter('POST API CALLED>>>>>>>> $url');
      eLocalLogWriter(request);
    }

    final headers = {
      "accept": 'application/json',
      "Authorization": idToken,
      "X-APP-Key": APIConfig.bkashAppKey,
      'content-type': 'application/json'
    };

    try {
      Response response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonEncode(request),
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  @override
  Future put({
    required String url,
    required request,
    required bool isTokenRequired,
  }) async {
    dynamic responseJson;
    if (kDebugMode) {
      eLocalLogWriter('POST API CALLED>>>>>>>> $url');
      eLocalLogWriter(request);
    }

    if (isTokenRequired) {
      requestHeaders['Authorization'] =
          'Bearer ${PreferenceUtils.getString(eToken) ?? ''}';
      options.headers = requestHeaders;
    } else {
      requestHeaders['Authorization'] = '';
      options.headers = requestHeaders;
    }
    try {
      Response response = await dio.put(
        url,
        options: options,
        data: jsonEncode(request),
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  @override
  Future delete({
    required String url,
    required request,
    required bool isTokenRequired,
  }) async {
    dynamic responseJson;
    if (kDebugMode) {
      eLocalLogWriter('POST API CALLED>>>>>>>> $url');
      eLocalLogWriter(request);
    }

    if (isTokenRequired) {
      requestHeaders['Authorization'] =
          'Bearer ${PreferenceUtils.getString(eToken) ?? ''}';
      options.headers = requestHeaders;
    } else {
      requestHeaders['Authorization'] = '';
      options.headers = requestHeaders;
    }
    try {
      Response response = await dio.delete(
        url,
        options: options,
        data: jsonEncode(request),
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  Future withoutRequestDelete({
    required String url,
    required bool isTokenRequired,
  }) async {
    dynamic responseJson;
    if (kDebugMode) {
      eLocalLogWriter('DELETE API CALLED>>>>>>>> $url');
    }

    if (isTokenRequired) {
      requestHeaders['Authorization'] =
          'Bearer ${PreferenceUtils.getString(eToken) ?? ''}';
      options.headers = requestHeaders;
    } else {
      requestHeaders['Authorization'] = '';
      options.headers = requestHeaders;
    }
    try {
      Response response = await dio.delete(
        url,
        options: options,
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  @override
  Future multiParts({
    required String url,
    required request,
    required bool isTokenRequired,
    required String uploadedCount,
  }) async {
    dynamic responseJson;
    if (kDebugMode) {
      eLocalLogWriter('POST API CALLED>>>>>>>> $url');
      eLocalLogWriter(request);
    }

    if (isTokenRequired) {
      requestHeaders['Authorization'] =
          'Bearer ${PreferenceUtils.getString(eToken) ?? ''}';
      options.headers = requestHeaders;
    } else {
      requestHeaders['Authorization'] = '';
      options.headers = requestHeaders;
    }
    try {
      Response response = await dio.post(
        url,
        options: options,
        data: request,
        onSendProgress: (int sent, int total) {
          double progress = sent / total;
          EasyLoading.showProgress(progress,
              status: 'progress: ${(progress * 100).toStringAsFixed(0)}%');
        },
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  Future<dynamic> postRaw(String url, dynamic req) async {
    dynamic responseJson;
    eLocalLogWriter('POST API CALLED>>>>>>>> $url');
    eLocalLogWriter(req);
    try {
      Response response = await dio.post(
        url,
        data: FormData.fromMap(req),
      );
      if (kDebugMode) {
        eLocalLogWriter('>>>>>>>> RESPONSE <<<<<<<<');
        ePrintWrapped(response.data.toString());
      }
      responseJson = response.data;
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    } on ServerException {
      throw ServerException();
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case eTokenExpired:
        eCustomToast(message: 'Your session has been expired, please login');
        eLogout();
        throw UnAuthorizedException();
      default:
        return response.data;
    }
  }
}
