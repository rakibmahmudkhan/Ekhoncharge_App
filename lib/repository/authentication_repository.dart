import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class AuthRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginAPIRepo(
      {required String login, required String password}) async {
    Map<String, dynamic> request = {"login": login, "password": password};
    final response = await _apiService.post(
      url: APIs.loginAPI,
      request: request,
      isTokenRequired: false,
    );
    return response;
  }

  Future<dynamic> refreshTokenAPI() async {
    final response = await _apiService.post(
      url: APIs.refreshToken,
      request: {},
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> postRegister({
    required String name,
    required String email,
    required String? phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    Map<String, dynamic> request = {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'customer_type': 'Individual',
    };
    final response = await _apiService.post(
      url: APIs.registrationAPI,
      request: request,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> otpVerifyAPIRepo(
      {required String? phone, required otp}) async {
    Map<String, dynamic> request = {
      'phone': phone,
      'otp': otp,
    };
    final response = await _apiService.post(
      url: APIs.otpVerifyAPI,
      request: request,
      isTokenRequired: true,
    );
    return response;
  }
  Future<dynamic> walletCreateAPIRepo(
      {required int? customerId}) async {
    Map<String, dynamic> request = {
      'customer_id': customerId,

    };
    final response = await _apiService.post(
      url: APIs.walletCreateAPI,
      request: request,
      isTokenRequired: true,
    );
    return response;
  }
}
