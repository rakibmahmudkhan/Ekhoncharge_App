import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/views/bkash_payment_page.dart';
import 'package:ekhoncharge/widgets/add_money_card.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/app_system_controller.dart';
import '../widgets/appBar.dart';
import '../widgets/sized_boxes.dart';

class MobileBankingTypePage extends StatefulWidget {
  const MobileBankingTypePage({super.key});

  @override
  State<MobileBankingTypePage> createState() => _MobileBankingTypePageState();
}

class _MobileBankingTypePageState extends State<MobileBankingTypePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
        appBar: eAppBarWithoutProfile(logic, title: eBankToMyWallet.tr),
        body: SafeArea(
          child: eAppPadding(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                eCMediumSizedBox(),
                eCMediumSizedBox(),
                eCMediumSizedBox(),
                Container(
                  height: Get.height * 0.06,
                  width: Get.width * 1,
                  decoration: BoxDecoration(
                    color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                    border: Border.all(
                        width: 1,
                        color: logic.isDarkTheme
                            ? eCardColor
                            : eLightThemeBorderCLR),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:Get.width*0.9,
                        child: Text(eAddMoneySource.tr,
                            textAlign: TextAlign.center,
                            style: eDarkSmallTextStyleSTL.copyWith(
                              color: eHintCLR,
                            ),
                        maxLines: 1,),
                      ),
                    ],
                  ),
                ),
                eCMediumSizedBox(),
                Container(
                    height: Get.height * 0.75,
                    width: Get.width * 1,
                    decoration: BoxDecoration(
                      color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                      border: Border.all(
                          width: 1,
                          color: logic.isDarkTheme
                              ? eCardColor
                              : eLightThemeBorderCLR),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Column(
                      children: [
                        MobileBankigCard(logic, onPressed: () {
                          Get.toNamed(RoutesName.bkashPaymentPage);

                        }, title: eBkash.tr, url: "assets/icons/bkash.png"),
                        /*MobileBankigCard(logic,
                            onPressed: () {},
                            title: eNagad.tr,
                            url: "assets/icons/Nagad_icon.png"),
                        MobileBankigCard(logic,
                            onPressed: () {},
                            title:  eRocket.tr,
                            url: "assets/icons/Rocket_icon.png"),*/
                      ],
                    )),
              ],
            ),
          )),
        ),
      );
    });
  }
}
