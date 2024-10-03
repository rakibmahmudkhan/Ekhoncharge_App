import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../settings/pamas.dart';

Widget AddMoneyCard(AppSystemController logic,
    {Function()? onPressed, String? title, IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
    child: Container(
      decoration: BoxDecoration(
        color: logic.isDarkTheme ? eDarkThemeBGCLR : eWhiteCLR,
        border: Border.all(
            width: 1,
            color: logic.isDarkTheme ? eCardColor : eLightThemeBorderCLR),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: InkWell(
        onTap: onPressed ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FaIcon(
                    icon?? FontAwesomeIcons.circle,
                    color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                    size: eMediumIcon,
                  ),
                  SizedBox(width: Get.width * 0.07),
                  Text(
                    title ?? "",
                    style: logic.isDarkTheme
                        ? eDarkSmallTitleStyleSTL
                        : eLightSmallTextStyleSTL,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                size: eSmallIcon,
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget MobileBankigCard(AppSystemController logic,
    {Function()? onPressed, String? title, String? url}) {
  return Padding(
    padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
    child: Container(
      decoration: BoxDecoration(
        color: logic.isDarkTheme ? eDarkThemeBGCLR : eWhiteCLR,
        border: Border.all(
            width: 1,
            color: logic.isDarkTheme ? eCardColor : eLightThemeBorderCLR),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: InkWell(
        onTap: onPressed ,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  
                  SizedBox(
                    height:eMediumIcon ,
                    child: Image.asset(url??"")
                  ),

                  SizedBox(width: Get.width * 0.07),
                  Text(
                    title ?? "",
                    style: logic.isDarkTheme
                        ? eDarkSmallTitleStyleSTL
                        : eLightSmallTextStyleSTL,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                size: eSmallIcon,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
