import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/divider.dart';
import 'package:ekhoncharge/widgets/menu_title.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_system_controller.dart';

class ProfileNavPage extends StatefulWidget {
  const ProfileNavPage({super.key});

  @override
  State<ProfileNavPage> createState() => _ProfileNavPageState();
}

class _ProfileNavPageState extends State<ProfileNavPage> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final userModel = authController.userModel;
    final userName = userModel.user!.name ?? "User Name";
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authLogic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          //   appBar: eHomeAppBarWithoutBalance(logic,authController),
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
                      Center(
                          child: Text(
                        eProfile.tr,
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL
                            : eLightMediumTextStyleSTL,
                      )),
                      eCMediumSizedBox(),
                      Center(
                        child: SizedBox(
                          //height: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 12.0, bottom: 4.0),
                            child: userModel.user?.imagePath != null &&
                                    userModel.user?.imagePath != ''
                                ? InkWell(
                                    onTap: () {
                                      Get.toNamed(RoutesName.profileSetupPage);
                                    },
                                    child: CircleAvatar(
                                      radius: 55.0,
                                      backgroundColor: Colors.grey[200],
                                      backgroundImage: NetworkImage(
                                          '${APIConfig.imageURL}${userModel.user?.imagePath}'),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      Get.toNamed(RoutesName.profileSetupPage);
                                    },
                                    child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundColor: Colors.grey[200],
                                        backgroundImage: const AssetImage(
                                            'assets/images/placeholder-profile.jpg')),
                                  ),
                          ),
                        ),
                      ),
                      eCMediumSizedBox(),
                      Center(
                        child: Text(
                          userName.toString(),
                          style: logic.isDarkTheme
                              ? eDarkSmallTitleStyleSTL
                              : eLightSmallTitleStyleSTL,
                        ),
                      ),
                      eCLargeSizedBox(),
                      eMenuTitle(
                        logic,
                        title: eEditProfile.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.profileSetupPage);
                        },
                      ),
                      /* eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: ePaymentPlans.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {},
                      ),*/

                      /*   eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: ePremiumOffers.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.premiumOffersPage);
                        },
                      ),*/
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: eSetting.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.settingPage);
                        },
                      ),
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: eAddAnotherCar.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.selectCarPage);
                        },
                      ),
                      /* eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: "View Slot",
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.viewSlotPage);
                        },
                      ),
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: "Slot Booked Details",
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.slotBookedPage);
                        },
                      ),*/
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: eRegisteredCarDetails.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.viewRegisteredCarPage);
                        },
                      ),
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: eChangePassword.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.changePasswordPage);
                        },
                      ),
                      eDivider(logic),
                      eMenuTitle(
                        logic,
                        title: eExploreStations.tr,
                        arrow: Icons.arrow_forward_ios,
                        onPressed: () {
                          Get.toNamed(RoutesName.allStationInGoogleMapPage);
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
