 import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget eDatePicker(String title, {Function()? onPressed, TextStyle? txtStyle,Color? bColor,Color? color}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      width: double.maxFinite,
      height: Get.height*0.055,
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 6,
      ),
      decoration:   BoxDecoration(
        color:color?? eWhiteCLR,
       border: Border.all(color: bColor ?? Colors.white),
       // color: eELSecondaryCLR,
        borderRadius: BorderRadius.all(
          Radius.circular(eSPaMa),
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: txtStyle),
            const Icon(
              Icons.calendar_month,
              size: eSmallIcon,
              color: eMPrimaryCLR,
            ),
          ],
        ),
      ),
    ),
  );
}
