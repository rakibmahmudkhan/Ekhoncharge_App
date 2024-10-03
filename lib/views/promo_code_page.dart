import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/coupon_widget.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:ekhoncharge/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PromoCodePage extends StatefulWidget {
  const PromoCodePage({Key? key}) : super(key: key);

  @override
  State<PromoCodePage> createState() => _PromoCodePageState();
}

class _PromoCodePageState extends State<PromoCodePage> {
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authLogic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          appBar: eHomeAppBarWithoutBalance(logic,authController),
          body: SafeArea(
            child: eAppPadding(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    eCMediumSizedBox(),
                    eCMediumSizedBox(),
                    Center(
                      child: Text(
                        "Add a Promo Code",
                        style: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),
                    ),
                    eCMediumSizedBox(),
                    eCMediumSizedBox(),
                    SizedBox(
                      height: Get.height * 0.063,
                      width: double.maxFinite,
                      child: Card(
                        color:
                            logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
                        elevation: 5,
                        shadowColor:
                            logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
                        child: eNewTextFiled(
                          authLogic.couponTxtCtl,
                          inputType: TextInputType.text,
                          style: logic.isDarkTheme
                              ? eDarkMediumTextStyleSTL
                              : eLightMediumTextStyleSTL,
                          colorr: logic.isDarkTheme
                              ? eDSecondPrimaryCLR
                              : eWhiteCLR,
                          enableColor: logic.isDarkTheme
                              ? Colors.transparent
                              : eLightThemeBorderCLR,
                          focusColor: logic.isDarkTheme
                              ? Colors.transparent
                              : eLightThemeBorderCLR,
                          hint: "Redeem Coupon",
                          hintStyle: logic.isDarkTheme
                              ? eLightMediumHintWthSTL
                              : eLightMediumHintSTL,
                          prefixWidget:
                              // FaIcon(FontAwesomeIcons.gift, size:eSmallIcon ,),

                              Icon(
                            Icons.card_giftcard,
                            size: eSmallIcon,
                            color: logic.isDarkTheme ? eWhiteCLR : eHintCLR,
                          ),
                        ),
                      ),
                    ),
                    eCMediumSizedBox(),
                    eCMediumSizedBox(),
                    Center(
                        child:
                        eButton(logic, title: "Apply", onPressed: () {})),
                    eCMediumSizedBox(),
                    eCMediumSizedBox(),
                    Text(
                      "Coupon:",
                      style: logic.isDarkTheme
                          ? eDarkSmallTextStyleSTL
                          : eLightSmallTextStyleSTL,
                    ),
                    eCMediumSizedBox(),
                    CouponWidget(
                      widgets: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: eWhiteCLR,
                                          radius: 20.0,
                                          child: Icon(
                                            Icons.card_giftcard,
                                            color: Colors.black,
                                            size: eSemiMediumIcon,
                                          ),
                                        ),
                                        eCELargeSizedBox(),
                                        Text(
                                          "Expire",
                                          style: logic.isDarkTheme
                                              ? eDarkSmallTitleStyleSTL
                                              : eLightSmallTitleStyleSTL,
                                        ),
                                        Text(
                                          "19.12.23",
                                          style: logic.isDarkTheme
                                              ? eDarkSmallTextStyleSTL
                                              : eLightSmallTextStyleSTL,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Coupon",
                                          style: logic.isDarkTheme
                                              ? eDarkSmallTitleStyleSTL
                                              : eLightSmallTitleStyleSTL,
                                        ),
                                        Text(
                                          "3E4RF51TS",
                                          style: logic.isDarkTheme
                                              ? eDarkSmallTextStyleSTL
                                              : eLightSmallTextStyleSTL,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: eWhiteCLR,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: logic.isDarkTheme
                                                ? Colors.transparent
                                                : eLightThemeBorderCLR,
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 2),
                                        child: Text("100 ৳",
                                            style: logic.isDarkTheme
                                                ? eLightMediumTitleStyleSTL
                                                : eLightMediumTitleStyleSTL),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            focusElevation: 2,
            elevation: 4,
            label: Row(
              children: [
                FaIcon(
                  Icons.arrow_back_ios,
                  color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                  size: eESmallIcon,
                ),
                // SizedBox(width: 5,),
                Text(
                  "  Back",
                  style: logic.isDarkTheme
                      ? eDarkSmallTitleStyleSTL
                      : eLightSmallTitleStyleSTL,
                ),
              ],
            ),
            onPressed: () {
              Get.back();
            },
            backgroundColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
          ),
        );
      });
    });
  }
}
