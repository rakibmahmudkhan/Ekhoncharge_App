import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';

void eCustomDialog(
  AppSystemController logic, {
  BuildContext? context,
  String? titleText,
  String? detailsText,
  String? cancelText,
  String? confirmText,
  Function()? onConfirmTap,
}) {
  showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (ctxDialog) => AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: eELPaMa),
      titlePadding: const EdgeInsets.only(left: eMPaMa, top: eLPaMa),
      insetPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.only(top: eDELPaMa, bottom: eELPaMa),
      title: Padding(
        padding: const EdgeInsets.all(eLPaMa),
        child: Text(
          titleText!,
          style: logic.isDarkTheme
              ? eDarkMediumTitleStyleSTL
              : eLightMediumTitleStyleSTL,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(bottom: eMPaMa, left: eSPaMa),
        child: Text(
          detailsText!,
          style: logic.isDarkTheme
              ? eDarkMediumTextStyleSTL
              : eLightMediumTextStyleSTL,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: eDELPaMa),
                child: Text(
                  cancelText!,
                  style: logic.isDarkTheme
                      ? eDarkSmallTextStyleSTL
                      : eLightSmallTextStyleSTL,
                ),
              ),
            ),
            eRSmallSizedBox(),
            InkWell(
              onTap: onConfirmTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: eDELPaMa),
                child: Text(
                  confirmText!,
                  style: logic.isDarkTheme
                      ? eDarkSmallTextStyleSTL
                      : eLightSmallTextStyleSTL,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
