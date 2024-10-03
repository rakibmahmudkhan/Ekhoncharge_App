import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/divider.dart';
import 'package:ekhoncharge/widgets/menu_title.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/app_system_controller.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  final AuthController authController = Get.find();

  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authLogic) {
        return Scaffold(
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            resizeToAvoidBottomInset: false,
            appBar: eHomeAppBarWithoutBalance(logic, authController),
            body: Background(
              isActive: logic.isDarkTheme,
              opacity: false,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: eAppPadding(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        eCLargeSizedBox(),

                        /*eDivider(logic),
                        eMenuTitle(
                          logic,
                          title: eAddPromoCode.tr,
                          arrow: Icons.arrow_forward_ios,
                          onPressed: () {
                            Get.toNamed(RoutesName.promoCodePage);
                          },
                        ),*/

                        eMenuTitle(
                          logic,
                          title: eChargingFAQ.tr,
                          arrow: Icons.arrow_forward_ios,
                          onPressed: () {
                            Get.toNamed(RoutesName.chargingFaqPage);
                          },
                        ),
                        eDivider(logic),
                        eMenuTitle(
                          logic,
                          title: ePrivacyLegacy.tr,
                          arrow: Icons.arrow_forward_ios,
                          onPressed: () {
                            Get.toNamed(RoutesName.privacyPolicy);
                          },
                        ),
                        eDivider(logic),
                        eMenuTitle(
                          logic,
                          title: eDeleteAccount.tr,
                          arrow: Icons.arrow_forward_ios,
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
                                          eAreYouSureTxt.tr,
                                          style: logic.isDarkTheme
                                              ? eDarkLTextStyleSTL
                                              : eLightLTextStyleSTL,
                                        ),
                                        eCLargeSizedBox(),
                                        eCLargeSizedBox(),
                                        Text(
                                          eDeleteTxt.tr,
                                          style: logic.isDarkTheme
                                              ? eDarkMediumTextStyleSTL
                                              : eLightMediumTextStyleSTL,
                                          textAlign: TextAlign.justify,
                                        ),
                                        eCLargeSizedBox(),
                                        eCLargeSizedBox(),
                                        eButton(logic, onPressed: () {
                                          Get.offAllNamed(
                                              RoutesName.accountDeletionPage);
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
                          },
                        ),
                        eDivider(logic),
                        eMenuTitle(
                          logic,
                          title: eContactUs.tr,
                          arrow: Icons.arrow_forward_ios,
                          onPressed: () {
                            Get.toNamed(RoutesName.contactUsPage);
                          },
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
            ));
      });
    });
  }
}
