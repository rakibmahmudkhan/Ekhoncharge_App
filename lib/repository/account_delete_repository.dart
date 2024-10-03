import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class  AccountDeleteRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> AccountDeleteAPIRepo(
      {required String login, required String password}) async {
    Map<String, dynamic> request = {"login": login, "password": password};
    final response = await _apiService.post(
      url: APIs.accountDeleteAPI,
      request: request,
      isTokenRequired: true,
    );
    return response;
  }}