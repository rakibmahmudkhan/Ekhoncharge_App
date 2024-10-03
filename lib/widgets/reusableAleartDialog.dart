import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/reusableActionButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future reusableAlertDialog(AppSystemController logic,
    {String? title,
      String? stationName,
      Widget? content,
      List<Widget>? action}) {
  return Get.defaultDialog(
    backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eWhiteCLR,
    actions:  action,
    title: title!,titleStyle: logic.isDarkTheme
      ? eDarkMediumTitleStyleSTL
      : eLightMediumTitleStyleSTL,
    content: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color:
                          logic.isDarkTheme ? eCardColor : eDPrimaryCLR2),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(5.0))),
                  child: Text(
                    'NO.',
                    style: logic.isDarkTheme
                        ? eDarkSmallTextStyleSTL
                        : eLightSmallTextStyleSTL,
                  ),
                ),
                Text(stationName!,
                    style: logic.isDarkTheme
                        ? eDarkSmallTitleStyleSTL
                        : eLightSmallTitleStyleSTL)
              ]),
              Text(
                '${DateTime.now().hour}:${DateTime.now().minute}',
                style: logic.isDarkTheme
                    ? eDarkSmallTextStyleSTL
                    : eLightSmallTextStyleSTL,
              )
            ],
          ),
        ),

        AlertDialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eWhiteCLR,

          content: content,
          //actions: action,
        ),
      ],
    ),

  );
}