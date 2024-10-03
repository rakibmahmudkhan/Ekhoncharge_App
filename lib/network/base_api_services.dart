import 'package:dio/dio.dart';

abstract class BaseApiServices {
  Future<dynamic> get({required String url, required bool isTokenRequired});

  Future<dynamic> post(
      {required String url, required request, required bool isTokenRequired});

  Future<dynamic> put(
      {required String url, required request, required bool isTokenRequired});

  Future<dynamic> delete(
      {required String url, required request, required bool isTokenRequired});

  Future<dynamic> multiParts(
      {required String url, required request, required bool isTokenRequired, required String uploadedCount});
}
