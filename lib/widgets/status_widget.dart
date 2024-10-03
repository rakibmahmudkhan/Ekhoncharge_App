import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';

Widget eStatusByIdWidget(AppSystemController logic, int status) {
  Color color = eMWarningCLR;
  String title = '';
  if (status == 1) {
    title = 'Active';
    color = eDSecondaryCLR;
  } else {
    title = 'In-Active';
    color = eLWarningCLR;
  }
  return Container(
    margin: EdgeInsets.zero,
    padding: const EdgeInsets.symmetric(
      horizontal: eMPaMa,
      vertical: 2,
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(eSPaMa),
    ),
    child: Text(
      title,
      style: logic.isDarkTheme
          ? eDarkSmallTextStyleSTL.copyWith(
              color: eWhiteCLR,
            )
          : eLightSmallTextStyleSTL.copyWith(
              color: eWhiteCLR,
            ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget eStatusByNameWidget(AppSystemController logic, String status) {
  Color color = eMWarningCLR;
  if (status == 'Active') {
    color = eDSecondaryCLR;
  } else {
    color = eLWarningCLR;
  }
  return Container(
    margin: EdgeInsets.zero,
    padding: const EdgeInsets.symmetric(
      horizontal: eMPaMa,
      vertical: 2,
    ),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(eSPaMa),
    ),
    child: Text(
      status,
      style: logic.isDarkTheme
          ? eDarkSmallTextStyleSTL.copyWith(
              color: eWhiteCLR,
            )
          : eLightSmallTextStyleSTL.copyWith(
              color: eWhiteCLR,
            ),
      textAlign: TextAlign.center,
    ),
  );
}
