import 'dart:async';
import 'dart:convert';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/repository/authentication_repository.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../models/user_model.dart';

class AuthController extends GetxController {
  final authRepository = AuthRepository();
  final _userModel = UserModel().obs;
  final loginEmailTxtCtl = TextEditingController();
  final loginPasswordTxtCtl = TextEditingController();
  final _obscureSigninPasswordText = true.obs;
  final _obscureSignupPasswordText = true.obs;
  final _obscureSignupConfirmPasswordText = true.obs;
  final LocalAuthentication auth = LocalAuthentication();
  final _canCheckBiometrics = false.obs;
  final _authorized = 'Not Authorized'.obs;
  final _isAuthenticating = false.obs;
  final _supportState = false.obs;
  final signUpNameTxtCtl = TextEditingController();
  final signUpEmailTxtCtl = TextEditingController();
  final signUpPhoneTxtCtl = TextEditingController();
  final signUpPasswordTxtCtl = TextEditingController();
  final signUpConfirmPasswordTxtCtl = TextEditingController();

  final couponTxtCtl = TextEditingController();

  final otp1TxtCtl = TextEditingController();
  final otp2TxtCtl = TextEditingController();
  final otp3TxtCtl = TextEditingController();
  final otp4TxtCtl = TextEditingController();
  final _start = 60.obs;
  Timer? _timer;

  final _isAnimation = false.obs;
  final _isBalanceShown = false.obs;
  final _isBalance = true.obs;

  get isBalanceShown => _isBalanceShown.value;

  set isBalanceShown(value) {
    _isBalanceShown.value = value;
    update();
  }

  get isAnimation => _isAnimation.value;

  set isAnimation(value) {
    _isAnimation.value = value;
    update();
  }

  get isBalance => _isBalance.value;

  set isBalance(value) {
    _isBalance.value = value;
    update();
  }

  get isAuthenticating => _isAuthenticating.value;

  set isAuthenticating(value) {
    _isAuthenticating.value = value;
    update();
  }

  String get authorized => _authorized.value;

  set authorized(value) {
    _authorized.value = value;
    update();
  }

  get canCheckBiometrics => _canCheckBiometrics.value;

  set canCheckBiometrics(value) {
    _canCheckBiometrics.value = value;
  }

  get supportState => _supportState.value;

  set supportState(value) {
    _supportState.value = value;
  }

  int get start => _start.value;

  set start(int value) {
    _start.value = _start.value - value;
    update();
  }

