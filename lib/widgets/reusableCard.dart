import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';

Widget reusableCard(AppSystemController logic,
    {String? title, dynamic value, String? extension}) {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0, left: 8, right: 8, bottom: 0),
    child: Card(
      color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: logic.isDarkTheme ? Colors
                .lightGreenAccent : eDPrimaryCLR2,
            width: 1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(6),
        child: Column(
          children: [
            Text(title!,
                style: logic.isDarkTheme
                    ? eDarkSmallTitleStyleSTL
                    : eLightSmallTitleStyleSTL),
            RichText(
              text: TextSpan(
                  text: "${value}",
                  style: logic.isDarkTheme
                      ? eDarkSmallTextStyleSTL
                      : eLightSmallTextStyleSTL,
                  children: [
                    TextSpan(
                        text: extension,
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL)
                  ]),
            )
          ],
        ),
      ),
    ),
  );
}
