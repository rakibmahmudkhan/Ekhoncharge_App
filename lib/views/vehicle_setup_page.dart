import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

class VehicleSetupPage extends StatefulWidget {
  const VehicleSetupPage({super.key});

  @override
  State<VehicleSetupPage> createState() => _VehicleSetupPageState();
}

class _VehicleSetupPageState extends State<VehicleSetupPage> {
  String? successMessage;

  @override
  void initState() {
    super.initState();
    successMessage = Get.arguments['successMessage'];
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      showIgnore: false,
      showLater: false,
      canDismissDialog: false,
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(minutes: 30),
      ),
      child: GetBuilder<AppSystemController>(
        builder: (logic) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            appBar: eAppBar(logic, title: ''),
            body: SafeArea(
              child: SingleChildScrollView(
                child: eAppPadding(
                  child: Column(
                    children: [
                      eCELargeSizedBox(),
                      eCELargeSizedBox(),
                      eCELargeSizedBox(),
                      //  eCELargeSizedBox(),
                      Center(
                          child: Text(
                        successMessage ?? "",
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL
                            : eLightMediumTextStyleSTL,
                        textAlign: TextAlign.center,
                      )),
                      const Padding(
                        padding: EdgeInsets.only(right: 35.0),
                        child: SizedBox(
                          height: 310,
                          // width: 300,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/audi_4.png"),
                          ),
                        ),
                      ),
                      Center(
                          child: Text(
                            eAddVehiclesTxt.tr,
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL
                            : eLightMediumTextStyleSTL,
                        textAlign: TextAlign.center,
                      )),
                      eCELargeSizedBox(),
                      eCELargeSizedBox(),
                      eCELargeSizedBox(),
                      eCELargeSizedBox(),
                      eCELargeSizedBox(),
                      eCELargeSizedBox(),
                      eButton(logic, title: eAddVehicleButton.tr, onPressed: () {
                        Get.toNamed(RoutesName.selectCarPage);
                      }),
                      eCELargeSizedBox(),

                      //*** Add Later ***

                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Text(
                      //     "Add Later".toUpperCase(),
                      //     style: logic.isDarkTheme
                      //         ? eDarkMediumTextStyleSTL
                      //         : eLightMediumTextStyleSTL,
                      //   ),
                      // ),
                      eCELargeSizedBox(),

                      // *** Can't Find Your Vehicle ***
                      // GestureDetector(
                      //   onTap: () {},
                      //   child: Text(
                      //     "Can't Find Your Vehicle?".toUpperCase(),
                      //     textAlign: TextAlign.center,
                      //     style: logic.isDarkTheme
                      //         ? eDarkMediumTextStyleSTL
                      //         : eLightMediumTextStyleSTL,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
