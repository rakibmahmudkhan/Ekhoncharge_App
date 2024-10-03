import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class VehicleRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchVehicleMakeListAPIRepo() async {
    final response = await _apiService.get(
      url: APIs.vehicleMakeAPI,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> fetchVehicleModelListAPIRepo(int makeId) async {
    final response = await _apiService.get(
      url: '${APIs.vehicleModelAPI}/$makeId',
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> fetchVehicleYearListAPIRepo(int makeId, int modelId) async {
    final response = await _apiService.get(
      url: '${APIs.vehicleYearAPI}/$makeId/$modelId',
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> fetchVehicleColorListAPIRepo() async {
    final response = await _apiService.get(
      url: APIs.vehicleMakeAPI,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> postVehicle({
    required String email,
    required int? makeId,
    required int? modelId,
    required int? yearId,
    required String? vin,
    required String? registrationNo,
  }) async {
    Map<String, dynamic> request = {
      'email': email,
      'make_id': makeId,
      'vehiclemodel_id': modelId,
      'year': yearId,
      'vin': vin,
      'registration_no': registrationNo
    };
    final response = await _apiService.post(
      url: APIs.vehicleStoreAPI,
      request: request,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> fetchRegCarListAPIRepo({
    required int customerId,
  }) async {
    String url = "${APIs.vehiclesListAPI}/$customerId";
    final response = await _apiService.get(
      url: url,
      isTokenRequired: true,
    );
    return response;
  }
  Future<dynamic> fetchVehicleDetailsAPIRepo({
    required String make,
    required String model,
    required String year,
  }) async {
    String url = "${APIs.vehicleDetailsAPI}/$make/$model/$year";
    final response = await _apiService.get(
      url: url,
      isTokenRequired: true,
    );
    return response;
  }

  Future<dynamic> deleteRegCar({
    required String uuid,
  }) async {
    String deleteUrl = "${APIs.vehicleStoreAPI}/$uuid";

    final response = await _apiService.withoutRequestDelete(
      url: deleteUrl,
      isTokenRequired: true,
    );
    return response;
  }
}
