import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/repository/change_password_repository.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final changePasswordRepo = ChangePasswordRepository();

  final oldChangePasswordTxtCtl = TextEditingController();
  final newChangePasswordTxtCtl = TextEditingController();
  final confirmChangePasswordTxtCtl = TextEditingController();

  final _obscureOldChangePasswordText = true.obs;
  final _obscureNewChangePasswordText = true.obs;
  final _obscureConfirmChangePasswordText = true.obs;

  get obscureOldChangePasswordText => _obscureOldChangePasswordText.value;

  set obscureOldChangePasswordText(value) {
    _obscureOldChangePasswordText.value = value;
    update();
  }

  get obscureNewChangePasswordText => _obscureNewChangePasswordText.value;

  set obscureNewChangePasswordText(value) {
    _obscureNewChangePasswordText.value = value;
    update();
  }

  get obscureConfirmChangePasswordText =>
      _obscureConfirmChangePasswordText.value;

  set obscureConfirmChangePasswordText(value) {
    _obscureConfirmChangePasswordText.value = value;
    update();
  }

  Future<void> userPasswordChange() async {
    if (!validateChangePasswordForms()) {
      return;
    }

    try {
      eProgressLoader();

      var changePasswordResponse =
          await changePasswordRepo.ChangePasswordAPIRepo(
        oldPassword: oldChangePasswordTxtCtl.text,
        newPassword: newChangePasswordTxtCtl.text,
        newConfirmPassword: confirmChangePasswordTxtCtl.text,
        id: PreferenceUtils.getInt(eUsedId) ?? 0,
      );
      if ((changePasswordResponse['success'] == true)) {
        oldChangePasswordTxtCtl.clear();
        newChangePasswordTxtCtl.clear();
        confirmChangePasswordTxtCtl.clear();
        eCustomToast(message: changePasswordResponse['message'] ?? '');
        Get.toNamed(RoutesName.home);
      } else {
        eCustomToast(message: changePasswordResponse['message'] ?? '');
        Get.back();
        Get.snackbar(
          'Validation Error',
          changePasswordResponse['message'] ?? '',
          backgroundColor: eRedAccentColor,
          colorText: eWhiteCLR,
        );
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  bool validateChangePasswordForms() {
    if (oldChangePasswordTxtCtl.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please fill in the Old Password fields.',
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    } else if (newChangePasswordTxtCtl.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please fill in the New password fields.',
        backgroundColor:eRedAccentColor,
        colorText:eWhiteCLR,
      );
      return false;
    } else if (confirmChangePasswordTxtCtl.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please fill in the confirm password fields.',
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }

    if (oldChangePasswordTxtCtl.text.length < 8) {
      Get.snackbar(
        'Validation Error',
        'Old password must be at least 8 characters long.',
        backgroundColor: Colors.redAccent,
        colorText: eWhiteCLR,
      );
      return false;
    }
    if (newChangePasswordTxtCtl.text.length < 8) {
      Get.snackbar(
        'Validation Error',
        'New password must be at least 8 characters long.',
        backgroundColor:eRedAccentColor,
        colorText:eWhiteCLR,
      );
      return false;
    }
    if (confirmChangePasswordTxtCtl.text.length < 8) {
      Get.snackbar(
        'Validation Error',
        'Confirm password must be at least 8 characters long.',
        backgroundColor:eRedAccentColor,
        colorText:eWhiteCLR,
      );
      return false;
    }

    if (newChangePasswordTxtCtl.text != confirmChangePasswordTxtCtl.text) {
      Get.snackbar(
        'Validation Error',
        'New Password and Confirm Password must match.',
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }
    return true;
  }
}
