import 'dart:io';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/divider.dart';
import 'package:ekhoncharge/widgets/menu_title.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:ekhoncharge/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController ac = Get.find();

  @override
  void initState() {
    super.initState();
    ac.isDeviceSupported();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          body: GetBuilder<AuthController>(
            builder: (authlogic) {
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

                          eCELargeSizedBox(),
                          eCELargeSizedBox(),

                          Center(
                            child: Text(
                              ePleaseSigninToContinueTxt.tr,
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                          ),
                          eCELargeSizedBox(),
                          eCELargeSizedBox(),
                          Text(
                            eEmailOrPhoneTxt.tr,
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
                              child: eNewTextFiled(authlogic.loginEmailTxtCtl,
                                  // inputType: TextInputType.emailAddress,
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
                                  hint: eEmailOrPhoneTxt.tr,
                                  hintStyle: logic.isDarkTheme
                                      ? eLightMediumHintWthSTL
                                      : eLightMediumHintSTL,
                                  prefixWidget: Icon(
                                    Icons.email_outlined,
                                    size: eSmallIcon,
                                    color: logic.isDarkTheme
                                        ? eWhiteCLR
                                        : eHintCLR,
                                  )),
                            ),
                          ),

                          Text(
                            ePasswordTxt.tr,
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
                                  authlogic.loginPasswordTxtCtl,
                                  obscureText:
                                      authlogic.obscureSigninPasswordText,
                                  inputType: TextInputType.emailAddress,
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
                                  hint: ePasswordTxt.tr,
                                  suffixWidget: InkWell(
                                    onTap: () {
                                      authlogic.obscureSigninPasswordText =
                                          !authlogic.obscureSigninPasswordText;
                                    },
                                    child: Icon(
                                      authlogic.obscureSigninPasswordText
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

                          InkWell(
                            onTap: (){
                              Get.toNamed(RoutesName.phoneNumForgotPasswordPage);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                eForgottenPasswordTxt.tr,
                                  style: logic.isDarkTheme
                              ? eDarkMediumTextStyleSTL.copyWith(
                              color: eDPrimaryCLR,
                                fontWeight: FontWeight.bold,
                              )
                                  : eLightMediumTextStyleSTL.copyWith(
                              color: eDPrimaryCLR,
                              fontWeight: FontWeight.bold,
                            ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                          eCELargeSizedBox(),
                          eCELargeSizedBox(),
                          SizedBox(
                            width: double.maxFinite,
                            child: eLoginButton(
                              title: eLoginTxt.tr.toUpperCase(),
                              onPressed: () async {
                                await authlogic.validateLoginForm();
                              },
                            ),
                          ),
                          eCELargeSizedBox(),
                          eCELargeSizedBox(),
                          // eCELargeSizedBox(),
                          authlogic.supportState &&
                                  authlogic.canCheckBiometrics &&
                                  PreferenceUtils.getString(eToken) != null &&
                                  PreferenceUtils.getString(eToken) != ''
                              ? InkWell(
                                  onTap: () {
                                    ac.authenticateWithBiometrics();
                                  },
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          child: Icon(
                                            Platform.isAndroid
                                                ? Icons.fingerprint
                                                : Icons.face,
                                            size: 40,
                                            color: eWhiteCLR,
                                          ),
                                        ),
                                        Text(
                                          Platform.isAndroid
                                              ? eUseBiometricsTxt.tr
                                              : eUseFaceIDTxt.tr,
                                          style: logic.isDarkTheme
                                              ? eDarkSmallTextStyleSTL
                                              : eLightSmallTextStyleSTL,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : eCEELargeSizedBox(),
                          eCELargeSizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                eNotAccountYetTxt.tr,
                                style: logic.isDarkTheme
                                    ? eDarkMediumTextStyleSTL
                                    : eLightMediumTextStyleSTL,
                                maxLines: 1,
                              ),
                              eRSmallSizedBox(),
                              InkWell(
                                onTap: () {
                                  authlogic.resetSignUpPage();
                                  Get.offAllNamed(RoutesName.signupPage);
                                },
                                child: Text(
                                  eSignUpTxt.tr,
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTextStyleSTL.copyWith(
                                          color: eDPrimaryCLR,
                                          fontWeight: FontWeight.bold,
                                        )
                                      : eLightMediumTextStyleSTL.copyWith(
                                          color: eDPrimaryCLR,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          // : eCEELargeSizedBox(),
                          eCELargeSizedBox(),
                          //eCELargeSizedBox(),
                          eThemeTitle(
                            logic,
                            context,
                            title: eDarkThemeTxt.tr,
                          ),

                          eDivider(logic),
                          eLanguageTitle(
                            logic,
                            context,
                            title: eLanguageTxt,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
