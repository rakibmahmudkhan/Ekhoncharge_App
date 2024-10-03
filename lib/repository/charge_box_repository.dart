import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class ChargeBoxRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchChargerBox(int page, int limit) async {
    final response = await _apiService.get(
      url: '${APIs.chargeBoxAPI}?page=$page&limit=$limit',
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> fetchChargerPoint(String qrText) async {
    final response = await _apiService.get(
      url: '${APIs.chargerPointsAPI}/$qrText',
      isTokenRequired: true,
    );
    return response;
  }
}
