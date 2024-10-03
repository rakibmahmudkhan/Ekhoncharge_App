import 'dart:io';
import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/utils/curved_navbar_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

AppBar eAppBar(AppSystemController logic, {String? title}) {
  return AppBar(
    backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
    elevation: 0,
    iconTheme: IconThemeData(
      color: logic.isDarkTheme ? eWhiteCLR : eDarkThemeBGCLR,
    ),
    title: Text(
      title ?? '',
      style: logic.isDarkTheme
          ? eDarkMediumTitleStyleSTL
          : eLightMediumTitleStyleSTL,
      textAlign: TextAlign.center,
    ),
  );
}

AppBar eAppBarWithoutProfile(AppSystemController logic, {String? title}) {
  return AppBar(
    toolbarHeight: 70,
    shape: CurvedAppBarShape(),
    elevation: 1,
    automaticallyImplyLeading: false,
    backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
    title: Text(
      title!,
      style: logic.isDarkTheme
          ? eDarkSmallTitleStyleSTL
          : eLightSmallTitleStyleSTL,
    ),
    centerTitle: true,
    flexibleSpace: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                size: eSmallIcon,
              ),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage(
                  logic.isDarkTheme ? eDarkAppLogo : eLightAppLogo,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

AppBar eHomeAppBarWithoutBalance(
    AppSystemController logic, AuthController authController,
    {String? title}) {
  final userModel = authController.userModel;
  // final userName = userModel.user!.name ?? "User Name";
  final userName = userModel.user?.customer?.title ?? "User Name";
  return AppBar(
    automaticallyImplyLeading: false,
    shape: CurvedAppBarShape(),
    toolbarHeight: 70,
    elevation: 1,
    backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
    flexibleSpace: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 12.0, bottom: 4.0),
              child: userModel.user?.imagePath != null &&
                      userModel.user?.imagePath != ''
                  ? InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.profileSetupPage);
                      },
                      child: CircleAvatar(
                        radius: 25.0,
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
            Text(
              userName.toString(),
              style: logic.isDarkTheme
                  ? eDarkSmallTitleStyleSTL
                  : eLightSmallTitleStyleSTL,
            ),
            Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.notification_important,
                  color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                  size: eMediumIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

AppBar eHomeAppBarWithBalance(AppSystemController logic,
    AuthController authController, balance, appBarKey, scaffoldKey) {
  final userModel = authController.userModel;
  final userName = userModel.user?.customer?.title ?? "User Name";
  return AppBar(
    automaticallyImplyLeading: false,
    shape: CurvedAppBarShape(),
    toolbarHeight: 70,
    elevation: 1,
    backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
    key: appBarKey,
    flexibleSpace: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 12.0, bottom: 4.0),
              child: userModel.user?.imagePath != null &&
                      userModel.user?.imagePath != ''
                  ? InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.profileSetupPage);
                      },
                      child: CircleAvatar(
                        radius: 25.0,
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
                            'assets/images/placeholder-profile.jpg'),
                      ),
                    ),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //User Name
                Text(
                  userName.toString(),
                  style: logic.isDarkTheme
                      ? eDarkSmallTitleStyleSTL
                      : eLightSmallTitleStyleSTL,
                ),

                const SizedBox(
                  height: 5,
                ),

                //Button
                InkWell(
                  onTap: authController.animate,
                  child: Container(
                    width: 145,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: logic.isDarkTheme
                                ? Colors.transparent
                                : eDPrimaryCLR2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    // borderRadius: BorderRadius.circular(50)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        //Amount
                        AnimatedOpacity(
                            opacity: authController.isBalanceShown ? 1 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: Text('$balance',
                                style: logic.isDarkTheme
                                    ? eLightSmallTextStyleSTL
                                    : eLightSmallTextStyleSTL)),

                        //Balance
                        AnimatedOpacity(
                            opacity: authController.isBalance ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              eTapForBalance.tr,
                              style: logic.isDarkTheme
                                  ? eLightSmallTitleStyleSTL.copyWith(
                                      fontSize: eESFontSize)
                                  : eLightSmallTitleStyleSTL.copyWith(
                                      fontSize: eESFontSize),
                            )),

                        //Circle
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 1100),
                          left: authController.isAnimation == false ? 5 : 120,
                          curve: Curves.fastOutSlowIn,
                          child: Container(
                            height: 20,
                            width: 20,
                            // padding: const EdgeInsets.only(bottom: 4),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: eDPrimaryCLR2,
                                borderRadius: BorderRadius.circular(50)),
                            child: const FittedBox(
                              child: Text(
                                '৳',
                                style: TextStyle(
                                    color: eWhiteCLR, fontSize: eESFontSize),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 12.0),
        child: InkWell(
          onTap: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeEndDrawer();
              //close drawer, if drawer is open
            } else {
              scaffoldKey.currentState!.openEndDrawer();
              //open drawer, if drawer is closed
            }
          },
          child: SizedBox(
            width: 60,
            height: 60,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage(
                logic.isDarkTheme ? eDarkAppLogo : eLightAppLogo,
              ),
            ),
          ),
        ),
      )
    ],
  );
}
