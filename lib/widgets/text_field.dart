import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget eGeneralTextFiled({
  IconData? prefix,
  Widget? suffixWidget,
  TextEditingController? txtController,
  Function(String newTxt)? onSubmitted,
  TextInputType? inputType,
  String? hint,
  String? errorText,
  bool? obscureText,
}) {
  return TextField(
    keyboardType: inputType,
    onSubmitted: onSubmitted,
    controller: txtController,
    style: eLightMediumTextStyleSTL,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      hintStyle: eLightMediumHintSTL,
      contentPadding: const EdgeInsets.all(eMPaMa),
      fillColor: eWhiteCLR,
      filled: true,
      prefixIcon: Icon(
        prefix,
        size: eSmallIcon,
        color: eDSecondaryCLR,
      ),
      suffixIcon: suffixWidget,
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: eDarkThemeBorderCLR,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: eDSecondaryCLR,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintText: hint ?? '',
      errorText: errorText,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: eDSecondaryCLR,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: eDSecondaryCLR, //this has no effect
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

Widget eCustomTextFormField(TextEditingController txtController,
    {double? height,
    TextInputType? inputType,
    bool? isEnabled = true,
    String? hint = ''}) {
  return Container(
    height: height ?? eDropDownCustomSize,
    decoration: const BoxDecoration(
      // color: eWhiteCLR,
      color: eELSecondaryCLR,
      borderRadius: BorderRadius.all(
        Radius.circular(eSPaMa),
      ),
    ),
    child: TextField(
      enabled: isEnabled,
      controller: txtController,
      keyboardType: inputType,
      style: eLightMediumTextStyleSTL,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        contentPadding:
            EdgeInsets.only(left: eMPaMa, right: eMPaMa, bottom: eMPaMa),
        counterText: "",
      ),
    ),
  );
}

Widget eSearchTextFiled(
  TextEditingController txtController, {
  TextStyle? style,
  TextStyle? hintStyle,
  double? height,
  TextInputType? inputType,
  String? hint,
  double? focusBorderRadius,
  double? enableBorderRadius,
  Color? colorr,
  Color? enableColor,
  Color? focusColor,
  Widget? suffixWidget,
  Widget? prefixWidget,
  String? labelText,

  Function(String newTxt)? onSubmitted,
  Function(String newTxt)? omOChanged,
}) {
  return Container(
    height: height ?? eDropDownCustomSize,
    decoration: const BoxDecoration(
      // color: eWhiteCLR,
      color: eDSecondPrimaryCLR,
      borderRadius: BorderRadius.all(
        Radius.circular(eSPaMa),
      ),
    ),
    child: TextField(
      controller: txtController,
      keyboardType: inputType,
      style: style ?? eLightMediumTextStyleSTL,
      onSubmitted: onSubmitted,
      onChanged: omOChanged,
      decoration: InputDecoration(
        hintStyle: hintStyle ?? eLightMediumHintSTL,
        hintText: hint ?? '',
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: focusColor ?? eDPrimaryCLR2),
            borderRadius: BorderRadius.circular(focusBorderRadius ?? 12)),
        filled: true,
        fillColor: colorr ?? eDSecondPrimaryCLR,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: enableColor ?? eWhiteCxLR),
            borderRadius: BorderRadius.circular(enableBorderRadius ?? 12)),
        labelText: labelText ?? 'Search by Brand Name',
        labelStyle: eLightBtnTextStyleSTL,
        contentPadding:
            const EdgeInsets.only(left: eMPaMa, right: eMPaMa, top: eSPaMa),
        counterText: "",
      ),
    ),
  );
}


Widget eNewTextFiled(
    TextEditingController txtController, {
      TextStyle? style,
      TextStyle? hintStyle,
      double? height,
      TextInputType? inputType,
      List<TextInputFormatter>? inputFormatters,
      String? hint,
      double? focusBorderRadius,
      double? enableBorderRadius,

      Color? colorr,
      Color? enableColor,
      Color? focusColor,

      Widget? suffixWidget,
      Widget? prefixWidget,
      String? labelText,
      bool? obscureText,
      Function(String newTxt)? onSubmitted,
      Function(String newTxt)? omOChanged,
    //  String? helperText,

    //  TextStyle? helperStyle,
    }) {
  return Container(
    height: height ?? eDropDownCustomSize,
    decoration: const BoxDecoration(

      // color: eWhiteCLR,
      //color: eDSecondPrimaryCLR,
      borderRadius: BorderRadius.all(
        Radius.circular(eSPaMa),
      ),
    ),
    child: TextField(
      controller: txtController,
      keyboardType: inputType,
      inputFormatters: inputFormatters,

      style: style  ,
      onSubmitted: onSubmitted,
      onChanged: omOChanged,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintStyle: hintStyle ,
        hintText: hint ?? '',

        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(width: 1, color: focusColor ! ),
            borderRadius: BorderRadius.circular(focusBorderRadius ?? eSPaMa)),
        filled: true,
        fillColor: colorr  ,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: enableColor! ),
            borderRadius: BorderRadius.circular(enableBorderRadius ?? eSPaMa)),
        labelText: labelText ?? null,
        labelStyle: eLightBtnTextStyleSTL,
        contentPadding:
        const EdgeInsets.only(left: eMPaMa, right: eMPaMa, top: eSPaMa),
        counterText: "",
       // helperText: helperText??"",
       // helperStyle: helperStyle,
      ),
    ),
  );
}


Widget eValueNumberTextField(String? value,AppSystemController logic,{  String? hint, }){
  return TextField(
    cursorColor:
    logic.isDarkTheme
        ? eWhiteCLR
        : eBlackCLR,
    decoration:
    InputDecoration(
      fillColor:
      logic.isDarkTheme
          ? eCardColor
          : eWhiteCLR,
      filled: true,
      hintText: hint ,
      hintStyle: logic.isDarkTheme?eDarkExtraSmallTextStyleSTL.copyWith(color: eHintCLR):eLightExtraSmallTextStyleSTL.copyWith(color: eHintCLR),
      border: OutlineInputBorder(
          borderSide: BorderSide(
              color: logic
                  .isDarkTheme
                  ? eCardColor
                  : eLightThemeBorderCLR,
              width: 1)),
      enabledBorder:
      UnderlineInputBorder(
        borderSide: BorderSide(
            color: logic
                .isDarkTheme
                ? eCardColor
                : eLightThemeBorderCLR,
            width: 1),
      ),
      focusedBorder:
      UnderlineInputBorder(
        borderSide: BorderSide(
            color: logic
                .isDarkTheme
                ? eCardColor
                : eLightThemeBorderCLR,
            width: 1),
      ),
    ),
    keyboardType:
    TextInputType.number,
    onChanged: (value) {
      value = value;
    },
  );
}