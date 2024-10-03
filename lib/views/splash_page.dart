import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    delayGenerator();
  }

  void delayGenerator() async {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        try {
          bool isLoggedIn = PreferenceUtils.getBool(eIsLoggedIn) ?? false;
          bool isVehicleUpdated =
              PreferenceUtils.getBool(eIsVehicleUpdated) ?? false;
          if (isLoggedIn == false) {
            Get.offAllNamed(RoutesName.welcomePage);
          } else {
           // Get.find<AuthController>().setCacheData();
            if (isVehicleUpdated) {
              Get.offAllNamed(RoutesName.loginPage);
            } else {
              Get.toNamed(
                RoutesName.vehicleSetupPage,
                arguments: {
                  'successMessage': '',
                },
              );
            }
          }
        } catch (error) {
          ePrintWrapped(error.toString());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
        resizeToAvoidBottomInset: false,
        body: eAppPadding(
          child: Center(
            child: Container(
              alignment: Alignment.center,
              child: Image(
                width: logic.isDarkTheme ? appDarkLogoWidth : appDarkLogoWidth,
                //height: appLogoHeight,
                fit: BoxFit.contain,
                image: AssetImage(
                  logic.isDarkTheme ? eDarkAppLogo : eLightAppLogo,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
