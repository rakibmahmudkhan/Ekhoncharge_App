import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/forgot_password_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/otp_field.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerifyForgotPasswordPage extends StatefulWidget {
  const OtpVerifyForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<OtpVerifyForgotPasswordPage> createState() => _OtpVerifyForgotPasswordPageState();
}

class _OtpVerifyForgotPasswordPageState extends State<OtpVerifyForgotPasswordPage> {

  ForgotPasswordController forgotPasswordController = Get.find();

  @override
  void initState() {
    super.initState();
    forgotPasswordController.resetOTPPage();
    forgotPasswordController.startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    forgotPasswordController.disposeTimer();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          appBar: eAppBarWithoutProfile(logic,title:  eVerifyYourPhoneNumber.tr),
          body: GetBuilder<ForgotPasswordController>(
            builder: (forgotPasswordCtl) {
              return Background(
                isActive: false,
                child: eAppPadding(
                    child: SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [


                            eCLargeSizedBox(),
                            eCSmallSizedBox(),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),

                            Center(
                              child: Text(
                                ePhoneVerifyDescription.tr,
                                style: logic.isDarkTheme
                                    ? eDarkSmallTextStyleSTL
                                    : eLightSmallTextStyleSTL,
                                textAlign: TextAlign.center,
                              ),
                            ),

                            eCLargeSizedBox(),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),
                            Image(
                              height: 100,
                              image: AssetImage(eOtpVerifyImg2),
                            ),



                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "That send to ${forgotPasswordCtl.forgotPassPhoneTxtCtl.text}  ",
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTextStyleSTL
                                      : eLightMediumTextStyleSTL,
                                  textAlign: TextAlign.center,
                                ),    InkWell(
                                  onTap: (){Get.offAllNamed(RoutesName.phoneNumForgotPasswordPage);},
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
                                          forgotPasswordCtl.otp1TxtCtl,
                                          logic,
                                          context,
                                          first: true,
                                          last: false,
                                        ),
                                      ),
                                      eRSmallSizedBox(),
                                      Expanded(
                                        child: customOTPField(
                                          forgotPasswordCtl.otp2TxtCtl,
                                          logic,
                                          context,
                                          first: false,
                                          last: false,
                                        ),
                                      ),
                                      eRSmallSizedBox(),
                                      Expanded(
                                        child: customOTPField(
                                          forgotPasswordCtl.otp3TxtCtl,
                                          logic,
                                          context,
                                          first: false,
                                          last: false,
                                        ),
                                      ),
                                      eRSmallSizedBox(),
                                      Expanded(
                                        child: customOTPField(
                                          forgotPasswordCtl.otp4TxtCtl,
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
                                        forgotPasswordCtl.validateOtpForm();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),


                            eCEELargeSizedBox(),
                            eCEELargeSizedBox(),
                            eCEELargeSizedBox(),
                            InkWell(
                              onTap: () {
                                 Get.toNamed(RoutesName.forgotPasswordPage);
                              },
                              child: Text(
                                forgotPasswordCtl.start == 0
                                    ? eResendNewCodeTxt.tr
                                    : '${eOtpNotReceiveTxt.tr} ${forgotPasswordCtl.start}',
                                style: forgotPasswordCtl.start == 0
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
                    )),
              );
            },
          ),
        );
      },
    );
  }
}
