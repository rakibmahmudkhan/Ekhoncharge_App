import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/charger_box_controller.dart';
import 'package:ekhoncharge/controller/pusher_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChargerConnectMessagePage extends StatefulWidget {
  const ChargerConnectMessagePage({super.key});

  @override
  State<ChargerConnectMessagePage> createState() =>
      _ChargerConnectMessagePageState();
}

class _ChargerConnectMessagePageState extends State<ChargerConnectMessagePage>
    with WidgetsBindingObserver {
  var mChargerBoxCtl = Get.find<ChargerBoxController>();
  PusherController mPusherController = Get.put(PusherController());

  @override
  void initState() {
    super.initState();
    // mChargerBoxCtl.fetchChargerPointCtl(isAuto: false);
    // WidgetsBinding.instance.addObserver(this);
    mPusherController.isInitial = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mChargerBoxCtl.fetchChargerPointCtl();
    });
  }

  @override
  void dispose() {
    super.dispose();
    // pusherController.onDisConnectAndUnsubscribeFromPusher();
    // mChargerBoxCtl.cancelTimer();
    // WidgetsBinding.instance.removeObserver(this);
    // super.dispose();
  }

  @override
  void deactivate() {
    mPusherController.onDisConnectAndUnsubscribeFromPusher();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<PusherController>(builder: (pusherCtl) {
        print(pusherCtl.isChargerPointWidget);
        return GetBuilder<ChargerBoxController>(builder: (chargerBoxCtl) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            body: SafeArea(
              child: pusherCtl.isInitial
                  ? pusherCtl.setInitialChargerPointsWidget(
                      chargerBoxCtl, logic)
                  : pusherCtl.isChargerPointWidget
                      ? pusherCtl.customWidgetRender(chargerBoxCtl)
                      : pusherCtl.mOnPusherEvent(logic, chargerBoxCtl),
            ),
          );
        });
      });
    });
  }
}
