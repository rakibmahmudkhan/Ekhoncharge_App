import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/add_money_card.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/my_custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/app_system_controller.dart';
import '../widgets/appBar.dart';
import '../widgets/sized_boxes.dart';

class CardBankingType extends StatefulWidget {
  const CardBankingType({super.key});

  @override
  State<CardBankingType> createState() => _CardBankingTypeState();
}

class _CardBankingTypeState extends State<CardBankingType> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
        appBar: eAppBarWithoutProfile(logic, title: eCardToMyWallet.tr),
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
                        child: Text(
                          eSelectDebitCardToAddMoney.tr,
                          textAlign: TextAlign.center,
                          style: eDarkSmallTextStyleSTL.copyWith(color: eHintCLR),
                          maxLines: 2,

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
                        MobileBankigCard(logic, onPressed: () {
                          showVisaCardAlert(context, logic ,title: eMaster.tr ,imgUrl: "assets/icons/Mastercard_icon.png" );
                        },
                            title: eMasterCard.tr,
                            url: "assets/icons/Mastercard_icon.png"),
                        MobileBankigCard(logic,
                            onPressed: () {
                              showVisaCardAlert(context, logic ,title: eVISA.tr ,imgUrl: "assets/icons/Visa_icon.png" );


                            },
                            title: eVISA.tr,
                            url: "assets/icons/Visa_icon.png"),
                      ],
                    )),
              ],
            ),
          )),
        ),
      );
    });
  }

  Future<dynamic> showVisaCardAlert(
      BuildContext context, AppSystemController logic,
      {String? title, String? imgUrl}) async {
    String accountNumber = "01955667788";
    String amount = " ";

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                  width: 1,
                  color: logic.isDarkTheme
                      ? eDarkThemeBGCLR
                      : eLightThemeBorderCLR)),
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8),
            child: Center(
              child: Text(
                "$title ${eCardPayment.tr} ",
                style: logic.isDarkTheme
                    ? eDarkSmallTitleStyleSTL
                    : eLightSmallTitleStyleSTL,
              ),
            ),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: logic.isDarkTheme ? eDarkThemeBGCLR : eWhiteCLR,
              // border: Border.all(
              //     width: 1,
              //     color: logic.isDarkTheme
              //         ? eCardColor
              //         : eLightThemeBorderCLR),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eCLargeSizedBox(),
                Text(
                  eAccountNumber.tr,
                  style: logic.isDarkTheme
                      ? eDarkSmallTextStyleSTL
                      : eLightSmallTextStyleSTL,
                ),
                eCMediumSizedBox(),
                Container(
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
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(accountNumber),
                      )
                    ],
                  ),
                ),
                eCLargeSizedBox(),
                Text(
                  eEnterAmount.tr,
                  style: logic.isDarkTheme
                      ? eDarkSmallTextStyleSTL
                      : eLightSmallTextStyleSTL,
                ),
                eCMediumSizedBox(),
                TextField(
                  cursorColor: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                  decoration: InputDecoration(
                    fillColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: logic.isDarkTheme
                                ? eCardColor
                                : eLightThemeBorderCLR,
                            width: 1)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: logic.isDarkTheme
                          ? eCardColor
                          : eLightThemeBorderCLR,
                          width: 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: logic.isDarkTheme
                          ? eCardColor
                          : eLightThemeBorderCLR,
                          width: 1),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    amount = value;
                  },
                ),
                eCLargeSizedBox(),
                eCLargeSizedBox(),
                eCLargeSizedBox(),
                SizedBox(
                  width: Get.width * 0.9,
                  child: eLoginButton(
                      title: "Continue",
                      onPressed: () {
                        _validateAndContinue(context, amount, logic, title:title, imgUrl: imgUrl);


                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _validateAndContinue(
      BuildContext context, String amount, AppSystemController logic,
      {String? title, String? imgUrl}) {
    if (double.tryParse(amount) == null || double.parse(amount) <= 50) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 100,
            child: AlertDialog(
              backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                      width: 1,
                      color: logic.isDarkTheme
                          ? eDarkThemeBGCLR
                          : eLightThemeBorderCLR)),
              actions: [
                Text(eEnterMoreThan50Tk.tr,style:logic.isDarkTheme
                  ? eDarkSmallTextStyleSTL
                  : eLightSmallTextStyleSTL,),
                eMyCustomerButton(eOk.tr, color: eDPrimaryCLR2, onTap: () {
                  Get.back();
                })
              ],
            ),
          );
        },
      );
    } else {
     Get.toNamed(RoutesName.masterCardDataInputPage, arguments: {"amount":amount,"title":title, "imgUrl":imgUrl}  );
    }
  }
}
