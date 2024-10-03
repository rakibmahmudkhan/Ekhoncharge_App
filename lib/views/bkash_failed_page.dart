import 'dart:ui';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../settings/colors.dart';

class BkashFailedPage extends StatelessWidget {
  final String statusMessage;

  const BkashFailedPage({super.key, required this.statusMessage});

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
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      FontAwesomeIcons.ban,
                      size: 50,
                      color: Colors.red,
                    ),
                    eCELargeSizedBox(),
                    Text(
                      'Failed'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    eCELargeSizedBox(),
                    Text(
                      'Sorry, the transaction has Failed due to:',
                      style: eLightMediumTitleStyleSTL,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      statusMessage,
                      style: eLightMediumTitleStyleSTL.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    eCELargeSizedBox(),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.green,
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
