import 'dart:ui';

import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../settings/colors.dart';


class BkashCancelPage extends StatelessWidget {
  const BkashCancelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Solid color background
            Positioned.fill(
              child: Container(
                color: eCardColor,
              ),
            ),
            // Blurred background
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    eBlackCLR.withOpacity(0.5),
                    BlendMode.srcOut,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            // Center content
            Center(
              child: Container(
                width: 300,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.ban,
                      size: 50,
                      color: Colors.red,
                    ),
                    eCELargeSizedBox(),
                    Text(
                      'Canceled'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    eCELargeSizedBox(),
                    Text(
                      'Sorry, the transaction has canceled.',
                      style: eLightMediumTitleStyleSTL,
                      textAlign: TextAlign.center,
                    ),
                    eCELargeSizedBox(),
                    InkWell(
                      onTap: () {
                        Get.offAndToNamed(RoutesName.home);
                      //  Get.off(RoutesName.bkashPaymentPage);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.green,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*class BkashCancelPage extends StatelessWidget {
  const BkashCancelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height * 0.45,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: eDarkThemeBGCLR,
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.cancel,
                size: 50, //Icon Size
                color: Colors.white, //Color Of Icon
              ),
              eCMediumSizedBox(),
              const Text(
                'CANCELED',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              eCELargeSizedBox(),
              eCELargeSizedBox(),
              Text(
                'Sorry, the transaction has canceled.',
                style: TextStyle(fontSize: 18.0),
              ),
              eCELargeSizedBox(),
              eCELargeSizedBox(),
              eCELargeSizedBox(),
              eCELargeSizedBox(),
              InkWell(
                  onTap: () {
                    Get.toNamed(RoutesName.bkashPaymentPage);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: eDSuccessCLR),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Text(
                          "Continue",
                          style: eDarkMediumTextStyleSTL,
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}*/
