import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';

Widget eRadioButton(AppSystemController logic, String titleP, String titleN,
    {bool? isActiveP,
    Function(dynamic)? onChangedP,
    bool? isActiveN,
    Function(dynamic)? onChangedN}) {
  return Row(
    children: [
      Expanded(
        child: Theme(
          data: ThemeData(unselectedWidgetColor: eELSecondaryCLR),
          child: RadioListTile(
            value: isActiveP,
            contentPadding: EdgeInsets.zero,
            tileColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            activeColor: eDPrimaryCLR,
            groupValue: true,
            onChanged: onChangedP,
            title: Text(
              titleP,
              style: logic.isDarkTheme
                  ? eDarkMediumTextStyleSTL
                  : eLightMediumTextStyleSTL,
            ),
          ),
        ),
      ),
      Expanded(
        child: Theme(
          data: ThemeData(unselectedWidgetColor: eELSecondaryCLR),
          child: RadioListTile(
            value: isActiveN,
            contentPadding: EdgeInsets.zero,
            tileColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            activeColor: eDPrimaryCLR,
            groupValue: true,
            onChanged: onChangedN,
            title: Text(
              titleN,
              style: logic.isDarkTheme
                  ? eDarkMediumTextStyleSTL
                  : eLightMediumTextStyleSTL,
            ),
          ),
        ),
      ),
    ],
  );
}
