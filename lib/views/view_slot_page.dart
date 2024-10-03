import 'dart:io';

import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ViewSlotPage extends StatefulWidget {
  const ViewSlotPage({Key? key}) : super(key: key);

  @override
  State<ViewSlotPage> createState() => _ViewSlotPageState();
}

class _ViewSlotPageState extends State<ViewSlotPage> {
  final AuthController authController = Get.find();
  int _rotation = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authLogic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          appBar: eHomeAppBarWithoutBalance(logic, authController),
          body: SingleChildScrollView(
            child: SafeArea(
              child: eAppPadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    eCELargeSizedBox(),
                    eCELargeSizedBox(),
                    Center(
                      child: Text(
                        "View Slot",
                        style: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL.copyWith(
                                fontSize: eLFontSize)
                            : eLightMediumTitleStyleSTL,
                      ),
                    ),
                    
                    SizedBox(
                      height: Get.height * 0.30,
                      width: double.maxFinite,
                      child: PhotoView(
                        imageProvider: AssetImage('assets/images/audi1.png'),
                        backgroundDecoration:
                            BoxDecoration(color: Colors.transparent),
                        minScale: PhotoViewComputedScale.contained * 1.2,
                        maxScale: PhotoViewComputedScale.covered * 2.1,
                        initialScale: PhotoViewComputedScale.contained,
                        enableRotation: true,
                      ),
                    ),
                    eCELargeSizedBox(),
                    eCMediumSizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Audi e Tron",
                        style: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL.copyWith(
                                fontSize: eLFontSize)
                            : eLightMediumTitleStyleSTL,
                      ),
                    ),
                    rowDetailsWidget("Fuel Type: ", "AC", logic),
                    rowDetailsWidget("Connection Type: ", "Type 1", logic),
                    rowDetailsWidget("Charge point id: ", "G2S41", logic),
                    rowDetailsWidget("Total Payment: ", "300", logic),
                    rowDetailsWidget("Booking No: ", "45233398661", logic),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child:
                              columnDetailsWidget("Battery", "2.9Kwh", logic),
                        ),
                        Expanded(
                          child: columnDetailsWidget("Time", "45 min", logic),
                        ),
                        Expanded(
                          child: columnDetailsWidget("Price", "15 /Kwh", logic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey.withOpacity(.90),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Icon(
                        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                        color: logic.isDarkTheme ? eWhiteCLR : eWhiteCLR,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0), // Add spacing between widgets
                Expanded(
                  child: eStationDetailsButton(
                    logic,
                    title: "Delete Slot",
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),

         /* floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey.withOpacity(.90),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Center(
                      child: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
                        color: logic.isDarkTheme ? eWhiteCLR : eWhiteCLR,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                        child: eStationDetailsButton(logic,
                            title: "Delete Slot", onPressed: () {
                      Get.back();
                    })),
                  ),
                ),
              ],
            ),
          ),*/
        );
      });
    });
  }

  Widget rowDetailsWidget(
      String title, String subTitle, AppSystemController logic) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: logic.isDarkTheme
                ? eDarkSmallTitleStyleSTL
                : eLightSmallTextStyleSTL,
          ),
          Text(
            subTitle,
            style: logic.isDarkTheme
                ? eDarkSmallTitleStyleSTL.copyWith(
                    fontWeight: FontWeight.normal)
                : eLightSmallTextStyleSTL.copyWith(
                    fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  Widget columnDetailsWidget(
      String title, String subTitle, AppSystemController logic) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: logic.isDarkTheme
                ? eDarkSmallTitleStyleSTL
                : eLightSmallTextStyleSTL,
          ),
          Text(
            subTitle,
            style: logic.isDarkTheme
                ? eDarkSmallTitleStyleSTL.copyWith(
                    fontWeight: FontWeight.normal)
                : eLightSmallTextStyleSTL.copyWith(
                    fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
