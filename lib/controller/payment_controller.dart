import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/repository/payment_repository.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:ekhoncharge/views/bkash_failed_page.dart';
import 'package:ekhoncharge/views/bkash_success_page.dart';
import 'package:ekhoncharge/views/bkash_webview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final _paymentRepository = PaymentRepository();
  var _currentAmount = '';
  var _currentTransactionId = '';
  var _token = '';
  late DateTime _tokenValidity;
  dynamic _depositResponse;

  dynamic get depositResponse => _depositResponse;

  get currentTransactionId => _currentTransactionId;

  set currentTransactionId(value) {
    _currentTransactionId = value;
  }

  TextEditingController amountTxtCtl = TextEditingController();

  get currentAmount => _currentAmount;

  set currentAmount(value) {
    _currentAmount = value;
  }

  void resetPaymentPage() {
    amountTxtCtl.clear();
    _currentAmount = '';
    _currentTransactionId = '';
  }

  void validateBkashFields(BuildContext context) {
    if (amountTxtCtl.text.isEmpty) {
      eCustomToast(message: 'Pleases select a valid amount');
    } else if (int.parse(amountTxtCtl.text) < 10) {
      eCustomToast(message: 'Pleases select a minimum amount of BDT 10');
    } else {
      bkashToken(context);
    }
  }

  Future<void> bkashToken(BuildContext context) async {
    if (_token == '') {
      EasyLoading.show();
      try {
        var response = await _paymentRepository.requestForBkashToken();
        if (response['statusCode'] == '0000') {
          _token = response['id_token'];
          _tokenValidity = DateTime.now()
              .add(Duration(seconds: response['expires_in']))
              .subtract(const Duration(minutes: 5));
          await bkashAddMoneyCtl(response['id_token'], context);
        }
      } catch (error) {
        EasyLoading.dismiss();
        eLocalLogWriter(error.toString());
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      if (DateTime.now().isBefore(_tokenValidity)) {
        await bkashAddMoneyCtl(_token, context);
      } else {
        try {
          var response = await _paymentRepository.refreshBkashToken(_token);
          if (response['statusCode'] == '0000') {
            _token = response['id_token'];
            _tokenValidity = DateTime.now()
                .add(Duration(seconds: response['expiresIn']))
                .subtract(const Duration(minutes: 5));
            await bkashAddMoneyCtl(response['id_token'], context);
          }
        } catch (error) {
          eLocalLogWriter(error.toString());
        } finally {
          Get.back();
        }
      }
    }
  }

  Future<void> bKashExecute(dynamic paymentId) async {
    EasyLoading.show();
    try {
      var response = await _paymentRepository.executePayWithAgreement(
          paymentId: paymentId, idToken: _token);
      await walletDepositAPICtl(response);
    } catch (error) {
      EasyLoading.dismiss();
      eLocalLogWriter(error.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> walletDepositAPICtl(dynamic responseJson) async {
    try {
      var response =
      await _paymentRepository.walletDepositAPI(responseJsn: responseJson);

      if (response['success'] == true) {
        _depositResponse = response;
        Get.to(() => const BkashSuccessPage());
      } else {
        Get.to(() => BkashFailedPage(
            statusMessage: responseJson['statusMessage'] ?? ''));
      }
    } catch (error) {
      EasyLoading.dismiss();
      eLocalLogWriter(error.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> bkashAddMoneyCtl(dynamic idToken, BuildContext context) async {
    try {
      var response = await _paymentRepository.createPaymentBkash(
        amount: amountTxtCtl.text,
        merchantInvoiceNumber: DateTime.now().microsecondsSinceEpoch.toString(),
        idToken: idToken,
      );

      if (response['statusCode'] == '0000') {
        EasyLoading.dismiss();
        String bkashPaymentStatus = await Get.to(
              () => BkashWebViewPage(
            bkashURL: response['bkashURL'],
            failureCallbackURL: response['failureCallbackURL'],
            successCallbackURL: response['successCallbackURL'],
            cancelledCallbackURL: response['cancelledCallbackURL'],
          ),
        );

        if (bkashPaymentStatus == 'success') {
          await bKashExecute(response['paymentID']);
        } else if (bkashPaymentStatus == 'canceled') {
          eCustomToast(message: 'Cancel');
          await bKashExecute(response['paymentID']);
        } else if (bkashPaymentStatus == 'failed') {
          eCustomToast(message: 'failed');
          await bKashExecute(response['paymentID']);
        }
      } else {
        EasyLoading.dismiss();
        eCustomToast(message: 'Something went wrong');
      }
    } catch (error) {
      EasyLoading.dismiss();
      eLocalLogWriter(error.toString());
    }
  }

  void resetBkashPage() {
    amountTxtCtl.clear();
  }

// AMAR PAY INTEGRATION

// WebViewController? _controller;
// WebViewController? get controller => _controller;
/*void validatePaymentForm() {
    if (amountTxtCtl.text.trim().isEmpty) {
      eCustomToast(message: 'Enter amount');
    } else if (int.parse(amountTxtCtl.text) < 10) {
      eCustomToast(message: 'Minimum amount is 10');
    } else {
      currentAmount = amountTxtCtl.text;
      currentTransactionId = DateTime.now().millisecondsSinceEpoch.toString();
      requestForAmarpayPaymentUrlCtl();
    }
  }*/

/*  Future<void> requestForAmarpayPaymentUrlCtl() async {
    bool isSuccess = false;
    eProgressLoader();
    try {
      var response =
          await _paymentRepository.requestForAmarpayPaymentUrlAPIRepo(
        transactionID: currentTransactionId,
        transactionAmount: amountTxtCtl.text,
        description: 'Sentinel Test',
        customerName: 'Ebrahim Joy',
        customerEmail: 'eebrahim@gmail.com',
        customerMobile: '01515214189',
      );

      var jsonResponse = jsonDecode(response);
      if (jsonResponse['result'] != null && jsonResponse['result'] == 'true') {
        isSuccess = true;
        setWebViewController(jsonResponse['payment_url']);
      } else {
        if (jsonResponse.containsKey('cus_name')) {
          eCustomToast(message: jsonResponse['cus_name']);
        } else if (jsonResponse.containsKey('cus_email')) {
          eCustomToast(message: jsonResponse['cus_email']);
        } else if (jsonResponse.containsKey('cus_phone')) {
          eCustomToast(message: jsonResponse['cus_phone']);
        } else if (jsonResponse.containsKey('amount')) {
          eCustomToast(message: jsonResponse['amount']);
        } else if (jsonResponse.containsKey('currency')) {
          eCustomToast(message: jsonResponse['currency']);
        } else if (jsonResponse.containsKey('tran_id')) {
          eCustomToast(message: jsonResponse['tran_id']);
        } else if (jsonResponse.containsKey('success_url')) {
          eCustomToast(message: jsonResponse['success_url']);
        } else if (jsonResponse.containsKey('fail_url')) {
          eCustomToast(message: jsonResponse['fail_url']);
        } else if (jsonResponse.containsKey('cancel_url')) {
          eCustomToast(message: jsonResponse['cancel_url']);
        } else if (jsonResponse.containsKey('desc')) {
          eCustomToast(message: jsonResponse['desc']);
        } else {
          eCustomToast(message: response.toString());
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      if (isSuccess) {
        Get.offAndToNamed(RoutesName.paymentGatewayPage);
      }
    }
  }*/

/*void manageAmarpayWebResponse(String url) {
    if (url.contains(eAmarPayAPISuccessUrl)) {
      // myBalance = myBalance + int.parse(currentAmount);
      update();
      Get.offAndToNamed(RoutesName.paymentSuccessPage);
    } else if (url.contains(eAmarPayAPIFailUrl)) {
      Get.offAndToNamed(RoutesName.paymentFailurePage);
    } else if (url.contains(eAmarPayAPICancelUrl)) {
      Get.offAndToNamed(RoutesName.paymentFailurePage);
    }
  }*/
}
