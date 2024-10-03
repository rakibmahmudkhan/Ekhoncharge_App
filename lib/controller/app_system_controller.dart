import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSystemController extends GetxController {
  final _isDarkTheme = PreferenceUtils.getBoolOnlyTheme(eIsDarkTheme).obs;
  final _isLanSelected = [true, false].obs;

  get isLanSelected => _isLanSelected;

  void setIsLanSelected() {
    String? kLan = PreferenceUtils.getString(eLanguage);
    _isLanSelected.clear();
    if (kLan == null || kLan == eEnLanguage) {
      _isLanSelected.add(true);
    } else {
      _isLanSelected.add(false);
    }
    if (kLan != null && kLan == eBnLanguage) {
      _isLanSelected.add(true);
    } else {
      _isLanSelected.add(false);
    }
  }

  get isDarkTheme => _isDarkTheme.value;

  set isDarkTheme(value) {
    _isDarkTheme.value = value;
    update();
  }

  void changeTheme(BuildContext context) {
    if (Get.isDarkMode) {
      isDarkTheme = false;
      PreferenceUtils.setBool(eIsDarkTheme, isDarkTheme);
      Get.changeTheme(ThemeData.light());
    } else {
      isDarkTheme = true;
      PreferenceUtils.setBool(eIsDarkTheme, isDarkTheme);
      Get.changeTheme(
        ThemeData.dark().copyWith(
          scaffoldBackgroundColor: eDPrimaryCLR3,
        ),
      );
    }
    update();
  }

  void selectedLanguage(int index) {
    String type = eEnLanguage;
    if (index == 0) {
      isLanSelected[0] = true;
      isLanSelected[1] = false;
      type = eEnLanguage;
    } else {
      isLanSelected[0] = false;
      isLanSelected[1] = true;
      type = eBnLanguage;
    }
    PreferenceUtils.setString(eLanguage, type);
    Get.updateLocale(Locale(type));
    update();
  }

  bool get isBengali => isLanSelected.last;
}
