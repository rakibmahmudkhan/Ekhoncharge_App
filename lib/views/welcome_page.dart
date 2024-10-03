import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

import '../controller/app_system_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      showIgnore: false,
      showLater: false,
      canDismissDialog: false,
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(minutes: 30),
      ),
      child: GetBuilder<AppSystemController>(builder: (logic) {
        return Scaffold(
          backgroundColor:
              logic.isDarkTheme ? eDarkThemeBGCLR : eDarkThemeBGCLR,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                Image(
                  width:
                      logic.isDarkTheme ? appDarkLogoWidth : appDarkLogoWidth,
                  //height: appLogoHeight,
                  fit: BoxFit.contain,
                  image: AssetImage(
                    logic.isDarkTheme ? eDarkAppLogo : eDarkAppLogo,
                  ),
                ),
                eCELargeSizedBox(), eCELargeSizedBox(),
                eCELargeSizedBox(),
                Image(
                  image: AssetImage(eWelcomePageCarImg),
                  fit: BoxFit.contain,
                  width: Get.width * 1,
                ),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                Container(
                  height: 2,
                  width: Get.width * 0.1,
                  color: Colors.grey,
                ),
                eCELargeSizedBox(),
                Text(
                  "Welcome to",
                  style: eDarkSmallTextStyleSTL,
                ),
                Text(
                  "Ekhon Charge",
                  style: eDarkELTextStyleSTL,
                ),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eWelcomeButton(
                  logic,
                  title: "Log in",
                  onPressed: () {
                    Get.offAllNamed(RoutesName.loginPage);
                  },
                  style: eDarkSmallTextStyleSTL,
                ),
                eCELargeSizedBox(),
                eWelcomeButton(
                  logic,
                  title: "Sign up",
                  onPressed: () {
                    Get.offAllNamed(RoutesName.signupPage);
                  },
                  style: eDarkSmallTextStyleSTL,
                ),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                // eCELargeSizedBox(),
                Image(
                  width: logic.isDarkTheme
                      ? sentinelDarkLogoWidth
                      : sentinelDarkLogoWidth,
                  // height: appLogoHeight,
                  fit: BoxFit.contain,
                  image: AssetImage(
                    logic.isDarkTheme ? eSentinelImg : eSentinelImg,
                  ),
                ),
                eCELargeSizedBox(),
              ],
            ),
          )),
        );
      }),
    );
  }
}
