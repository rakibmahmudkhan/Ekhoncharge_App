import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessfulMessagePage extends StatefulWidget {
  const SuccessfulMessagePage({super.key});

  @override
  State<SuccessfulMessagePage> createState() => _SuccessfulMessagePageState();
}

class _SuccessfulMessagePageState extends State<SuccessfulMessagePage> {
  String? successMessage;
  String? setupMessage;
  int? fromPage;

  @override
  void initState() {
    super.initState();
    successMessage = Get.arguments['successMessage'];
    setupMessage = Get.arguments['setupMessage'];
    fromPage = Get.arguments['fromPage'];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
        body: eAppPadding(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: Get.height * 1,
                width: Get.width * 1,
                decoration: BoxDecoration(
                    //color: eDPrimaryCLR3,
                    ),
                child: Column(
                  children: [
                    eCEELargeSizedBox(),
                    eCEELargeSizedBox(),
                    SizedBox(
                      height: Get.height * .2,
                      width: Get.width * .39,
                      child: const Image(
                        fit: BoxFit.contain,
                        image: AssetImage(
                            "assets/images/work_progress_success.png"),
                      ),
                    ),
                    eCEELargeSizedBox(),
                    eCEELargeSizedBox(),
                    eCEELargeSizedBox(),
                    Center(
                      child: Text(
                        successMessage ?? '',
                        // "Your Registration Successful",
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL
                            : eLightMediumTextStyleSTL,
                      ),
                    ),
                    eCEELargeSizedBox(),
                    Card(
                      elevation: 3,
                      color: eDPrimaryCLR3,
                      child: Container(
                        height: Get.height * .25,
                        width: Get.width * .9,
                        decoration: BoxDecoration(
                          color:logic.isDarkTheme
                          ? eDSecondPrimaryCLR
                          : eWhiteCLR ,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(width:0.8,color:logic.isDarkTheme
                              ? eWhiteCLR
                              : eDSecondaryCLR),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  setupMessage ?? '',
                                  // "Setup Your Profile ",
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTextStyleSTL
                                      : eLightMediumTextStyleSTL,
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: double.maxFinite,
                                child: eButton(
                                  logic,
                                  title: 'Continue',
                                  style:  logic.isDarkTheme
                                    ? eDarkMediumTextStyleSTL
                                    : eDarkMediumTextStyleSTL,
                                  onPressed: () {
                                    switch (fromPage) {
                                      case 1:
                                        Get.toNamed(
                                            RoutesName.profileSetupPage);
                                        break;
                                      case 2:
                                        Get.toNamed(
                                            RoutesName.vehicleSetupPage);
                                        break;
                                      case 3:
                                        Get.find<HomeController>()
                                            .selectedNavIndex = 1;
                                        Get.toNamed(RoutesName.home);
                                        break;
                                      default:
                                        break;
                                    }
                                  },
                                ),
                              ),
                              Center(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Skip Now",
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTextStyleSTL
                                        : eLightMediumTextStyleSTL,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