  void resetStart() {
    _start.value = 60;
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

  get obscureSignupConfirmPasswordText =>
      _obscureSignupConfirmPasswordText.value;

  set obscureSignupConfirmPasswordText(value) {
    _obscureSignupConfirmPasswordText.value = value;
    update();
  }

  get obscureSignupPasswordText => _obscureSignupPasswordText.value;

  set obscureSignupPasswordText(value) {
    _obscureSignupPasswordText.value = value;
    update();
  }

  get obscureSigninPasswordText => _obscureSigninPasswordText.value;

  set obscureSigninPasswordText(value) {
    _obscureSigninPasswordText.value = value;
    update();
  }

  UserModel get userModel => _userModel.value;

  set userModel(value) {
    _userModel.value = value;
  }

  // Function to send the registration request
  Future<void> userRegister() async {
    if (!validateRegistrationForms()) {
      /*Get.snackbar('Validation Error', 'Please check the provided information.',
          backgroundColor: Colors.redAccent, colorText: eWhiteCLR);*/
      return;
    }

    try {
      eProgressLoader();
      var loginResponse = await authRepository.postRegister(
        name: signUpNameTxtCtl.text,
        email: signUpEmailTxtCtl.text,
        phone: signUpPhoneTxtCtl.text,
        password: signUpPasswordTxtCtl.text,
        passwordConfirmation: signUpConfirmPasswordTxtCtl.text,
      );
      if ((loginResponse['success'] == true)) {
        Get.back();
        eCustomToast(message: loginResponse['message']);
        Get.toNamed(RoutesName.otpVerifyPage);
      } else {
        Get.back();
        Get.snackbar(
            eValidationError.tr,
            loginResponse['message'] != null
                ? loginResponse['message']
                : loginResponse['error'],
            backgroundColor: eRedAccentColor,
            colorText: eWhiteCLR);
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  // Function to validate input fields
  bool validateRegistrationForms() {
    if (signUpNameTxtCtl.text.isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eFillNameField.tr,
        backgroundColor: eRedAccentColor,
        colorText:eWhiteCLR,
      );
      return false;
    } else if (signUpEmailTxtCtl.text.isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eFillEmailField.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    } else if (signUpPhoneTxtCtl.text.isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eFillPhoneField.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    } else if (signUpPasswordTxtCtl.text.isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eFillPasswordField.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    } else if (signUpConfirmPasswordTxtCtl.text.isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eFillRePasswordField.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }
    if (signUpNameTxtCtl.text.length < 3) {
      Get.snackbar(
        eValidationError.tr,
        eNameThreeCharacter.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }
    if (!isValidEmail(signUpEmailTxtCtl.text)) {
      Get.snackbar(
        eValidationError.tr,
        eEnterValidEmail.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }
    if (signUpPhoneTxtCtl.text.length != 11) {
      Get.snackbar(
        eValidationError.tr,
        eNumberElevenDigit.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }
    if (signUpPasswordTxtCtl.text.length < 8) {
      Get.snackbar(
        eValidationError.tr,
        ePasswordEightDigit.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }
    if (signUpConfirmPasswordTxtCtl.text.length < 8) {
      Get.snackbar(
        eValidationError.tr,
        eConfirmPasswordEightDigit.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }
    if (signUpConfirmPasswordTxtCtl.text != signUpPasswordTxtCtl.text) {
      Get.snackbar(
        eValidationError.tr,
        ePasswordAndConfirmPasswordSame.tr,
        backgroundColor:eRedAccentColor,
        colorText: eWhiteCLR,
      );
      return false;
    }
    return true;
  }

  Future<void> validateOtpForm() async {
    if (otp1TxtCtl.text.trim().isEmpty ||
        otp2TxtCtl.text.trim().isEmpty ||
        otp3TxtCtl.text.trim().isEmpty ||
        otp4TxtCtl.text.trim().isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eEnterOtp.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
    } else {
      await postOtpVerifyAPI();
    }
  }

  Future<void> directPostRegisterAPI() async {
    eProgressLoader();
    try {
      var loginResponse = await authRepository.postRegister(
        name: signUpNameTxtCtl.text,
        email: signUpEmailTxtCtl.text,
        phone: signUpPhoneTxtCtl.text,
        password: signUpPasswordTxtCtl.text,
        passwordConfirmation: signUpConfirmPasswordTxtCtl.text,
      );
      if (loginResponse['success'] == true) {
        eCustomToast(message: loginResponse['message']);
      } else {
        Get.snackbar(eValidationError.tr, loginResponse['error'] ?? '',
            backgroundColor:eRedAccentColor, colorText: eWhiteCLR);
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      resetStart();
      startTimer();
    }
  }

  Future<void> postOtpVerifyAPI() async {
    eProgressLoader();
    try {
      var loginResponse = await authRepository.otpVerifyAPIRepo(
        phone: signUpPhoneTxtCtl.text,
        otp:
            '${otp1TxtCtl.text}${otp2TxtCtl.text}${otp3TxtCtl.text}${otp4TxtCtl.text}',
      );
      if (loginResponse['success'] == true) {
        userModel = UserModel.fromJson(loginResponse);
        PreferenceUtils.setString(eToken, userModel.accessToken ?? '');
        PreferenceUtils.setInt(eUsedId, userModel.user?.id ?? 0);
        PreferenceUtils.setString(eEmail, userModel.user?.email ?? '');
        PreferenceUtils.setString(eName, userModel.user?.name ?? '');
        PreferenceUtils.setString(
            eTitle, userModel.user?.customer?.title ?? '');
        PreferenceUtils.setString(ePhoto, userModel.user?.imagePath ?? '');
        PreferenceUtils.setBool(eIsLoggedIn, true);
        Get.find<HomeController>().selectedNavIndexWithoutUpdate = 0;
        Get.toNamed(
          RoutesName.vehicleSetupPage,
          arguments: {
            'successMessage': '',
          },
        );
      } else {
        Get.back();
        Get.snackbar(
          eValidationError.tr,
          loginResponse['message'] ?? '',
          backgroundColor: eRedAccentColor,
          colorText: eWhiteCLR,
        );
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  Future<void> validateLoginForm() async {

    if (loginEmailTxtCtl.text.trim().isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eEnterEmail.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
    } else if (loginPasswordTxtCtl.text.trim().isEmpty) {
      Get.snackbar(
        eValidationError.tr,
        eEnterPassword.tr,
        backgroundColor: eRedAccentColor,
        colorText: eWhiteCLR,
      );
    } else if (loginPasswordTxtCtl.text.length < 8) {
      Get.snackbar(
        eValidationError.tr,
        ePasswordEightDigit.tr,
        backgroundColor:eRedAccentColor,
        colorText: eWhiteCLR,
      );
    } else {
      await postLoginController();
    }
  }

  Future<void> postWalletCreateController() async {
    eProgressLoader();
    try {
      var walletCreateResponse = await authRepository.walletCreateAPIRepo(
          customerId: PreferenceUtils.getInt(eCustomerId));
      if (walletCreateResponse['success'] == true) {
        Get.find<HomeController>().selectedNavIndexWithoutUpdate = 0;
        await Future.delayed(const Duration(milliseconds: 1));
        Get.offAllNamed(RoutesName.home);
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  Future<void> postLoginController() async {
    eProgressLoader();
    try {
      var loginResponse = await authRepository.loginAPIRepo(
        login: loginEmailTxtCtl.text,
        password: loginPasswordTxtCtl.text,
      );
      if (loginResponse['success'] == true) {
        loginEmailTxtCtl.clear();
        loginPasswordTxtCtl.clear();
        userModel = UserModel.fromJson(loginResponse);
        PreferenceUtils.setString(eToken, userModel.accessToken ?? '');
        PreferenceUtils.setInt(eUsedId, userModel.user?.id ?? 0);
        PreferenceUtils.setString(eEmail, userModel.user?.email ?? '');
        PreferenceUtils.setString(eName, userModel.user?.name ?? '');
        PreferenceUtils.setString(
            eTitle, userModel.user?.customer?.title ?? '');
        PreferenceUtils.setInt(eCustomerId, userModel.user?.customer?.id ?? 0);
        PreferenceUtils.setString(ePhoto, userModel.user?.imagePath ?? '');
        //SET VEHICLE VALUES IN SHARE-PREFERENCE
        PreferenceUtils.setString(
            eVehiclesJson, jsonEncode(userModel.vehicles));
        PreferenceUtils.setBool(eIsLoggedIn, true);
        PreferenceUtils.setBool(
            eIsVehicleUpdated, userModel.isVehicleUpdate ?? false);
        PreferenceUtils.setBool(
            eIsWalletUpdated, userModel.isWalletUpdate ?? false);
        Get.back();

        if (userModel.isVehicleUpdate == true) {
          if (userModel.isWalletUpdate == true) {
            Get.find<HomeController>().selectedNavIndexWithoutUpdate = 0;
            await Future.delayed(const Duration(milliseconds: 1));
            Get.offAllNamed(RoutesName.home);
          } else {
            Get.offAllNamed(RoutesName.walletCreatePage);
          }
        } else {
          Get.toNamed(
            RoutesName.vehicleSetupPage,
            arguments: {
              'successMessage': '',
            },
          );
        }
      } else {
        eCustomToast(message: loginResponse['message'] ?? '');
        Get.back();
        Get.snackbar(
          eValidationError.tr,
          loginResponse['message'] ?? '',
          backgroundColor: eRedAccentColor,
          colorText: eWhiteCLR,
        );
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  Future<void> fetchLoginAPIWithBioMetric() async {
    eProgressLoader();
    try {
      var loginResponse = await authRepository.refreshTokenAPI();
      if (loginResponse['success'] == true) {
        userModel = UserModel.fromJson(loginResponse);
        PreferenceUtils.setString(eToken, userModel.accessToken ?? '');
        PreferenceUtils.setInt(eUsedId, userModel.user?.id ?? 0);
        PreferenceUtils.setString(eEmail, userModel.user?.email ?? '');
        PreferenceUtils.setString(eName, userModel.user?.name ?? '');
        PreferenceUtils.setString(
            eTitle, userModel.user?.customer?.title ?? '');
        PreferenceUtils.setString(ePhoto, userModel.user?.imagePath ?? '');
        //SET VEHICLE VALUES IN SHARE-PREFERENCE
        PreferenceUtils.setString(
            eVehiclesJson, jsonEncode(userModel.vehicles));
        PreferenceUtils.setBool(eIsLoggedIn, true);
        PreferenceUtils.setBool(
            eIsVehicleUpdated, userModel.isVehicleUpdate ?? false);
        PreferenceUtils.setBool(
            eIsVehicleUpdated, userModel.isWalletUpdate ?? false);
        Get.back();
        if (userModel.isVehicleUpdate == true) {
          if (userModel.isWalletUpdate == true) {
            Get.find<HomeController>().selectedNavIndexWithoutUpdate = 0;
            await Future.delayed(const Duration(milliseconds: 1));
            Get.offAllNamed(RoutesName.home);
          } else {
            Get.offAllNamed(RoutesName.walletCreatePage);
          }
        } else {
          Get.toNamed(
            RoutesName.vehicleSetupPage,
            arguments: {
              'successMessage': '',
            },
          );
        }
      } else {
        Get.back();
        Get.snackbar(
          eValidationError.tr,
          loginResponse['message'] ?? '',
          backgroundColor: eRedAccentColor,
          colorText: eWhiteCLR,
        );
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  void isDeviceSupported() async {
    try {
      bool isSupported = await auth.isDeviceSupported();
      supportState = isSupported;
      await checkBiometrics();
    } on PlatformException catch (e) {
      ePrintWrapped(e.message ?? '');
    } finally {
      update();
    }
  }

  Future<void> checkBiometrics() async {
    try {
      bool mCanCheckBiometrics = await auth.canCheckBiometrics;
      canCheckBiometrics = mCanCheckBiometrics;
    } on PlatformException catch (e) {
      ePrintWrapped(e.toString());
      canCheckBiometrics = false;
    }
  }

  Future<void> authenticateWithBiometrics() async {
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';
      bool authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      isAuthenticating = false;
      authorized = authenticated ? 'Authorized' : 'Not Authorized';
      if (authenticated) {
        fetchLoginAPIWithBioMetric();
      }
    } on PlatformException catch (e) {
      isAuthenticating = false;
      authorized = 'Error - ${e.message}';
      return;
    }
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
    isAuthenticating = false;
  }

  void resetSignUpPage() {
    signUpEmailTxtCtl.clear();
    signUpPhoneTxtCtl.clear();
    signUpNameTxtCtl.clear();
    signUpPasswordTxtCtl.clear();
    signUpConfirmPasswordTxtCtl.clear();
  }

  void resetOTPPage() {
    otp1TxtCtl.clear();
    otp2TxtCtl.clear();
    otp3TxtCtl.clear();
    otp4TxtCtl.clear();
  }

  void setCacheData() {
    String json = PreferenceUtils.getString(eVehiclesJson) ?? '';
    UserModel? mUserModel;

    // IF SHAREDPREF HAS DATA
    if (json.isNotEmpty) {
      mUserModel = UserModel.fromJsonVehicle(jsonDecode(json));
    }

    _userModel.value = UserModel(
      accessToken: PreferenceUtils.getString(eToken) ?? '',
      user: User(
          name: PreferenceUtils.getString(eName) ?? '',
          email: PreferenceUtils.getString(eEmail) ?? '',
          imagePath: PreferenceUtils.getString(ePhoto) ?? '',
          customer: Customer(
            title: PreferenceUtils.getString(eTitle) ?? '',
          )),
      vehicles: mUserModel != null ? mUserModel.vehicles : [],
    );
  }

  // Function to validate email format
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  void animate() async {
    if (isAnimation == false) {
      _isAnimation.value = true;
      _isBalance.value = false;
      update();

      await Future.delayed(
          const Duration(milliseconds: 800), () => isBalanceShown = true);
      await Future.delayed(
          const Duration(seconds: 3), () => isBalanceShown = false);
      await Future.delayed(
          const Duration(milliseconds: 200), () => isAnimation = false);
      await Future.delayed(
          const Duration(milliseconds: 800), () => isBalance = true);
    }
  }
}
