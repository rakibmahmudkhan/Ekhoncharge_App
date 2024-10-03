import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/account_delete_controller.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:ekhoncharge/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AccountDeletionPage extends StatefulWidget {
  const AccountDeletionPage({super.key});

  @override
  State<AccountDeletionPage> createState() => _AccountDeletionPageState();
}

class _AccountDeletionPageState extends State<AccountDeletionPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authController) {
        return GetBuilder<AccountDeleteController>(builder: (deleteController) {
          return PopScope(
            onPopInvoked: (value) {
              return;
            },
            child: Scaffold(
              backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
              appBar: eHomeAppBarWithoutBalance(logic, authController),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: eAppPadding(
                    child: SafeArea(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          eCLargeSizedBox(),
                          eCLargeSizedBox(),
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
                              child: eNewTextFiled(
                                  deleteController.deleteAccEmailTxtCtl,
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
                                  deleteController.deleteAccPasswordTxtCtl,
                                  obscureText:
                                      deleteController.obscureAccDeletePassTxt,
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
                                      deleteController.obscureAccDeletePassTxt =
                                          !deleteController
                                              .obscureAccDeletePassTxt;
                                    },
                                    child: Icon(
                                      deleteController.obscureAccDeletePassTxt
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
                          SizedBox(
                            width: double.maxFinite,
                            child: eLoginButton(
                                title: eSubmit.tr.toUpperCase(),
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor:
                                    logic.isDarkTheme ? eCardColor : eWhiteCLR,
                                    context: context,
                                    builder: (context) {
                                      return eAppPadding(
                                        child: SizedBox(
                                          height: Get.height * 0.37,
                                          child: ListView(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(22),
                                                          color: logic.isDarkTheme
                                                              ? eCardColor
                                                              : eELigthShadowCLR,
                                                        ),
                                                        child: Icon(Icons.close,
                                                            size: eLFontSize,
                                                            color: logic.isDarkTheme
                                                                ? eWhiteCLR
                                                                : eBlackCLR),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                eDeleteAccountTxt.tr,
                                                style: logic.isDarkTheme
                                                    ? eDarkLTextStyleSTL
                                                    : eLightLTextStyleSTL,
                                              ),
                                              eCLargeSizedBox(),
                                              eCLargeSizedBox(),
                                              Text(
                                                eDeleteAccountTxt2.tr,
                                                style: logic.isDarkTheme
                                                    ? eDarkMediumTextStyleSTL
                                                    : eLightMediumTextStyleSTL,
                                                textAlign: TextAlign.justify,
                                              ),
                                              eCLargeSizedBox(),
                                              eCLargeSizedBox(),
                                              eButton(logic, onPressed: () async{
                                                await deleteController.validateAccDeleteForm();
                                              },
                                                  title: eDeleteBtnTxt.tr,
                                                  color: eMWarningCLR),
                                              eCLargeSizedBox(),
                                              eButton(
                                                logic,
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                title: eCancel,
                                                color: eLSuccessCLR,
                                              ),
                                              eCLargeSizedBox(),
                                              eCLargeSizedBox(),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                                /* onPressed: () async {
                              await deleteController.validateAccDeleteForm();
                            },*/
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                      eBack.tr,
                      style: logic.isDarkTheme
                          ? eDarkSmallTitleStyleSTL
                          : eLightSmallTitleStyleSTL,
                    ),
                  ],
                ),
                onPressed: () {
                  Get.offAllNamed(RoutesName.home);
                  deleteController. resetAccountDeleteField();
                },
                backgroundColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
              ),
            ),
          );
        });
      });
    });
  }
}
