import 'dart:async';

import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/repository/forgot_password_repository.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final forgotPassRepo = ForgotPasswordRepository();

  final forgotPassPhoneTxtCtl = TextEditingController();
  final forgotPasswordTxtCtl = TextEditingController();
  final forgotPasswordConfirmTxtCtl = TextEditingController();

  final otp1TxtCtl = TextEditingController();
  final otp2TxtCtl = TextEditingController();
  final otp3TxtCtl = TextEditingController();
  final otp4TxtCtl = TextEditingController();
  final _start = 60.obs;
  Timer? _timer;

  final _obscureForgotPassPasswordText = true.obs;
  final _obscureForgotPassConfirmPasswordText = true.obs;

  get obscureForgotPassPasswordText => _obscureForgotPassPasswordText.value;

  set obscureForgotPassPasswordText(value) {
    _obscureForgotPassPasswordText.value = value;
    update();
  }

  get obscureForgotPassConfirmPasswordText =>
      _obscureForgotPassConfirmPasswordText.value;

  set obscureForgotPassConfirmPasswordText(value) {
    _obscureForgotPassConfirmPasswordText.value = value;
    update();
  }

  int get start => _start.value;

  set start(int value) {
    _start.value = _start.value - value;
    update();
  }

  void resetStart() {
    _start.value = 60;
  }

  Future<void> validateOtpForm() async {
    if (otp1TxtCtl.text.trim().isEmpty ||
        otp2TxtCtl.text.trim().isEmpty ||
        otp3TxtCtl.text.trim().isEmpty ||
        otp4TxtCtl.text.trim().isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please enter otp',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } else {
      await postOtpVerifyAPI();
    }
  }

  Future<void> postOtpVerifyAPI() async {
    eProgressLoader();
    try {
      var confirmOtpResponse = await forgotPassRepo.otpVerifyAPIRepo(
        phone: forgotPassPhoneTxtCtl.text,
        otp:
            '${otp1TxtCtl.text}${otp2TxtCtl.text}${otp3TxtCtl.text}${otp4TxtCtl.text}',
      );
      if (confirmOtpResponse['success'] == true) {
        Get.toNamed(
          RoutesName.forgotPasswordPage,
        );
      } else {
        Get.back();
        Get.snackbar(
          'Validation Error',
          confirmOtpResponse['message'] ?? '',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  Future<void> validatePhoneNumberForm() async {

    if (forgotPassPhoneTxtCtl.text.trim().isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please enter your Phone Number',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } else if (forgotPassPhoneTxtCtl.text.length != 11) {
      Get.snackbar(
        'Validation Error',
        'Phone Number must be 11 digit long.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } else {
      await postUserForgotPassByPhoneNumberAPIRepo();
    }
  }

  Future<void> postUserForgotPassByPhoneNumberAPIRepo() async {
    eProgressLoader();
    try {
      var otpResponse = await forgotPassRepo.userForgotPassByPhoneNumberAPIRepo(
          phone: forgotPassPhoneTxtCtl.text);
      if (otpResponse['success'] == true) {
        Get.toNamed(
          RoutesName.otpVerifyForgotPasswordPage,
        );
      } else {
        Get.back();
        Get.snackbar(
          'Validation Error',
          otpResponse['message'] ?? '',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }
  Future<void> userSetNewPassword() async {
    if (!validateNewPasswordForms()) {

      return;
    }

    try {
      eProgressLoader();
      var seNewPasswordResponse = await forgotPassRepo.changeForgotPasswordAPIRepo(
        phone: forgotPassPhoneTxtCtl.text,
        new_password: forgotPasswordTxtCtl.text,
        new_password_confirmation: forgotPasswordConfirmTxtCtl.text,

      );
      if ((seNewPasswordResponse['success'] == true)) {
        Get.back();
        eCustomToast(message: seNewPasswordResponse['message']);
        Get.offAllNamed(RoutesName.loginPage);
      } else {
        Get.back();
        Get.snackbar(
            'Validation Error',
            seNewPasswordResponse['message'] != null
                ? seNewPasswordResponse['message']
                : seNewPasswordResponse['error'],
            backgroundColor: Colors.redAccent,
            colorText: eWhiteCLR);
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }


  bool validateNewPasswordForms() {
    if (forgotPasswordTxtCtl.text.isEmpty

    ) {
      Get.snackbar(
        'Validation Error',
        'Please fill in the New Password fields.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    } else if (forgotPasswordConfirmTxtCtl.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Please fill in  the New Confirm Password fields.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }


    if (forgotPasswordTxtCtl.text.length < 8) {
      Get.snackbar(
        'Validation Error',
        'New Password must be at least 8 characters long.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }
    if (forgotPasswordConfirmTxtCtl.text.length < 8) {
      Get.snackbar(
        'Validation Error',
        'Confirm Password must be at least 8 characters long.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }
    if (forgotPasswordTxtCtl.text != forgotPasswordConfirmTxtCtl.text) {
      Get.snackbar(
        'Validation Error',
        'Password and Confirm Password must match.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  void resetOTPPage() {
    otp1TxtCtl.clear();
    otp2TxtCtl.clear();
    otp3TxtCtl.clear();
    otp4TxtCtl.clear();
  }
  void resetPhoneNumber() {
    forgotPassPhoneTxtCtl.clear();
    update();

  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start = 1;
        }
      },
    );
  }

  void disposeTimer() {
    _timer?.cancel();
  }
}
