import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/app_utils_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final AuthController authController = Get.find();

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<AppUtilsController>().fetchPrivacyPolicy();
    });
    super.initState();
  }

  final AppUtilsController _utilsController = Get.put(AppUtilsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AppUtilsController>(builder: (appUtilsController) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          appBar: eHomeAppBarWithoutBalance(logic, authController),
          body: SafeArea(
            child: eAppPadding(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    eCMediumSizedBox(),
                    eCMediumSizedBox(),
                    Center(
                      child: Text(
                        "Privacy & Policy",
                        style: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),
                    ),
                    eCMediumSizedBox(),
                    eCMediumSizedBox(),
                    eCMediumSizedBox(),
                    Obx(
                      () {
                        if (_utilsController.privacyPolicies.isEmpty) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _utilsController.privacyPolicies.length,
                            itemBuilder: (context, index) {
                              var policy =
                                  _utilsController.privacyPolicies[index];
                              return Column(
                                children: [
                                  Text(policy['title'],
                                      style: logic.isDarkTheme
                                          ? eDarkSmallTitleStyleSTL
                                          : eLightSmallTitleStyleSTL,
                                      textAlign: TextAlign.justify),
                                  eCMediumSizedBox(),
                                  Text(
                                    policy['content'],
                                    style: logic.isDarkTheme
                                        ? eDarkSmallTextStyleSTL
                                        : eLightSmallTextStyleSTL,
                                    textAlign: TextAlign.justify,
                                  ),
                                  eCMediumSizedBox(),
                                ],
                                // Add more widgets as needed
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            focusElevation: 2,
            elevation: 4,
            label: Row(
              children: [
                FaIcon(
                  Icons.arrow_back_ios,
                  color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                  size: eESmallIcon,
                ),
                // SizedBox(width: 5,),
                Text(
                  "  Back",
                  style: logic.isDarkTheme
                      ? eDarkSmallTitleStyleSTL
                      : eLightSmallTitleStyleSTL,
                ),
              ],
            ),
            onPressed: () {
              Get.back();
            },
            backgroundColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
          ),
        );
      });
    });
  }
}
