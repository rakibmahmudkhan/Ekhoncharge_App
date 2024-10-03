import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/vehicle_controller.dart';
import 'package:ekhoncharge/settings/pamas.dart';

import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/app_system_controller.dart';
import '../settings/colors.dart';
import '../settings/styles.dart';

class SelectCarPage extends StatefulWidget {
  const SelectCarPage({Key? key}) : super(key: key);

  @override
  State<SelectCarPage> createState() => _SelectCarPageState();
}

class _SelectCarPageState extends State<SelectCarPage> {
  @override
  void initState() {
    super.initState();
    Get.find<VehicleController>().fetchVehicleMakeListAPI();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<VehicleController>(builder: (vehicleCtl) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            body: SafeArea(
              child: eAppPadding(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      eCEELargeSizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: logic.isDarkTheme
                                      ? eDSecondPrimaryCLR
                                      : eHintCLR,
                                  width: 2.0),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              iconSize: 20,
                              icon: Icon(
                                Icons.arrow_back,
                                color: logic.isDarkTheme
                                    ? eWhiteCLR
                                    : eDSecondPrimaryCLR,
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: logic.isDarkTheme
                                      ? eDSecondPrimaryCLR
                                      : eHintCLR,
                                  width: 2.0),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              iconSize: 20,
                              icon: Icon(
                                Icons.close,
                                color: logic.isDarkTheme
                                    ? eWhiteCLR
                                    : eDSecondPrimaryCLR,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      Center(
                          child: Text(
                        eSelectCar.tr,
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL
                            : eLightMediumTextStyleSTL,
                        // style: eLightMediumHintWthSTL.copyWith(fontSize: 15),
                      )),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      Center(
                          child: SizedBox(
                        width: Get.width * 0.7,
                        child: Text(
                          eChooseYourMachineTxt.tr,
                          textAlign: TextAlign.center,
                          style: eLightMediumHintSTL,
                          maxLines: 4,
                        ),
                      )),
                      eCEELargeSizedBox(),
                      _buildSection(
                        vehicleCtl,
                        vehicleCtl.selectedMake.id != null,
                        1,
                        vehicleCtl.selectedMake.id == null
                            ? eChooseMakeCarTxt.tr
                            : vehicleCtl.selectedMake.text ?? '',
                        borderColor:
                            logic.isDarkTheme ? eCardColor : eDSecondaryCLR,
                        bottomBackColor:
                            logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
                        bottomTextStyle: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                        shadowColor: logic.isDarkTheme
                            ? eShaddowColor
                            : eELigthShadowCLR,
                        cardColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        buttonTextStyleColor: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      _buildSection(
                        vehicleCtl,
                        vehicleCtl.selectedModel.id != null,
                        2,
                        vehicleCtl.selectedModel.id == null
                            ? eChooseModelCarTxt.tr
                            : vehicleCtl.selectedModel.text ?? '',
                        borderColor:
                            logic.isDarkTheme ? eCardColor : eDSecondaryCLR,
                        bottomBackColor:
                            logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
                        bottomTextStyle: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                        shadowColor: logic.isDarkTheme
                            ? eShaddowColor
                            : eELigthShadowCLR,
                        cardColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        buttonTextStyleColor: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),

                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),

                      _buildSection(
                        vehicleCtl,
                        vehicleCtl.selectedYear.id != null,
                        3,
                        vehicleCtl.selectedYear.id == null
                            ? eChooseYearCarTxt.tr
                            : vehicleCtl.selectedYear.text ?? '',
                        borderColor:
                            logic.isDarkTheme ? eCardColor : eDSecondaryCLR,
                        bottomBackColor:
                            logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
                        bottomTextStyle: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                        shadowColor: logic.isDarkTheme
                            ? eShaddowColor
                            : eELigthShadowCLR,
                        cardColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        buttonTextStyleColor: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),

                      /*  eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),

                      _buildSection(
                        vehicleCtl,
                        vehicleCtl.selectedColor.id != null,
                        4,
                        vehicleCtl.selectedColor.id == null
                            ? 'Choose Color Car'
                            : vehicleCtl.selectedColor.text ?? '',
                        borderColor:
                            logic.isDarkTheme ? eCardColor : eDSecondaryCLR,
                        bottomBackColor:
                            logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
                        bottomTextStyle: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                        shadowColor: logic.isDarkTheme
                            ? eShaddowColor
                            : eELigthShadowCLR,
                        cardColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        buttonTextStyleColor: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),*/

                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),

                      _buildVinSection(
                        vehicleCtl,
                        shadowColor: logic.isDarkTheme
                            ? eShaddowColor
                            : eELigthShadowCLR,
                        focusColor: logic.isDarkTheme
                            ? eDSecondPrimaryCLR
                            : eDSecondaryCLR,
                        enableColor: logic.isDarkTheme
                            ? eDSecondPrimaryCLR
                            : eDSecondaryCLR,
                        cardColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        fillColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        borderColor:
                            logic.isDarkTheme ? eCardColor : eDSecondaryCLR,
                        inputTextStyleColor: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                        labelTextSyle: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                        hintTextSyle: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),

                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      _buildRegSection(
                        vehicleCtl,
                        shadowColor: logic.isDarkTheme
                            ? eShaddowColor
                            : eELigthShadowCLR,
                        focusColor: logic.isDarkTheme
                            ? eDSecondPrimaryCLR
                            : eDSecondaryCLR,
                        enableColor: logic.isDarkTheme
                            ? eDSecondPrimaryCLR
                            : eDSecondaryCLR,
                        cardColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        fillColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                        borderColor:
                            logic.isDarkTheme ? eCardColor : eDSecondaryCLR,
                        inputTextStyleColor: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                        labelTextSyle: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                        hintTextSyle: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),

                      // _buildSectionWithInput(
                      //     'VIN', 'Enter VIN', enteredVIN, false),
                      // _buildSectionWithInput('Registration',
                      //     'Enter Registration', enteredRegistration, false),
                      // eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      eCEXSmallSizedBox(),
                      eCEELargeSizedBox(),
                      SizedBox(
                        width: double.maxFinite,
                        child: eButton(
                          logic,
                          title: eReviewingCarTxt.tr,
                          onPressed: () {
                            vehicleCtl.validateVehicleForm(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }

  Widget _buildVinSection(VehicleController vehicleController,
      {Color? shadowColor,
      Color? cardColor,
      Color? borderColor,
      Color? focusColor,
      Color? enableColor,
      Color? fillColor,
      TextStyle? labelTextSyle,
      TextStyle? hintTextSyle,
      double? focusBorderRadius,
      double? enableBorderRadius,
      TextStyle? inputTextStyleColor}) {
    bool isSelected = vehicleController.enteredVIN.isNotEmpty;

    return SizedBox(
      height: Get.height * 0.063,
      width: double.maxFinite,
      child: Card(
        shadowColor: shadowColor,
        color: cardColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor ?? eCardColor,
                width: 0,
                style: BorderStyle.none),
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          controller: vehicleController.vinController,
          keyboardType: TextInputType.text,
          style: inputTextStyleColor,
          onChanged: (value) {
            setState(() {
              vehicleController.enteredVIN = value;
            });
          },
          decoration: InputDecoration(
            hintStyle: hintTextSyle,
            hintText: eEnterYourVinTxt.tr,
            //prefixIcon: prefixWidget,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isSelected ? eHintCLR : eBlackCLR),
                ),
                child: Icon(
                  isSelected ? Icons.check : Icons.add,
                  color: isSelected ? eLSuccessCLR : eHintCLR,
                ),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: focusColor!),
                borderRadius: BorderRadius.circular(focusBorderRadius ?? 8)),
            filled: true,
            fillColor: fillColor ?? eDSecondPrimaryCLR,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: enableColor ?? eWhiteCxLR),
                borderRadius: BorderRadius.circular(enableBorderRadius ?? 8)),
            labelText: eVIN.tr,
            labelStyle: labelTextSyle,
            contentPadding:
                const EdgeInsets.only(left: eMPaMa, right: eMPaMa, top: eSPaMa),
          ),
        ),
      ),
    );
  }

  Widget _buildRegSection(VehicleController vehicleController,
      {Color? shadowColor,
      Color? cardColor,
      Color? borderColor,
      Color? focusColor,
      Color? enableColor,
      Color? fillColor,
      TextStyle? labelTextSyle,
      TextStyle? hintTextSyle,
      double? focusBorderRadius,
      double? enableBorderRadius,
      TextStyle? inputTextStyleColor}) {
    bool isSelected = vehicleController.enteredRegistration.isNotEmpty;

    return SizedBox(
      height: Get.height * 0.063,
      width: double.maxFinite,
      child: Card(
        shadowColor: shadowColor,
        color: cardColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor ?? eCardColor,
                style: BorderStyle.none,
                width: 0),
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          controller: vehicleController.regController,
          keyboardType: TextInputType.text,
          style: inputTextStyleColor,
          // style:logic.isDarkTheme
          //     ? eDarkMediumTitleStyleSTL
          //     : eLightMediumTitleStyleSTL,
          // onSubmitted: onSubmitted,
          onChanged: (value) {
            setState(() {
              vehicleController.enteredRegistration = value;
            });
          },
          decoration: InputDecoration(
            hintStyle: hintTextSyle,
            hintText: eRegistration.tr,
            //prefixIcon: prefixWidget,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: isSelected ? eHintCLR : eBlackCLR),
                ),
                child: Icon(
                  isSelected ? Icons.check : Icons.add,
                  color: isSelected ? eLSuccessCLR : eHintCLR,
                ),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: focusColor ?? eDPrimaryCLR2),
                borderRadius: BorderRadius.circular(focusBorderRadius ?? 8)),
            filled: true,
            fillColor: fillColor ?? eDSecondPrimaryCLR,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: enableColor ?? eWhiteCxLR),
                borderRadius: BorderRadius.circular(enableBorderRadius ?? 8)),
            labelText: eRegistration.tr,
            labelStyle: labelTextSyle,
            contentPadding:
                const EdgeInsets.only(left: eMPaMa, right: eMPaMa, top: eSPaMa),
          ),
        ),
      ),
    );
  }

  //*** Old Reg Section ***

  // Widget _buildRegistrationSection() {
  //   bool isSelected = enteredRegistration.isNotEmpty;
  //
  //   return Container(
  //     height: Get.height * 0.063,
  //     child: Card(
  //       color: eShaddowColor,
  //       elevation: 5,
  //       shadowColor: eShaddowColor,
  //       child: eSearchTextFiled(
  //         regController,
  //         hint: "Registration",
  //         focusColor: eDSecondPrimaryCLR,
  //         enableColor: eDSecondPrimaryCLR,
  //         hintStyle: eLightMediumHintWthSTL,
  //         style: eLightMediumHintWthSTL,
  //         labelText: "Registration",
  //         omOChanged: (value) {
  //           setState(() {
  //             enteredRegistration = value;
  //           });
  //         },
  //         suffixWidget: Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Container(
  //             // height: Get.height*0.04,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(22),
  //               border: Border.all(color: isSelected ? eWhiteCLR : eBlackCLR),
  //             ),
  //             child: Icon(
  //               isSelected ? Icons.check : Icons.add,
  //               color: isSelected ? eLSuccessCLR : eWhiteCLR,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSection(VehicleController vehicleController, bool isSelected,
      int type, String title,
      {Color? borderColor,
      Color? bottomBackColor,
      TextStyle? bottomTextStyle,
      Color? shadowColor,
      Color? cardColor,
      TextStyle? buttonTextStyleColor}) {
    return Container(
      height: Get.height * 0.063,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          if (type == 1) {
            vehicleController.showDetailsMakeBottomSheet(context,
                bottomBackColor: bottomBackColor,
                bottomTextStyle: bottomTextStyle);
          } else if (type == 2) {
            vehicleController.showDetailsModelBottomSheet(context,
                bottomBackColor: bottomBackColor,
                bottomTextStyle: bottomTextStyle);
          } else if (type == 3) {
            vehicleController.showDetailsYearBottomSheet(context,
                bottomBackColor: bottomBackColor,
                bottomTextStyle: bottomTextStyle);
          }
          /* else if (type == 4) {
            vehicleController.showDetailsColorBottomSheet(context,
                bottomBackColor: bottomBackColor,
                bottomTextStyle: bottomTextStyle);
          }*/
        },
        child: Card(
          elevation: 7,
          shadowColor: shadowColor ?? eShaddowColor,
          color: cardColor ?? eCardColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? eCardColor),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: buttonTextStyleColor ?? eLightMediumHintWthSTL,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: isSelected ? eHintCLR : eBlackCLR),
                  ),
                  child: Icon(
                    isSelected ? Icons.check : Icons.add,
                    color: isSelected ? eLSuccessCLR : eHintCLR,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarData {
  static List<String> carMakes = [
    'Make 1',
    'Make 2',
    'Make 3',
    'Make 4',
    'Make 5',
    'Make 6'
  ];
  static List<String> carModels = [
    'Model A',
    'Model B',
    'Model C',
    'Model D',
    'Model E',
    'Model F'
  ];
  static List<String> carYears = [
    'Year 2017',
    'Year 2018',
    'Year 2019',
    'Year 2020',
    'Year 2021',
    'Year 2022'
  ];
  static List<String> carColors = [
    'Red',
    'Blue',
    'Green',
    'Chayan',
    'Gray',
    'Silver White'
  ];
}
