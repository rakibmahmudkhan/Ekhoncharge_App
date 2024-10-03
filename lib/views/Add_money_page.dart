import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/add_money_card.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({super.key});

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
        appBar: eAppBarWithoutProfile(logic, title: eAddMoney.tr),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.9,
                        child: Text(
                          eAddMoneySource.tr,
                          textAlign: TextAlign.center,
                          style:
                              eDarkSmallTextStyleSTL.copyWith(color: eHintCLR),
                          maxLines: 1,
                        ),
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
                        AddMoneyCard(logic, onPressed: () {
                          Get.toNamed(RoutesName.mobileBankingTypePage);
                        },
                            title: eMobileBanking.tr,
                            icon: Icons.phone_android_sharp),
                      /*  AddMoneyCard(logic, onPressed: () {
                          Get.toNamed(RoutesName.cardBankingTypePage);
                        }, title: eCard.tr, icon: FontAwesomeIcons.creditCard),*/
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
