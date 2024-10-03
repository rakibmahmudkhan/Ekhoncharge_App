import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
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
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneNumForgotPasswordPage extends StatefulWidget {
  const PhoneNumForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumForgotPasswordPage> createState() =>
      _PhoneNumForgotPasswordPageState();
}

class _PhoneNumForgotPasswordPageState
    extends State<PhoneNumForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  ForgotPasswordController forgotPasswordController= ForgotPasswordController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   forgotPasswordController.resetPhoneNumber();

  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          appBar: eAppBarWithoutProfile(logic, title: eForgotPassword.tr),
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
                            Center(
                              child: Text(
                                eForgotPasswordDescription.tr,
                                style: logic.isDarkTheme
                                    ? eDarkSmallTextStyleSTL
                                    : eLightSmallTextStyleSTL,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),
                            Text(
                              ePhoneTxt.tr,
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
                                    forgotPasswordCtl.forgotPassPhoneTxtCtl,
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
                                    hint: eEnterYourPhoneNumber.tr,
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
                            eCEELargeSizedBox(),
                            eCEELargeSizedBox(),
                            eCEELargeSizedBox(),
                            SizedBox(
                              width: double.maxFinite,
                              child: eButton(
                                logic,
                                title: eSubmit.tr,
                                onPressed: () {
                                  forgotPasswordCtl.validatePhoneNumberForm();
                                  // Get.toNamed(RoutesName.otpVerifyForgotPasswordPage);
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
