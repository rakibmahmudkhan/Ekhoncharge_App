import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/payment_controller.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../settings/styles.dart';
import '../widgets/app_padding.dart';



class BkashPaymentPage extends StatefulWidget {
  const BkashPaymentPage({Key? key}) : super(key: key);

  @override
  BkashPaymentPageState createState() => BkashPaymentPageState();
}

class BkashPaymentPageState extends State<BkashPaymentPage> {
  @override
  void initState() {
    super.initState();
    Get.find<PaymentController>().resetBkashPage();
  }

  @override

  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) => GetBuilder<PaymentController>(
        builder: (paymentCtl) => Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          appBar: eAppBar(logic, title: eAddMoneyBkash.tr),
          body: SafeArea(
            child: eAppPadding(
              child: Card(
                color:   logic.isDarkTheme ? eShaddowCardColor : eLightThemeBGCLR,
                elevation: 4,
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${eUser.tr}: ${PreferenceUtils.getString(eName)}',
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL.copyWith(
                            fontWeight: FontWeight.normal)
                            : eLightMediumTextStyleSTL,
                      ),

                      eCMediumSizedBox(),
                      Text(
                        eAmount.tr,
                        style: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),
                      eCELargeSizedBox(),
                      TextFormField(
                        controller: paymentCtl.amountTxtCtl,
                        decoration: InputDecoration(
                          hintText: eEnterAmount.tr,
                          hintStyle: TextStyle(color: eHintCLR),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.pink, width: 2.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        minLines: 1,
                      ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () async {
                            paymentCtl.validateBkashFields(context);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(eBkashColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              eCheckout.tr,
                              style: eDarkSmallTitleStyleSTL.copyWith(
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<PaymentController>(builder: (paymentCtl) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eWhiteCLR,
          appBar: eAppBar(logic, title: 'Add Money bKash'),
          body: SafeArea(
              child: eAppPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Amount ',
                            style: logic.isDarkTheme
                                ? eDarkMediumTitleStyleSTL
                                : eLightMediumTitleStyleSTL),
                      ],
                    ),
                    Column(
                      //  mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('User',
                            style: logic.isDarkTheme
                                ? eDarkMediumTitleStyleSTL
                                : eLightMediumTitleStyleSTL),
                        Text((PreferenceUtils.getString(eName).toString()),
                            style: logic.isDarkTheme
                                ? eDarkMediumTextStyleSTL.copyWith(
                                    fontWeight: FontWeight.normal)
                                : eLightMediumTextStyleSTL),
                      ],
                    ),
                  ],
                ),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                TextFormField(
                  controller: paymentCtl.amountTxtCtl,
                  decoration: const InputDecoration(
                    hintText: "Enter Amount",
                    hintStyle: TextStyle(color: eHintCLR),

                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink, width: 2.0),
                    ),
                    // hintText: reviewTitle,
                  ),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  minLines: 1,
                ),
                Spacer(),

                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed:() async {
                          paymentCtl.validateBkashFields(context);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(eBkashColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "Checkout",
                            style: eDarkSmallTitleStyleSTL.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Center(
                //   child: TextButton(
                //     style: TextButton.styleFrom(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(3.0),
                //         ),
                //         backgroundColor: Colors.pink),
                //     child: const Text(
                //       "Checkout",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     onPressed: () async {
                //       paymentCtl.validateBkashFields(context);
                //     },
                //   ),
                // ),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
                eCELargeSizedBox(),
              ],
            ),
          )),
        );
      });
    });
  }*/
/*class BkashPaymentPage extends StatefulWidget {
  const BkashPaymentPage({Key? key}) : super(key: key);

  @override
  BkashPaymentPageState createState() => BkashPaymentPageState();
}

class BkashPaymentPageState extends State<BkashPaymentPage> {
  @override
  void initState() {
    super.initState();
    Get.find<PaymentController>().resetBkashPage();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<PaymentController>(builder: (paymentCtl) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          appBar: eAppBar(logic, title: 'Add Money bKash'),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Amount :',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: paymentCtl.amountTxtCtl,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 2.0),
                  ),
                  // hintText: reviewTitle,
                ),
                keyboardType: TextInputType.number,
                maxLines: 1,
                minLines: 1,
              ),
              const SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      backgroundColor: Colors.pink),
                  child: const Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    paymentCtl.validateBkashFields(context);
                  },
                ),
              ),
              eCELargeSizedBox(),
              Row(
                children: [
                  Text("User Name: ${PreferenceUtils.getString(eName)}"),
                ],
              )
            ],
          ),
        );
      });
    });
  }
}*/
