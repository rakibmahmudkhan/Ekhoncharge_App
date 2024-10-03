import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/repository/account_delete_repository.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountDeleteController extends GetxController {
  final accountDeleteRepo= AccountDeleteRepository();
  final deleteAccEmailTxtCtl = TextEditingController();
  final deleteAccPasswordTxtCtl = TextEditingController();
  final _obscureAccDeletePassTxt= true.obs;

  get obscureAccDeletePassTxt => _obscureAccDeletePassTxt.value;

  set obscureAccDeletePassTxt(value) {
    _obscureAccDeletePassTxt.value = value;
    update();
  }

  Future<void> validateAccDeleteForm() async {

    if (deleteAccEmailTxtCtl.text.trim().isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eEnterEmail.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
    } else if (deleteAccPasswordTxtCtl.text.trim().isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eEnterPassword.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
    } else if (deleteAccPasswordTxtCtl.text.length < 8) {
      Get.snackbar(
        eValidationError.tr,
        ePasswordEightDigit.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
    } else {
      await postAccountDeleteController();
    }
  }

  Future<void> postAccountDeleteController() async {
    eProgressLoader();
    try {
      var accDeleteResponse = await accountDeleteRepo.AccountDeleteAPIRepo(
        login: deleteAccEmailTxtCtl.text,
        password: deleteAccPasswordTxtCtl.text,
      );
      if (accDeleteResponse['success'] == true) {
        deleteAccEmailTxtCtl.clear();
        deleteAccPasswordTxtCtl.clear();

        //Get.back();
   Get.offAllNamed(RoutesName.splashPage);

      } else {
        eCustomToast(message: accDeleteResponse['message'] ?? '');
        Get.back();
        Get.snackbar(
          eValidationError.tr,
          accDeleteResponse['message'] ?? '',
          backgroundColor: eRedAccentColor,
          colorText: eWhiteCLR,
        );
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  void resetAccountDeleteField(){
    deleteAccEmailTxtCtl.clear();
    deleteAccPasswordTxtCtl.clear();
    update();
  }

}