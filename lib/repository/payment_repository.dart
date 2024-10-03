import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/network/network_api_services.dart';

class PaymentRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> createPaymentBkash({
    required String amount,
    required String merchantInvoiceNumber,
    required dynamic idToken,
  }) async {
    Map<String, dynamic> req = {
      "mode": '0011',
      "payerReference": " ",
      "callbackURL": 'https://example.com/',
      "amount": amount,
      "currency": 'BDT',
      "intent": 'sale',
      "merchantInvoiceNumber": merchantInvoiceNumber,
    };
    final response = await _apiService.postBkash(
      url: APIs.createBkashPayment,
      request: req,
      idToken: idToken,
    );
    return response;
  }

  Future<dynamic> executePayWithAgreement({
    required String paymentId,
    required String idToken,
  }) async {
    Map<String, dynamic> req = {
      "paymentID": paymentId,
    };
    final response = await _apiService.postBkashExecute(
      url: APIs.bkashCheckoutExecute,
      request: req,
      idToken: idToken,
    );
    return response;
  }

  Future<dynamic> requestForBkashToken() async {
    final headers = {
      "accept": 'application/json',
      "username": APIConfig.bkashUsername,
      "password": APIConfig.bkashPassword,
      'content-type': 'application/json'
    };
    final body = {
      "app_key": APIConfig.bkashAppKey,
      "app_secret": APIConfig.bkashAppSecret,
    };

    final response = await _apiService.postBkashToken(
      url: APIs.requestForBkashToken,
      request: body,
      header: headers,
    );
    return response;
  }

  Future<dynamic> refreshBkashToken(dynamic refreshToken) async {
    final headers = {
      "accept": 'application/json',
      "username": APIConfig.bkashUsername,
      "password": APIConfig.bkashPassword,
      'content-type': 'application/json'
    };
    final body = {
      "app_key": APIConfig.bkashAppKey,
      "app_secret": APIConfig.bkashAppSecret,
      "refresh_token": refreshToken,
    };

    final response = await _apiService.postBkashToken(
      url: APIs.refreshBkashToken,
      request: body,
      header: headers,
    );
    return response;
  }

  Future<dynamic> walletDepositAPI({required dynamic responseJsn}) async {
    final response = await _apiService.post(
      url: APIs.bkashWalletDepositAPI,
      request: responseJsn,
      isTokenRequired: true,
    );
    return response;
  }

// Future<dynamic> requestForAmarpayPaymentUrlAPIRepo({
//   required String transactionID,
//   required String transactionAmount,
//   required String description,
//   required String customerName,
//   required String customerEmail,
//   required String customerMobile,
//   String? customerAddress1 = '',
//   String? customerAddress2 = '',
//   String? customerCity = '',
//   String? customerState = '',
//   String? customerPostCode = '',
//   String? customerCountry = 'Bangladesh',
//   String? optA = '',
//   String? optB = '',
//   String? optC = '',
//   String? optD = '',
// }) async {
//   Map<String, dynamic> req = {
//     "store_id": eAmarPayStoreId,
//     "success_url": eAmarPayAPISuccessUrl,
//     "fail_url": eAmarPayAPIFailUrl,
//     "cancel_url": eAmarPayAPICancelUrl,
//     "currency": eAmarPayCurrency,
//     "signature_key": eAmarPaySignatureKey,
//     "type": eAmarPayResponseType,
//     "tran_id": transactionID,
//     "amount": transactionAmount,
//     "desc": description,
//     "cus_name": customerName,
//     "cus_email": customerEmail,
//     "cus_add1": customerAddress1,
//     "cus_add2": customerAddress2,
//     "cus_city": customerCity,
//     "cus_state": customerState,
//     "cus_postcode": customerPostCode,
//     "cus_country": customerCountry,
//     "cus_phone": customerMobile,
//     "opt_a": optA,
//     "opt_b": optB,
//     "opt_c": optC,
//     "opt_d": optD,
//   };
//   final response = await _apiService.postRaw(eAmarPayAPIBaseUrl, req);
//   return response;
// }
}
