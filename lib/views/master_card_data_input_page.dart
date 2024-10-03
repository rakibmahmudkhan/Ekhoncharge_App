import 'dart:math';

import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:ekhoncharge/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MasterCardDataInputPage extends StatefulWidget {
  const MasterCardDataInputPage({super.key});

  @override
  State<MasterCardDataInputPage> createState() => _MasterCardDataInputPageState();
}

class _MasterCardDataInputPageState extends State<MasterCardDataInputPage> {
  String accountNumber = "01955667788";
  String month = " ";
  String year = " ";
  String cvv = " ";

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHoldersNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String amount = arguments["amount"] ?? '';
    String title = arguments['title'] ?? '';
    String imageUrl = arguments['imgUrl'] ?? '';

    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
        appBar: eAppBarWithoutProfile(logic, title: "Card to My Wallet"),
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
                Card(
                  elevation: 2,
                  color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                  child: Container(
                      height: Get.height * 0.9,
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                        color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        boxShadow: [
                          // BoxShadow(
                          //   color: eCardColor ,
                          //   spreadRadius: 5,
                          //   blurRadius: 7,
                          //   offset: Offset(1, 1), // changes position of shadow
                          // ),
                        ],
                        border: Border.all(
                            width: 1,
                            color: logic.isDarkTheme
                                ? eDarkThemeBGCLR
                                : eLightThemeBorderCLR),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: eAppPadding(
                        child: Column(
                          children: [
                            eCLargeSizedBox(),
                            Card(
                              color: logic.isDarkTheme
                                  ? eDarkThemeBGCLR
                                  : eWhiteCLR,
                              shadowColor: logic.isDarkTheme
                                  ? eShaddowColor
                                  : eLightThemeBorderCLR,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color:logic.isDarkTheme
                                    ? eDarkThemeBGCLR
                                    : eLightThemeBorderCLR )

                                  ,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Recipient",
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTitleStyleSTL
                                                : eLightSmallTitleStyleSTL,
                                          ),
                                          Text(
                                            accountNumber,
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Amount Details",
                                                  style: logic.isDarkTheme
                                                      ? eDarkSmallTitleStyleSTL
                                                      : eLightSmallTitleStyleSTL,
                                                ),
                                                Text(
                                                  "Transfer Amount:",
                                                  style: logic.isDarkTheme
                                                      ? eDarkSmallTextStyleSTL
                                                          .copyWith(
                                                              fontSize:
                                                                  eESFontSize)
                                                      : eLightSmallTextStyleSTL
                                                          .copyWith(
                                                              fontSize:
                                                                  eESFontSize),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(""),
                                                Text(
                                                  "$amount BDT",
                                                  style: logic.isDarkTheme
                                                      ? eDarkSmallTitleStyleSTL
                                                          .copyWith(
                                                              fontSize:
                                                                  eESFontSize)
                                                      : eLightSmallTitleStyleSTL
                                                          .copyWith(
                                                              fontSize:
                                                                  eESFontSize),
                                                ),
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),
                            Card(
                              color: logic.isDarkTheme
                                  ? eDarkThemeBGCLR
                                  : eWhiteCLR,
                              shadowColor: logic.isDarkTheme
                                  ? eShaddowColor
                                  : eLightThemeBorderCLR,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.25,
                                          child: Image.asset(
                                            imageUrl,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Text(
                                          "$title Card",
                                          style: logic.isDarkTheme
                                              ? eDarkMediumTitleStyleSTL
                                              : eLightMediumTitleStyleSTL,
                                        ),
                                      ],
                                    ),
                                    eCLargeSizedBox(),
                                    eCLargeSizedBox(),
                                    Text(
                                      "*Card Number:",
                                      style: logic.isDarkTheme
                                          ? eDarkSmallTextStyleSTL
                                          : eLightSmallTextStyleSTL,
                                    ),
                                    eCSmallSizedBox(),
                                    Container(

                                      decoration:BoxDecoration( border: Border.all(
                                          width: 1,
                                          color: logic.isDarkTheme
                                              ? eCardColor
                                              : eLightThemeBorderCLR),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4),
                                        ),),
                                      child: TextField(
                                        cursorColor: logic.isDarkTheme
                                            ? eWhiteCLR
                                            : eBlackCLR,
                                        decoration: InputDecoration(

                                          fillColor: logic.isDarkTheme
                                              ? eCardColor
                                              : eWhiteCLR,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: logic.isDarkTheme
                                                      ? eCardColor
                                                      : eLightThemeBorderCLR,
                                                  width: 1)),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: logic.isDarkTheme
                                                    ? eCardColor
                                                    : eLightThemeBorderCLR,
                                                width: 1),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: logic.isDarkTheme
                                                    ? eCardColor
                                                    : eLightThemeBorderCLR,
                                                width: 1),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        controller: cardNumberController,
                                      ),
                                    ),
                                    eCLargeSizedBox(),
                                    eCLargeSizedBox(),
                                    Text(
                                      "Cardholder's Name:",
                                      style: logic.isDarkTheme
                                          ? eDarkSmallTextStyleSTL
                                          : eLightSmallTextStyleSTL,
                                    ),
                                    eCSmallSizedBox(),
                                    Container(
                                      decoration:BoxDecoration( border: Border.all(
                                          width: 1,
                                          color: logic.isDarkTheme
                                              ? eCardColor
                                              : eLightThemeBorderCLR),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4),
                                        ),),
                                      child: TextField(
                                        cursorColor: logic.isDarkTheme
                                            ? eWhiteCLR
                                            : eBlackCLR,
                                        decoration: InputDecoration(
                                          fillColor: logic.isDarkTheme
                                              ? eCardColor
                                              : eWhiteCLR,
                                          filled: true,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: logic.isDarkTheme
                                                      ? eCardColor
                                                      : eLightThemeBorderCLR,
                                                  width: 1)),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: logic.isDarkTheme
                                                    ? eCardColor
                                                    : eLightThemeBorderCLR,
                                                width: 1),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: logic.isDarkTheme
                                                    ? eCardColor
                                                    : eLightThemeBorderCLR,
                                                width: 1),
                                          ),
                                        ),

                                        controller: cardHoldersNameController,
                                      ),
                                    ),
                                    eCLargeSizedBox(),
                                    eCLargeSizedBox(),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                "*Expiry Date:",
                                                style: logic.isDarkTheme
                                                    ? eDarkSmallTextStyleSTL
                                                    : eLightSmallTextStyleSTL,
                                              ),
                                              eCSmallSizedBox(),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: eValueNumberTextField(month ,logic,hint: "MM")
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                      child: eValueNumberTextField(year ,logic,hint: "YY")
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                "*CVV:",
                                                style: logic.isDarkTheme
                                                    ? eDarkSmallTextStyleSTL.copyWith(letterSpacing: 2.5)
                                                    : eLightSmallTextStyleSTL,
                                              ),
                                              eCSmallSizedBox(),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child:   eValueNumberTextField(cvv ,logic,hint: "C V V")
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    eCLargeSizedBox(),
                                    eCLargeSizedBox(),
                                    eLoginButton(onPressed: (){},title: "Continue"),eCLargeSizedBox(),
                                    eCLargeSizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          )),
        ),
      );
    });
  }
}
