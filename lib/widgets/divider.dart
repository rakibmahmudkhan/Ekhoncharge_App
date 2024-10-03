import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/material.dart';

Widget eDivider(AppSystemController logic, {double? thickness}) {
  return Divider(
    color: logic.isDarkTheme ? eDarkThemeBorderCLR : eLightThemeBorderCLR,
    thickness: thickness,
  );
}
