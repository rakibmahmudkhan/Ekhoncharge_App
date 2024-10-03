import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget eMenuTitle(AppSystemController logic,
    {String? title, IconData? arrow, Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(eMPaMa),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!.tr,
            style: logic.isDarkTheme
                ? eDarkMediumTextStyleSTL
                : eLightMediumTextStyleSTL,
          ),
          Icon(
            arrow,
            size: 15,
            color: logic.isDarkTheme ? eDarkThemeBorderCLR : eHintCLR,
          )
        ],
      ),
    ),
  );
}

Widget eThemeTitle(AppSystemController logic, BuildContext context,
    {String? title}) {
  return Padding(
    padding: const EdgeInsets.all(eMPaMa),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!.tr,
          style: logic.isDarkTheme
              ? eDarkMediumTextStyleSTL
              : eLightMediumTextStyleSTL,
        ),
        Switch(
          activeColor: eDPrimaryCLR,

          value: logic.isDarkTheme,
          onChanged: (newValue) {
            logic.changeTheme(context);
          },
        ),
      ],
    ),
  );
}

Widget eLanguageTitle(AppSystemController logic, BuildContext context,
    {String? title}) {
  return Padding(
    padding: const EdgeInsets.all(eMPaMa),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!.tr,
          style: logic.isDarkTheme
              ? eDarkMediumTextStyleSTL
              : eLightMediumTextStyleSTL,
        ),
        ToggleButtons(
          isSelected: logic.isLanSelected,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          onPressed: (int index) {
            logic.selectedLanguage(index);
          },
          children: [
            Text(
              'EN',
              style: logic.isDarkTheme
                  ? eDarkMediumTextStyleSTL
                  : eLightMediumTextStyleSTL,
            ),
            Text(
              'বাংলা',
              style: logic.isDarkTheme
                  ? eDarkMediumTextStyleSTL
                  : eLightMediumTextStyleSTL,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget eVersionTitle(AppSystemController logic,
    {String? title, String? versionNumber}) {
  return Padding(
    padding: const EdgeInsets.all(eMPaMa),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!.tr,
          style: logic.isDarkTheme
              ? eDarkMediumTextStyleSTL
              : eLightMediumTextStyleSTL,
        ),
        Text(
          versionNumber!.tr,
          style: logic.isDarkTheme
              ? eDarkMediumTextStyleSTL
              : eLightMediumTextStyleSTL,
        ),
      ],
    ),
  );
}
