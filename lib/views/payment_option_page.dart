import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOptionsPage extends StatelessWidget {
  const PaymentOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Container(
              alignment: Alignment.center,
              child: Image(
                width: logic.isDarkTheme
                    ? appDarkLogoWidth
                    : appDarkLogoWidth,
                height: appLogoHeight,
                fit: BoxFit.contain,
                image: AssetImage(
                  logic.isDarkTheme
                      ? eDarkAppLogo
                      : eLightAppLogo,
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            eCEELargeSizedBox(),
            Center(
              child: Text(
                "Payment Options",
                 style: logic.isDarkTheme
                  ? eDarkMediumTitleStyleSTL
                  : eLightMediumTitleStyleSTL,
              ),
            ),
            eCMediumSizedBox(),
            eCEELargeSizedBox(),
            PaymentOptionCard(
              icon: Icons.phone_android,
              title: 'Pay with bKash',
              logic: logic,
              onTap: () {
                // Handle the bKash payment method here
              },
            ),
            SizedBox(height: 20),
            PaymentOptionCard(
              icon: Icons.account_balance_wallet,
              title: 'Pay with Wallet',
              logic: logic,
              onTap: () {
                // Handle the Wallet payment method here
              },
            ),
            SizedBox(height: 20),
            PaymentOptionCard(
              icon: Icons.credit_card,
              title: 'Through Card',
              onTap: () {
                // Handle the Card payment method here
              },
              logic: logic,
            ),
            SizedBox(height: 20),
            PaymentOptionCard(
              icon: Icons.monetization_on,
              title: 'AmaarPay',
              logic: logic,
              onTap: () {
                // Handle the AmaarPay payment method here
              },
            ),
          ],
        ),
      );
    });
  }
}

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextStyle? textStyle;
  final Function() onTap;
  final AppSystemController logic;

  const PaymentOptionCard({
    required this.icon,
    required this.title,
    this.textStyle,
    required this.onTap,
    required this.logic,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 12),
      child: Card(
        color: logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
        elevation: 5.0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
              color: logic.isDarkTheme
                  ? Colors.transparent
                  : eDPrimaryCLR2,
              width: 1),
        ),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                ),
                SizedBox(width: 16),
                Text(
                  title,
                  style: logic.isDarkTheme
                      ? eDarkMediumTextStyleSTL.copyWith(
                          fontSize: eMFontSize, fontWeight: FontWeight.normal)
                      : eLightMediumTextStyleSTL ?? textStyle,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
