import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
 import 'package:ekhoncharge/widgets/sized_boxes.dart';
 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PremiumOffersPage extends StatefulWidget {
  const PremiumOffersPage({Key? key}) : super(key: key);

  @override
  State<PremiumOffersPage> createState() => _PremiumOffersPageState();
}

class _PremiumOffersPageState extends State<PremiumOffersPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authLogic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          appBar: eHomeAppBarWithoutBalance(logic, authLogic),
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
                    Container(
                      decoration: BoxDecoration(
                        color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: logic.isDarkTheme
                              ? eCardColor
                              : eLightThemeBorderCLR,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: eLightThemeBorderCLR,
                            spreadRadius: 0.3,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                            blurStyle: BlurStyle.normal,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                         // eCMediumSizedBox(),
                          eCMediumSizedBox(),
                          Center(
                            child: Text(
                              "Premium Offers",
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                          ),
                          eCMediumSizedBox(),
                          eCMediumSizedBox(),
                          ListTile(
                            title: Text(
                              'PowerPlus Pro',
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL.copyWith(
                                      fontWeight: FontWeight.w400)
                                  : eLightMediumTitleStyleSTL.copyWith(
                                      fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              'Upgrade your charging experience',
                              style: logic.isDarkTheme
                                  ? eDarkSmallTextStyleSTL
                                  : eLightSmallTextStyleSTL.copyWith(color: eDblackTextColor),
                            ),
                          ),
                            ListTile(
                            leading: Icon(Icons
                                .flash_on,color: logic.isDarkTheme?eWhiteCLR:eDblackIconColor,), // Icon indicating faster charging.
                            title: Text('Faster Charging Speeds',
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400)
                                  : eLightMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400),),
                            subtitle: Text(
                                'Up to 30% faster charging at dedicated stations.',
                              style: logic.isDarkTheme
                                  ? eDarkSmallTextStyleSTL
                                  : eLightSmallTextStyleSTL.copyWith(color: eDblackTextColor),),
                          ),
                            ListTile(
                            leading: Icon(Icons
                                .priority_high,color: logic.isDarkTheme?eWhiteCLR:eDblackIconColor,), // Icon indicating priority access.
                            title: Text('Priority Charging',
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400)
                                  : eLightMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400),),
                            subtitle:
                                Text('Skip the line and charge at any time.',
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTextStyleSTL
                                      : eLightSmallTextStyleSTL.copyWith(color: eDblackTextColor),),
                          ),
                            ListTile(
                            leading: Icon(Icons
                                .payment,color: logic.isDarkTheme?eWhiteCLR:eDblackIconColor,), // Icon indicating seamless payment.
                            title: Text('Seamless Payment',
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400)
                                  : eLightMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400),),
                            subtitle:
                                Text('Automatic billing and in-app payment.',
                                    style: logic.isDarkTheme
                                    ? eDarkSmallTextStyleSTL
                                        : eLightSmallTextStyleSTL.copyWith(color: eDblackTextColor),),
                          ),
                            ListTile(
                            leading: Icon(Icons
                                .money_off,color: logic.isDarkTheme?eWhiteCLR:eDblackIconColor,), // Icon indicating cost savings.
                            title: Text('Cost Savings',
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400)
                                  : eLightMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400),),
                            subtitle: Text('Save up to 20% on charging costs.',
                                style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                    : eLightSmallTextStyleSTL.copyWith(color: eDblackTextColor),),
                          ),
                            ListTile(
                            leading: Icon(Icons
                                .support,color: logic.isDarkTheme?eWhiteCLR:eDblackIconColor,), // Icon indicating customer support.
                            title: Text('24/7 Customer Support',
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400)
                                  : eLightMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400),),
                            subtitle: Text('Get help when you need it.',
                              style: logic.isDarkTheme
                                  ? eDarkSmallTextStyleSTL
                                  : eLightSmallTextStyleSTL.copyWith(color: eDblackTextColor),),
                          ),
                            ListTile(
                            leading: Icon(Icons
                                .card_giftcard,color: logic.isDarkTheme?eWhiteCLR:eDblackIconColor,), // Icon indicating rewards.
                            title: Text('Exclusive Rewards',
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400)
                                  : eLightMediumTitleStyleSTL.copyWith(
                                  fontWeight: FontWeight.w400),),
                            subtitle: Text(
                                'Unlock special discounts and promotions.',
                                style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                    : eLightSmallTextStyleSTL.copyWith(color: eDblackTextColor),),
                          ),
                          eCELargeSizedBox(),
                          eButton(logic,
                              title: 'Subscribe Now', onPressed: () {}),
                          eCELargeSizedBox(),
                          eCELargeSizedBox(),
                          // eCELargeSizedBox(),
                          // eCELargeSizedBox(),
                          // eCELargeSizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            focusElevation: 2,
            elevation: 4,
            label: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.backward,
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
