import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchEkhonChargeStationAPIRepo() async {
    final response = await _apiService.get(
      url: APIs.stationAPI,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> fetchEkhonChargerTransactionHistoryAPIRepo() async {
    final response = await _apiService.get(
      url: APIs.transactionHistoryAPI,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> customerTransactionHistoryAPIRepo() async {
    final response = await _apiService.get(
      url: APIs.customerTransactionHistoryAPI,
      isTokenRequired: true,
    );
    return response;
  }
}
