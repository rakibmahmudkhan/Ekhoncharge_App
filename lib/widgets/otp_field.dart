import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';

Widget customOTPField(TextEditingController textEditingController,
    AppSystemController logic, BuildContext context,
    {bool? first, last}) {
  return SizedBox(
    height: eOtpBox,
    child: TextField(
      controller: textEditingController,
      autofocus: true,
      onChanged: (value) {
        if (value.length == 1 && last == false) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty && first == false) {
          FocusScope.of(context).previousFocus();
        }
      },
      showCursor: false,
      readOnly: false,
      textAlign: TextAlign.center,
      style: logic.isDarkTheme?eDarkELTextStyleSTL.copyWith(fontSize: eLFontSize, fontWeight: FontWeight.normal ):eLightSmallTxtStyleSTL,
      keyboardType: TextInputType.number,
      maxLength: 1,
      decoration: InputDecoration(
        counter: const Offstage(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: eSPaES,
                color: logic.isDarkTheme ? Colors.white : Colors.black12),
            borderRadius: BorderRadius.circular(eLPaMa)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: eSPaES,
            color: eMPrimaryCLR,
          ),
          borderRadius: BorderRadius.circular(eLPaMa),
        ),
      ),
    ),
  );
}
