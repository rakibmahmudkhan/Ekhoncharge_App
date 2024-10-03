 import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
 import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
 import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:ekhoncharge/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return Scaffold(
            //resizeToAvoidBottomInset: false,
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            body: Form(
              key: _formKey,
              child: GetBuilder<AuthController>(builder: (authlogic) {
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
                                ePleaseSignupToContinueTxt.tr,
                                style: logic.isDarkTheme
                                    ? eDarkMediumTitleStyleSTL
                                    : eLightMediumTitleStyleSTL,
                              ),
                            ),
                            eCELargeSizedBox(),
                            eCSmallSizedBox(),
                            Text(
                              eNameTxt.tr,
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                            // eCSmallSizedBox(),
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
                                  authlogic.signUpNameTxtCtl,
                                  inputType: TextInputType.name,
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
                                  hint: eNameTxt.tr,
                                  hintStyle: logic.isDarkTheme
                                      ? eLightMediumHintWthSTL
                                      : eLightMediumHintSTL,
                                  prefixWidget: Icon(
                                    Icons.person_2_outlined,
                                    size: eSmallIcon,
                                    color: logic.isDarkTheme
                                        ? eWhiteCLR
                                        : eHintCLR,
                                  ),
                                ),
                              ),
                            ),
                            eCSmallSizedBox(),
                            Text(
                              eEmailTxt.tr,
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                            //eCSmallSizedBox(),
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
                                    authlogic.signUpEmailTxtCtl,
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
                                    hint: eEmailTxt.tr,
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

                            //eCELargeSizedBox(),
                            eCSmallSizedBox(),
                            Text(
                              ePhoneTxt.tr,
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                            // eCSmallSizedBox(),
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
                                    authlogic.signUpPhoneTxtCtl,
                                    inputType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
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
                                    hint: ePhoneTxt.tr,
                                    hintStyle: logic.isDarkTheme
                                        ? eLightMediumHintWthSTL
                                        : eLightMediumHintSTL,
                                    prefixWidget: Icon(
                                      Icons.phone_android_outlined,
                                      size: eSmallIcon,
                                      color: logic.isDarkTheme
                                          ? eWhiteCLR
                                          : eHintCLR,
                                    )),
                              ),
                            ),
                            eCSmallSizedBox(),

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
                                    authlogic.signUpPasswordTxtCtl,
                                    obscureText:
                                        authlogic.obscureSignupPasswordText,
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
                                        authlogic.obscureSignupPasswordText =
                                            !authlogic
                                                .obscureSignupPasswordText;
                                      },
                                      child: Icon(
                                        authlogic.obscureSignupPasswordText
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Material(
                                      type: MaterialType.transparency,
                                      //Makes it usable on any background color, thanks @IanSmith
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: eHintCLR, width: 2.0),
                                          color: Colors.transparent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(1000.0),
                                          onTap: () {
                                            Get.defaultDialog(
                                              backgroundColor: logic.isDarkTheme
                                                  ? eDarkThemeBGCLR
                                                  : eWhiteCLR,
                                              title: 'Password Guidelines',
                                              titleStyle: logic.isDarkTheme
                                                  ? eDarkMediumTitleStyleSTL
                                                  : eLightMediumTitleStyleSTL,
                                              content: Text(
                                                'Password must be at least 8 characters long.',
                                                style: logic.isDarkTheme
                                                    ? eDarkMediumTextStyleSTL
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)
                                                    : eLightMediumTextStyleSTL
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                textAlign: TextAlign.center,
                                              ),
                                              confirm: GestureDetector(
                                                onTap: () => Get.back(),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: eDPrimaryCLR2,
                                                  borderRadius: BorderRadius.circular(12)),
                                                  child: const Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
                                                    child: Text('OK'),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(
                                              "!",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            //eCELargeSizedBox(),

                            //eCSmallSizedBox(),
                            Text(
                              eConfirmPasswordTxt.tr,
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
                                    authlogic.signUpConfirmPasswordTxtCtl,
                                    obscureText: authlogic
                                        .obscureSignupConfirmPasswordText,
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
                                    hint: eConfirmPasswordTxt.tr,
                                    suffixWidget: InkWell(
                                      onTap: () {
                                        authlogic
                                                .obscureSignupConfirmPasswordText =
                                            !authlogic
                                                .obscureSignupConfirmPasswordText;
                                      },
                                      child: Icon(
                                        authlogic
                                                .obscureSignupConfirmPasswordText
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
                            // eGeneralTextFiled(
                            //   hint: eConfirmPasswordTxt.tr,
                            //   prefix: Icons.lock_outline,
                            //   obscureText:
                            //       authlogic.obscureSignupConfirmPasswordText,
                            //   txtController: authlogic.signUpConfirmPasswordTxtCtl,
                            //   suffixWidget: InkWell(
                            //     onTap: () {
                            //       authlogic.obscureSignupConfirmPasswordText =
                            //           !authlogic.obscureSignupConfirmPasswordText;
                            //     },
                            //     child: Icon(
                            //       authlogic.obscureSignupConfirmPasswordText
                            //           ? Icons.visibility_off
                            //           : Icons.visibility,
                            //       size: eSmallIcon,
                            //       color: eDPrimaryCLR,
                            //     ),
                            //   ),
                            // ),
                            eCELargeSizedBox(),
                            eCELargeSizedBox(),
                            SizedBox(
                              width: double.maxFinite,
                              child: eLoginButton(
                                title: eSignupTxt.tr.toUpperCase(),
                                onPressed: () {
                                  authlogic.userRegister();
                                },
                              ),
                            ),
                            eCELargeSizedBox(),
                            eCELargeSizedBox(),
                            eCELargeSizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  eAlreadyAccountYetTxt.tr,
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTextStyleSTL
                                      : eLightMediumTextStyleSTL,
                                  maxLines: 1,
                                ),
                                eRSmallSizedBox(),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutesName.loginPage);
                                  },
                                  child: Text(
                                    eLoginTxt.tr,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ));
      },
    );
  }
}
