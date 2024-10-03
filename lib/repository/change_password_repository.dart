import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class ChangePasswordRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> ChangePasswordAPIRepo(
      {required String oldPassword,
      required String newPassword,
      required String newConfirmPassword,
      required int id}) async {
    Map<String, dynamic> request = {
      "old_password": oldPassword,
      "new_password": newPassword,
      "confirm_password": newConfirmPassword,
      "id": id
    };
    final response = await _apiService.post(
      url: APIs.changePasswordAPI,
      request: request,
      isTokenRequired: true,
    );
    return response;
  }
}
