import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/models/wallet.dart';
import 'package:ekhoncharge/repository/wallet_repository.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';

class WalletController extends GetxController {
  final WalletRepository _walletRepository = WalletRepository();
  final _wallet = WalletModel().obs;

  WalletModel get wallet => _wallet.value;

  set wallet(WalletModel value) {
    _wallet.value = value;
  }

  Future<void> fetchWalletData() async {
    try {
      eProgressLoader();
      var response = await _walletRepository.fetchWalletTransactionListAPIRepo(
          PreferenceUtils.getInt(eCustomerId) ?? 0);
      if (response != null) {
        wallet = WalletModel.fromJson(response);
      } else {
        eLocalLogWriter("Error ");
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }
}
