import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class WalletRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> fetchWalletTransactionListAPIRepo(int customerId) async {
    final response = await _apiService.get(
      url: '${APIs.walletTransactionAPI}/$customerId',
      isTokenRequired: true,
    );
    return response;
  }
}
