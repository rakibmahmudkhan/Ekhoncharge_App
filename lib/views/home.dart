import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/controller/wallet_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/views/qr_scan_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WalletController>().fetchWalletData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      showIgnore: false,
      showLater: false,
      canDismissDialog: false,
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(minutes: 30),
      ),
      child: GetBuilder<AppSystemController>(builder: (logic) {
        return GetBuilder<HomeController>(
          builder: (homeController) {
            return Scaffold(
              body: SafeArea(
                child: CurvedNavBar(
                  navBarBackgroundColor:
                      logic.isDarkTheme ? eCardColor : eWhiteCLR,
                  extendBody: true,
                  actionButton: CurvedActionBar(
                    onTab: (value) {},
                    activeIcon: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                          shape: BoxShape.circle),
                      child: FaIcon(
                        FontAwesomeIcons.qrcode,
                        color: logic.isDarkTheme ? eWhiteCLR : eDPrimaryCLR2,
                        size: 34,
                      ),
                    ),
                    inActiveIcon: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                          shape: BoxShape.circle),
                      child: FaIcon(
                        FontAwesomeIcons.qrcode,
                        color:
                            logic.isDarkTheme ? eLSecondaryCLR : eLSecondaryCLR,
                        size: 34,
                      ),
                    ),
                    text: eQrScanTxt.tr,
                  ),
                  activeColor: logic.isDarkTheme ? eWhiteCLR : eDPrimaryCLR2,
                  inActiveColor:
                      logic.isDarkTheme ? eLSecondaryCLR : eLSecondaryCLR,
                  appBarItems: [
                    FABBottomAppBarItem(
                        activeIcon: FaIcon(
                          FontAwesomeIcons.house,
                          size: 20,
                          color: logic.isDarkTheme ? eWhiteCLR : eDPrimaryCLR2,
                        ),
                        inActiveIcon: FaIcon(
                          FontAwesomeIcons.house,
                          size: 20,
                          color: logic.isDarkTheme
                              ? eLSecondaryCLR
                              : eLSecondaryCLR,
                        ),
                        text: eOverview.tr),
                    FABBottomAppBarItem(
                        activeIcon: FaIcon(
                          FontAwesomeIcons.wallet,
                          size: 20,
                          color: logic.isDarkTheme ? eWhiteCLR : eDPrimaryCLR2,
                        ),
                        inActiveIcon: FaIcon(
                          FontAwesomeIcons.wallet,
                          size: 20,
                          color: logic.isDarkTheme
                              ? eLSecondaryCLR
                              : eLSecondaryCLR,
                        ),
                        text: eWalletTxt.tr),
                    FABBottomAppBarItem(
                        activeIcon: FaIcon(
                          FontAwesomeIcons.chargingStation,
                          size: 20,
                          color: logic.isDarkTheme ? eWhiteCLR : eDPrimaryCLR2,
                        ),
                        inActiveIcon: FaIcon(
                          FontAwesomeIcons.chargingStation,
                          size: 20,
                          color: logic.isDarkTheme
                              ? eLSecondaryCLR
                              : eLSecondaryCLR,
                        ),
                        text: eStation.tr),
                    FABBottomAppBarItem(
                      activeIcon: FaIcon(
                        Icons.person,
                        size: 20,
                        color: logic.isDarkTheme ? eWhiteCLR : eDPrimaryCLR2,
                      ),
                      inActiveIcon: FaIcon(
                        Icons.person,
                        size: 20,
                        color:
                            logic.isDarkTheme ? eLSecondaryCLR : eLSecondaryCLR,
                      ),
                      text: eProfile.tr,
                    ),
                  ],
                  bodyItems: homeController.getHomeBody(),
                  actionBarView: const QrScanPage(),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
