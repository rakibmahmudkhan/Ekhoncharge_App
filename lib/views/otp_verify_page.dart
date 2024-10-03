import 'dart:io';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/views/profile_information_update_page.dart';
import 'package:ekhoncharge/views/successful_message_page.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/otp_field.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({Key? key}) : super(key: key);

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  AuthController authenticationVM = Get.find();

  @override
  void initState() {
    super.initState();
    authenticationVM.resetOTPPage();
    authenticationVM.startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    authenticationVM.disposeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authController) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: eAppPadding(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    eCELargeSizedBox(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Platform.isIOS
                              ? Icons.arrow_back_ios
                              : Icons.arrow_back,
                          color: logic.isDarkTheme ? eWhiteCLR : eWhiteCLR,
                        ),
                      ),
                    ),
                    eCELargeSizedBox(),
                    eCELargeSizedBox(),
                    eCEELargeSizedBox(),
                    eCEELargeSizedBox(),
                    // Container(
                    //   width: appDarkLogoWidth,
                    //   height: appDarkLogoWidth,
                    //   decoration: BoxDecoration(
                    //     color: Colors.deepPurple.shade50,
                    //     shape: BoxShape.circle,
                    //     image: DecorationImage(
                    //      // scale: 0.6,
                    //       image: AssetImage(eOtpVerifyImg2,),
                    //       fit:BoxFit.fitHeight
                    //     )
                    //   ),
                    //
                    // ),

                    Image(
                      height: 100,
                      image: AssetImage(eOtpVerifyImg2),
                    ),
                    eCELargeSizedBox(),
                    Text(
                      eVerificationTxt.tr,
                      style: logic.isDarkTheme
                          ? eDarkMediumTitleStyleSTL.copyWith(
                              fontSize: eELFontSize,
                            )
                          : eLightMediumTitleStyleSTL,
                    ),
                    eCMediumSizedBox(),
                    Text(
                      eEnterOtpTxt.tr,
                      style: logic.isDarkTheme
                          ? eDarkMediumTextStyleSTL
                          : eLightMediumTextStyleSTL,
                      textAlign: TextAlign.center,
                    ),
                    eCMediumSizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "That send to ${authController.signUpPhoneTxtCtl.text}  ",
                          style: logic.isDarkTheme
                              ? eDarkMediumTextStyleSTL
                              : eLightMediumTextStyleSTL,
                          textAlign: TextAlign.center,
                        ),    InkWell(
                          onTap: (){Get.back();},
                          child: Text(
                            "Edit",
                            style: logic.isDarkTheme
                                ? eDarkMediumTextStyleSTL.copyWith(color: Colors.blueAccent)
                                : eLightMediumTextStyleSTL.copyWith(color: Colors.blueAccent),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    eCMediumSizedBox(),
                    Container(
                      padding: const EdgeInsets.all(eELPaMa),
                      decoration: BoxDecoration(
                        color: logic.isDarkTheme ? eDarkThemeBGCLR : eWhiteCLR,
                        borderRadius: BorderRadius.circular(eMPaMa),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: customOTPField(
                                  authController.otp1TxtCtl,
                                  logic,
                                  context,
                                  first: true,
                                  last: false,
                                ),
                              ),
                              eRSmallSizedBox(),
                              Expanded(
                                child: customOTPField(
                                  authController.otp2TxtCtl,
                                  logic,
                                  context,
                                  first: false,
                                  last: false,
                                ),
                              ),
                              eRSmallSizedBox(),
                              Expanded(
                                child: customOTPField(
                                  authController.otp3TxtCtl,
                                  logic,
                                  context,
                                  first: false,
                                  last: false,
                                ),
                              ),
                              eRSmallSizedBox(),
                              Expanded(
                                child: customOTPField(
                                  authController.otp4TxtCtl,
                                  logic,
                                  context,
                                  first: false,
                                  last: true,
                                ),
                              ),
                            ],
                          ),
                          eCELargeSizedBox(),
                          SizedBox(
                            width: double.maxFinite,
                            child: eButton(
                              logic,
                              title: eOtpVerifyTxt.tr.toUpperCase(),
                              onPressed: () {
                                authController.validateOtpForm();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {
                        if (authController.start == 0) {
                          authController.directPostRegisterAPI();
                        }
                      },
                      child: Text(
                        authController.start == 0
                            ? eResendNewCodeTxt.tr
                            : '${eOtpNotReceiveTxt.tr} ${authController.start}',
                        style: authController.start == 0
                            ? logic.isDarkTheme
                                ? eDarkMediumTextStyleSTL.copyWith(
                                    color: eDPrimaryCLR,
                                    fontWeight: FontWeight.bold,
                                  )
                                : eLightMediumTextStyleSTL.copyWith(
                                    color: eDPrimaryCLR,
                                    fontWeight: FontWeight.bold,
                                  )
                            : logic.isDarkTheme
                                ? eDarkMediumTextStyleSTL
                                : eLightMediumTextStyleSTL,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
