import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/divider.dart';
import 'package:ekhoncharge/widgets/menu_title.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final AuthController authController = Get.find();

  @override
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
                      eMenuTitle(
                        logic,
                        title: ePaymentPlans.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {},
                      ),
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: ePremiumOffers.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.premiumOffersPage);
                        },
                      ),
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: eAddPromoCode.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.promoCodePage);
                        },
                      ),
                      eDivider(logic),
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
                        onPressed: () {},
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
                      eDivider(logic),
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
                      eDivider(logic),
                      eVersionTitle(
                        logic,
                        title: eAppVersion.tr,
                        versionNumber: eAppVersionTxt.tr,
                      ),
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: eLogoutTxt.tr,
                        arrow: Icons.login,
                        onPressed: () {
                          eLogout();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
