import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/booking_controller.dart';

/*Widget eButton(AppSystemController logic,
    {Function()? onPressed,
    required String? title,
    TextStyle? style,
    Color, color}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: eELPaMaButton,
        vertical: eLPaMa,
      ),
      decoration: BoxDecoration(
        color: color ?? eDPrimaryCLR2,
        borderRadius: BorderRadius.circular(eMPaMa),
      ),
      child: Text(
        title!.tr,
        style: style ?? eLightBtnTextStyleSTL,
        textAlign: TextAlign.center,
      ),
    ),
  );
}*/
Widget eButton(
    AppSystemController logic, {
      Function()? onPressed,
      required String? title,
      TextStyle? style,
      Color? color,
    }) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: eELPaMaButton,
        vertical: eLPaMa,
      ),
      decoration: BoxDecoration(
        color: color ?? eDPrimaryCLR2,
        borderRadius: BorderRadius.circular(eMPaMa),
      ),
      child: Text(
        title!.tr,
        style: style ?? eLightBtnTextStyleSTL,
        textAlign: TextAlign.center,
      ),
    ),
  );
}


Widget eLoginButton({Function()? onPressed, String? title}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: eELPaMaButton,
        vertical: eLPaMa,
      ),
      decoration: BoxDecoration(
        color: eDPrimaryCLR2,
        borderRadius: BorderRadius.circular(eMPaMa),
      ),
      child: Text(
        title!.tr,
        style: eLightBtnTextStyleSTL,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget eWelcomeButton(AppSystemController logic,
    {Function()? onPressed,
    required String? title,
    TextStyle? style,
    double? borderWidth,
    double? width}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width ?? Get.width * 0.67,
      padding: EdgeInsets.symmetric(
        horizontal: eELPaMaButton,
        vertical: eMPaMa,
      ),
      decoration: BoxDecoration(
          color: eCardColor,
          borderRadius: BorderRadius.circular(eMPaMa),
          border: Border.all(color: eDPrimaryCLR2, width: borderWidth ?? 1)),
      child: Text(
        title!.tr,
        style: style ?? eLightBtnTextStyleSTL,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget eStationDetailsButton(
  AppSystemController logic, {
  Function()? onPressed,
  required String? title,
  TextStyle? style,
  double? borderWidth,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(

      padding: EdgeInsets.symmetric(
        horizontal: eELPaMaButton,
        vertical: eMPaMa,
      ),
      decoration: BoxDecoration(
          color: eCardColor,
          borderRadius: BorderRadius.circular(eMPaMa),
          border: Border.all(color: eDPrimaryCLR2, width: borderWidth ?? 1)),
      child: Text(
        title!.tr,
        style: style ?? eLightBtnTextStyleSTL,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget roundIconButton(AppSystemController logic,
    {Function()? onPressed, IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 6.0,
      vertical: 4.0,
    ),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: logic.isDarkTheme ? eDarkThemeIconCLR : eBlackCLR,
          ),
          // Set the desired color for the circle
        ),
        child: Icon(
          icon,
          color: logic.isDarkTheme ? eDarkThemeIconCLR : eBlackCLR,
          size: 16,
        ),
      ),
    ),
  );
}

/*Widget roundDateButton(
    BookingController bookingController, AppSystemController logic,
    {Function()? onPressed, String? date}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 6.0,
      vertical: 6.0,
    ),
    child: Obx(
      () => InkWell(
        onTap: () {

          bookingController.onDateButtonTap(date!);
        },
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
              width:  1,
              color: bookingController.isDateSelected(date!)
                  ? eDPrimaryCLR2
                  : logic.isDarkTheme
                      ? eDarkThemeIconCLR
                      : eBlackCLR,
            ),
            borderRadius: BorderRadius.circular(4),
            color: logic.isDarkTheme
                ? bookingController.isDateSelected(date)
                    ? Colors.green.withOpacity(0.2)
                    : eCardColor
                : bookingController.isDateSelected(date)
                    ? Colors.green.withOpacity(0.2)
                    : eLightThemeBorderCLR,
          ),
          child: Center(
            child: Text(
              date,
              style: logic.isDarkTheme
                  ? bookingController.isDateSelected(date)
                      ? eLightBtnTextStyleSTL
                      : eLightBtnTextStyleSTL.copyWith(color: eHintCLR)
                  : bookingController.isDateSelected(date)
                      ? eLightBtnTextStyleSTL.copyWith(color: eBlackCLR)
                      : eLightBtnTextStyleSTL.copyWith(color: eHintCLR),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );
}*/
