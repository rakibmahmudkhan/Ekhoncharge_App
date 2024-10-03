import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/cupertino.dart';

Widget asteriskWidget(AppSystemController logic,
    {required String labelText, bool? isEnabled = true}) {
  return RichText(
    text: TextSpan(
      text: labelText,
      style: logic.isDarkTheme
          ? eDarkMediumTextStyleSTL
          : eLightMediumTextStyleSTL,
      children: [
        TextSpan(
          text: isEnabled == true ? ' *' : '',
          style: const TextStyle(
            color: eDWarningCLR,
            fontWeight: FontWeight.bold,
            fontSize: eSFontSize,
          ),
        )
      ],
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
  );
}
