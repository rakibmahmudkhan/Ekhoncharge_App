import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/payment_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentFailurePage extends StatefulWidget {
  const PaymentFailurePage({super.key});

  @override
  State<PaymentFailurePage> createState() => _PaymentFailurePageState();
}

class _PaymentFailurePageState extends State<PaymentFailurePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<PaymentController>(builder: (paymentCtl) {
        return Scaffold(
          appBar: eAppBar(logic, title: 'Online Banking'),
          body: SafeArea(
            child: eAppPadding(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //eCMediumSizedBox(),
                Container(
                  height: Get.height * 0.8,
                  width: Get.width * 0.93,
                  decoration: BoxDecoration(color: eDSecondPrimaryCLR),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 22.0, right: 22.0, top: 20, bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Your ",
                              style: eLightMediumTitleStyleWhtSTL,
                            ),
                            Text(
                              "Online Banking ",
                              style: eWhiteELTextStyleSTL,
                            ),
                            Text(
                              "is ",
                              style: eLightMediumTitleStyleWhtSTL,
                            ),

                          ],
                        ),
                        eRSmallSizedBox(),
                        Row(
                          children: [
                            Text(
                              "Failure",
                              style: eLightMediumSuccessStyleWhtSTL.copyWith(
                                color: eMWarningCLR,
                              ),
                            ),
                          ],
                        ),
                        eCEELargeSizedBox(),
                        Row(
                          children: [
                            Text(
                              "Recipient's Account Number ",
                              style: eLightMediumHintWthSTL,
                            ),
                            Text(
                              " Id of Account",
                              style: eLightMediumTitleStyleWhtSTL,
                            ),
                          ],
                        ),
                        eCEELargeSizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // mainAxisAlignment:  MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time ",
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                                Text(
                                  DateTime.now().toString().substring(0, 10),
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment:  MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transaction ID ",
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                                Text(
                                  paymentCtl.currentTransactionId,
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                              ],
                            )
                          ],
                        ),
                        eCEELargeSizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              // mainAxisAlignment:  MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total ",
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                                Text(
                                  "৳ ${paymentCtl.currentAmount} ",
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                                Text(
                                  "+ No Charge ",
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                              ],
                            ),
                            Column(
                              // mainAxisAlignment:  MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Source ",
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                                Text(
                                  "Mobile Banking",
                                  style: eLightMediumTitleStyleWhtSTL,
                                ),
                              ],
                            )
                          ],
                        ),
                        eCEELargeSizedBox(),
                        Spacer(),
                        SizedBox(
                          width: double.maxFinite,
                          child: eButton(
                            logic,
                            title: "Back to Home",
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        );
      });
    });
  }
}
