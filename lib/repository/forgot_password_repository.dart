import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class ForgotPasswordRepository{
  final _apiService = NetworkApiServices();
//https://dev.sentineltechno.com/api/user/forget-password/resend-otp
  Future<dynamic> userForgotPassByPhoneNumberAPIRepo(
      {required String? phone }) async {
    Map<String, dynamic> request = {
      'phone': phone,

    };
    final response = await _apiService.post(
      url: APIs.userForgotPassByPhoneNumberAPI,
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
      url: APIs.userForgotPassOtpVerifyAPI,
      request: request,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> changeForgotPasswordAPIRepo(
      {required String? phone, required String? new_password,required String? new_password_confirmation,}) async {
    Map<String, dynamic> request = {
      'phone': phone,
       'new_password':new_password,
      'new_password_confirmation':new_password_confirmation
    };
    final response = await _apiService.post(
      url: APIs.changeForgotPasswordAPI,
      request: request,
      isTokenRequired: true,
    );
    return response;
  }

}