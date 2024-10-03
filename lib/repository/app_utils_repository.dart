import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class AppUtilsRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchPrivacyPolicyRepo() async {
    final response = await _apiService.get(
      url: APIs.privacyPoliciesAPI,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> fetchFAQRepo() async {
    final response = await _apiService.get(
      url: APIs.faqAPI,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> fetchContactRepo() async {
    final response = await _apiService.get(
      url: APIs.contactAPI,
      isTokenRequired: true,
    );
    return response;
  }
}
