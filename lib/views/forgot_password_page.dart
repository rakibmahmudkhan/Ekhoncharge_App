import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/forgot_password_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:ekhoncharge/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_system_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          appBar: eAppBarWithoutProfile(logic, title: eNewPassword.tr),
          body: Form(
              key: _formKey,
              child: GetBuilder<ForgotPasswordController>(
                builder: (forgotPasswordCtl) {
                  return Background(
                    isActive: false,
                    child: eAppPadding(
                        child: SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            eCLargeSizedBox(),
                            eCSmallSizedBox(),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),

                            Text(
                              eNewPasswordDescription.tr,
                               style: logic.isDarkTheme
                                  ? eDarkSmallTextStyleSTL
                                  : eLightSmallTextStyleSTL,
                              textAlign: TextAlign.center,
                            ),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),


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
                                    forgotPasswordCtl.forgotPasswordTxtCtl,
                                    obscureText: forgotPasswordCtl
                                        .obscureForgotPassPasswordText,
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
                                        forgotPasswordCtl
                                                .obscureForgotPassPasswordText =
                                            !forgotPasswordCtl
                                                .obscureForgotPassPasswordText;
                                      },
                                      child: Icon(
                                        forgotPasswordCtl
                                                .obscureForgotPassPasswordText
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
                                    forgotPasswordCtl
                                        .forgotPasswordConfirmTxtCtl,
                                    obscureText: forgotPasswordCtl
                                        .obscureForgotPassConfirmPasswordText,
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
                                    hint:    eReTypeNewPassword.tr,
                                    suffixWidget: InkWell(
                                      onTap: () {
                                        forgotPasswordCtl
                                                .obscureForgotPassConfirmPasswordText =
                                            !forgotPasswordCtl
                                                .obscureForgotPassConfirmPasswordText;
                                      },
                                      child: Icon(
                                        forgotPasswordCtl
                                                .obscureForgotPassConfirmPasswordText
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
                            eCEELargeSizedBox(),
                            eCEELargeSizedBox(),
                            eCEELargeSizedBox(),
                            SizedBox(
                              width: double.maxFinite,
                              child: eButton(
                                logic,
                                title:eSubmit.tr,
                                onPressed: () {

                                 forgotPasswordCtl.userSetNewPassword();
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
        );
      },
    );
  }
}
