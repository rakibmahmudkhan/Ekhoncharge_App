import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class PusherRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> pusherAuthenticateRepo(
      String socketId, String channelName) async {
    var response = _apiService.post(
      url: APIs.pusherAuth,
      request: {
        'socket_id': socketId,
        'channel_name': channelName,
      },
      isTokenRequired: true,
    );

    return response;
  }

  Future<dynamic> postStartBtn({
    required type,
    required chargerId,
    required connectorId,
  }) async {
    Map<String, dynamic> requestBody = {
      'type': type,
      'chargerId': chargerId,
      'connectorId': connectorId,
    };

    final response = await _apiService.post(
      url: APIs.connectStartBtnAPI,
      request: requestBody,
      isTokenRequired: true,
    );

    return response;
  }

  Future<dynamic> postStopBtn({
    required type,
    required chargerId,
    required transactionId,
  }) async {
    Map<String, dynamic> requestBody = {
      'type': type,
      'chargerId': chargerId,
      'transactionId': transactionId,
    };

    final response = await _apiService.post(
      url: APIs.connectStopBtnAPI,
      request: requestBody,
      isTokenRequired: true,
    );

    return response;
  }

  Future<dynamic> energyTnxSummeryRepo(dynamic id) async {
    final response = await _apiService.get(
      url: "${APIs.stopEnergyTxnAPI}/$id",
      isTokenRequired: true,
    );

    return response;
  }

  Future<dynamic> paymentWalletRepo(dynamic id) async {
    final response = await _apiService.get(
      url: "${APIs.paymentWalletAPI}/$id",
      isTokenRequired: true,
    );

    return response;
  }
}
