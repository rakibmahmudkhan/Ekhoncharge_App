import 'dart:io';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'pref_helper.dart';

void eLocalLogWriter(dynamic text) {
  if (kDebugMode) {
    print(text);
  }
}

void ePrintWrapped(String text) {
  if (kDebugMode) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}

void eLogout() {
  PreferenceUtils.setBool(eIsLoggedIn, false);
  PreferenceUtils.setString(eEmail, '');
  PreferenceUtils.setString(eName, '');
  PreferenceUtils.setString(eTitle, '');
  PreferenceUtils.setString(eVehiclesJson, '');
  Get.offAllNamed(RoutesName.splashPage);
  PreferenceUtils.setString(eToken, '');
  PreferenceUtils.setInt(eSelectedChargerId, 0 );
  PreferenceUtils.setInt(eSelectedConnectorId, 0 );
  PreferenceUtils.setInt(eCustomerId, 0 );
}

String eUrlToFileName(String? url) {
  if (url == null) {
    return '';
  } else {
    if (url.contains('/')) {
      return url.split('/').last;
    } else {
      return '';
    }
  }
}

Future<String> datePicker(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1950),
    lastDate: DateTime.now(),
  );
  return pickedDate.toString().substring(0, 10);


}

Future<String> dateExpiredPicker(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2050),
  );
  return pickedDate.toString().substring(0, 10);
}

Future<File> eCompressPhoto({
  required File image,
}) async {
  var path = await FlutterNativeImage.compressImage(
    image.absolute.path,
  );
  return path;
}
