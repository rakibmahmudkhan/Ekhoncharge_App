import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Widget eSectionTitle(AppSystemController logic, {String? title}) {
  return Padding(
    padding: const EdgeInsets.all(eMPaMa),
    child: Text(
      title!.tr,
      style: logic.isDarkTheme
          ? eDarkMediumTextStyleSTL
          : eLightMediumTextStyleSTL.copyWith(
              fontWeight: FontWeight.bold,
            ),
    ),
  );
}
