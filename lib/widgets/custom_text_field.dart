import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';

Widget eCustomTextBox(bool isDisable, String hint,
    {String? title, Function()? onPressed, IconData? suffix}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: eDropDownCustomSize,
      decoration: const BoxDecoration(
        // color: eWhiteCLR,
        color: eELSecondaryCLR,
        borderRadius: BorderRadius.all(
          Radius.circular(eSPaMa),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: eMPaMa),
        // child: DropdownButton<Customer>(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? hint,
              style: isDisable ? eLightMediumHintSTL : eLightMediumTextStyleSTL,
            ),
            Icon(
              suffix,
              size: eELPaMa,
            )
          ],
        ),
      ),
    ),
  );
}
