import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/change_password_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:ekhoncharge/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          body: Form(
              key: _formKey,
              child: GetBuilder<ChangePasswordController>(
                builder: (changPasswordCtl) {
                  return Background(
                    isActive: false,
                    child: eAppPadding(
                        child: SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            eCEXSmallSizedBox(),
                            Center(
                              child: Container(
                                alignment: Alignment.center,
                                child: Image(
                                  width: logic.isDarkTheme
                                      ? appDarkLogoWidth
                                      : appDarkLogoWidth,
                                  height: appLogoHeight,
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    logic.isDarkTheme
                                        ? eDarkAppLogo
                                        : eLightAppLogo,
                                  ),
                                ),
                              ),
                            ),
                            eCLargeSizedBox(),
                            Center(
                              child: Text(
                                eChangePassword.tr,
                                style: logic.isDarkTheme
                                    ? eDarkMediumTitleStyleSTL
                                    : eLightMediumTitleStyleSTL,
                              ),
                            ),
                            eCSmallSizedBox(),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),

                            Text(
                              eOldPassword.tr,
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                            eCSmallSizedBox(),
                            SizedBox(
                              height: Get.height * 0.063,
                              width: double.maxFinite,
                              child: Card(
                                color: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                elevation: 5,
                                shadowColor: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                child: eNewTextFiled(
                                    changPasswordCtl.oldChangePasswordTxtCtl,
                                    obscureText: changPasswordCtl
                                        .obscureOldChangePasswordText,
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTextStyleSTL
                                        : eLightMediumTextStyleSTL,
                                    colorr: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eWhiteCLR,
                                    enableColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    focusColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    hint: eOldPassword.tr,
                                    suffixWidget: InkWell(
                                      onTap: () {
                                        changPasswordCtl
                                                .obscureOldChangePasswordText =
                                            !changPasswordCtl
                                                .obscureOldChangePasswordText;
                                      },
                                      child: Icon(
                                        changPasswordCtl
                                                .obscureOldChangePasswordText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: eSmallIcon,
                                        color: logic.isDarkTheme
                                            ? eWhiteCLR
                                            : eHintCLR,
                                      ),
                                    ),
                                    hintStyle: logic.isDarkTheme
                                        ? eLightMediumHintWthSTL
                                        : eLightMediumHintSTL,
                                    prefixWidget: Icon(
                                      Icons.lock_outline,
                                      size: eSmallIcon,
                                      color: logic.isDarkTheme
                                          ? eWhiteCLR
                                          : eHintCLR,
                                    )),
                              ),
                            ),

                            //eCELargeSizedBox(),
                            eCSmallSizedBox(),
                            Text(
                              eNewPassword.tr,
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                            eCSmallSizedBox(),
                            SizedBox(
                              height: Get.height * 0.063,
                              width: double.maxFinite,
                              child: Card(
                                color: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                elevation: 5,
                                shadowColor: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                child: eNewTextFiled(
                                    changPasswordCtl.newChangePasswordTxtCtl,
                                    obscureText: changPasswordCtl
                                        .obscureNewChangePasswordText,
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTextStyleSTL
                                        : eLightMediumTextStyleSTL,
                                    colorr: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eWhiteCLR,
                                    enableColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    focusColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    hint: eNewPassword.tr,
                                    suffixWidget: InkWell(
                                      onTap: () {
                                        changPasswordCtl
                                                .obscureNewChangePasswordText =
                                            !changPasswordCtl
                                                .obscureNewChangePasswordText;
                                      },
                                      child: Icon(
                                        changPasswordCtl
                                                .obscureNewChangePasswordText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: eSmallIcon,
                                        color: logic.isDarkTheme
                                            ? eWhiteCLR
                                            : eHintCLR,
                                      ),
                                    ),
                                    hintStyle: logic.isDarkTheme
                                        ? eLightMediumHintWthSTL
                                        : eLightMediumHintSTL,
                                    prefixWidget: Icon(
                                      Icons.lock_outline,
                                      size: eSmallIcon,
                                      color: logic.isDarkTheme
                                          ? eWhiteCLR
                                          : eHintCLR,
                                    )),
                              ),
                            ),

                            //eCELargeSizedBox(),
                            eCSmallSizedBox(),
                            Text(
                              eReTypeNewPassword.tr,
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                            eCSmallSizedBox(),
                            SizedBox(
                              height: Get.height * 0.063,
                              width: double.maxFinite,
                              child: Card(
                                color: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                elevation: 5,
                                shadowColor: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                child: eNewTextFiled(
                                    changPasswordCtl
                                        .confirmChangePasswordTxtCtl,
                                    obscureText: changPasswordCtl
                                        .obscureConfirmChangePasswordText,
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTextStyleSTL
                                        : eLightMediumTextStyleSTL,
                                    colorr: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eWhiteCLR,
                                    enableColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    focusColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    hint: eReTypeNewPassword.tr,
                                    suffixWidget: InkWell(
                                      onTap: () {
                                        changPasswordCtl
                                                .obscureConfirmChangePasswordText =
                                            !changPasswordCtl
                                                .obscureConfirmChangePasswordText;
                                      },
                                      child: Icon(
                                        changPasswordCtl
                                                .obscureConfirmChangePasswordText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: eSmallIcon,
                                        color: logic.isDarkTheme
                                            ? eWhiteCLR
                                            : eHintCLR,
                                      ),
                                    ),
                                    hintStyle: logic.isDarkTheme
                                        ? eLightMediumHintWthSTL
                                        : eLightMediumHintSTL,
                                    prefixWidget: Icon(
                                      Icons.lock_outline,
                                      size: eSmallIcon,
                                      color: logic.isDarkTheme
                                          ? eWhiteCLR
                                          : eHintCLR,
                                    )),
                              ),
                            ),
                            eCELargeSizedBox(),
                            eCELargeSizedBox(),
                            eCELargeSizedBox(),
                            eCELargeSizedBox(),
                            eCELargeSizedBox(),
                            SizedBox(
                              width: double.maxFinite,
                              child: eButton(
                                logic,
                                title: eSubmit.tr,
                                onPressed: () {
                                  changPasswordCtl.userPasswordChange();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  );
                },
              )),
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
      },
    );
  }
}
