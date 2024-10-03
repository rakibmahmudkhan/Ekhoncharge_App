import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/controller/booking_controller.dart';
import 'package:ekhoncharge/controller/vehicle_controller.dart';
import 'package:ekhoncharge/models/registered_car_model.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisteredCarPage extends StatefulWidget {
  const RegisteredCarPage({super.key});

  @override
  State<RegisteredCarPage> createState() => _RegisteredCarPageState();
}

class _RegisteredCarPageState extends State<RegisteredCarPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<VehicleController>().fetchRegisteredCarListApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<AuthController>(builder: (authController) {
          return GetBuilder<BookingController>(builder: (bookingController) {
            return GetBuilder<VehicleController>(builder: (vehicleController) {
              return Scaffold(
                  appBar: eHomeAppBarWithoutBalance(logic, authController),
                  resizeToAvoidBottomInset: false,
                  backgroundColor:
                      logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
                  body: eAppPadding(
                      child: Background(
                    isActive: false,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: logic.isDarkTheme
                                      ? eCardColor
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: logic.isDarkTheme
                                          ? eHintCLR.withOpacity(0.5)
                                          : eDSecondaryCLR.withOpacity(1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 80),
                                child: Center(
                                    child: Text(
                                      eRegisteredVehicleDetails.tr,
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTitleStyleSTL
                                      : eLightMediumTitleStyleSTL,
                                )),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 12,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    vehicleController.fetchRegCar?.length ?? 0,
                                itemBuilder: (context, index) {
                                  VehiclesData? vehicle =
                                      vehicleController.fetchRegCar?[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, top: 6),
                                    child: Container(
                                      //height: Get.height * 0.38,
                                      width: Get.width * 0.91,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: logic.isDarkTheme
                                            ? eCardColor
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                            color: logic.isDarkTheme
                                                ? eHintCLR.withOpacity(0.5)
                                                : eDSecondaryCLR.withOpacity(1),
                                            width: 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        vehicle?.vehicle
                                                                ?.title ??
                                                            '',
                                                        style: logic.isDarkTheme
                                                            ? eDarkMediumTitleStyleSTL
                                                            : eLightMediumTitleStyleSTL,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      eCMediumSizedBox(),
                                                      Row(
                                                        //mainAxisAlignment:MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              vehicle?.vehicle
                                                                      ?.vmodelTitle ??
                                                                  '',
                                                              style: logic
                                                                      .isDarkTheme
                                                                  ? eDarkMediumTitleStyleSTL
                                                                  : eLightMediumTitleStyleSTL,
                                                            ),
                                                          ),
                                                          Text(
                                                            eModel.tr,
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eDarkSmallTextStyleSTL
                                                                : eLightSmallTextStyleSTL,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            vehicle?.vehicle
                                                                    ?.fastchargePowerMax ??
                                                                '',
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eDarkMediumTitleStyleSTL
                                                                : eLightMediumTitleStyleSTL,
                                                          ),
                                                          Text(
                                                          eMax.tr,
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eDarkSmallTextStyleSTL
                                                                : eLightSmallTextStyleSTL,
                                                          )
                                                        ],
                                                      ),
                                                      eCMediumSizedBox(),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            vehicle?.vehicle
                                                                    ?.fastchargeTime ??
                                                                '',
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eDarkMediumTitleStyleSTL
                                                                : eLightMediumTitleStyleSTL,
                                                          ),
                                                          Text(
                                                            eTime.tr,
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eDarkSmallTextStyleSTL
                                                                : eLightSmallTextStyleSTL,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            eCMediumSizedBox(),
                                            eCLargeSizedBox(),
                                            eCLargeSizedBox(),
                                            SizedBox(
                                              height: Get.height * 0.28,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  '${APIConfig.imageURL}${vehicle?.vehicle?.image}',
                                                  fit: BoxFit.contain,
                                                  errorBuilder:
                                                      (BuildContext context,
                                                          Object exception, _) {
                                                    return Image.asset(
                                                      fit: BoxFit.contain,
                                                      "assets/images/audi1.png",
                                                    );
                                                  },
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget childWidget,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    return loadingProgress ==
                                                            null
                                                        ? childWidget
                                                        : Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              value: loadingProgress
                                                                          .expectedTotalBytes !=
                                                                      null
                                                                  ? loadingProgress
                                                                          .cumulativeBytesLoaded /
                                                                      loadingProgress
                                                                          .expectedTotalBytes!
                                                                  : null,
                                                            ),
                                                          );
                                                  },
                                                ),
                                              ),
                                            ),
                                            eCMediumSizedBox(),
                                            eCMediumSizedBox(),
                                            eCMediumSizedBox(),
                                            Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(eTotalPower.tr,
                                                          style: logic.isDarkTheme
                                                              ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                  color: eWhiteCLR
                                                                      .withOpacity(
                                                                          0.65))
                                                              : eLightExtraSmallTextStyleSTL.copyWith(
                                                                  color: eBlackCLR
                                                                      .withOpacity(
                                                                          0.65))),
                                                      Text(
                                                        vehicle?.vehicle
                                                                ?.totalPower ??
                                                            "",
                                                        style: logic.isDarkTheme
                                                            ? eDarkExtraSmallTextStyleSTL
                                                            : eLightExtraSmallTextStyleSTL,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(eTotalTorque.tr,
                                                          style: logic.isDarkTheme
                                                              ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                  color: eWhiteCLR
                                                                      .withOpacity(
                                                                          0.65))
                                                              : eLightExtraSmallTextStyleSTL.copyWith(
                                                                  color: eBlackCLR
                                                                      .withOpacity(
                                                                          0.65))),
                                                      Text(
                                                        vehicle?.vehicle
                                                                ?.totalTorque ??
                                                            "",
                                                        style: logic.isDarkTheme
                                                            ? eDarkExtraSmallTextStyleSTL
                                                            : eLightExtraSmallTextStyleSTL,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                              ],
                                            ),
                                            eCMediumSizedBox(),
                                            eCMediumSizedBox(),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(eTopSpeed.tr,
                                                          style: logic.isDarkTheme
                                                              ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                  color: eWhiteCLR
                                                                      .withOpacity(
                                                                          0.65))
                                                              : eLightExtraSmallTextStyleSTL.copyWith(
                                                                  color: eBlackCLR
                                                                      .withOpacity(
                                                                          0.65))),
                                                      Text(
                                                        vehicle?.vehicle
                                                                ?.topSpeed ??
                                                            "",
                                                        style: logic.isDarkTheme
                                                            ? eDarkExtraSmallTextStyleSTL
                                                            : eLightExtraSmallTextStyleSTL,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(eElectricRange.tr,
                                                          style: logic.isDarkTheme
                                                              ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                  color: eWhiteCLR
                                                                      .withOpacity(
                                                                          0.65))
                                                              : eLightExtraSmallTextStyleSTL.copyWith(
                                                                  color: eBlackCLR
                                                                      .withOpacity(
                                                                          0.65))),
                                                      Text(
                                                        vehicle?.vehicle
                                                                ?.electricRange ??
                                                            "",
                                                        style: logic.isDarkTheme
                                                            ? eDarkExtraSmallTextStyleSTL
                                                            : eLightExtraSmallTextStyleSTL,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                              ],
                                            ),
                                            eCMediumSizedBox(),
                                            eCMediumSizedBox(),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(eChargerPort.tr,
                                                          style: logic.isDarkTheme
                                                              ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                  color: eWhiteCLR
                                                                      .withOpacity(
                                                                          0.65))
                                                              : eLightExtraSmallTextStyleSTL.copyWith(
                                                                  color: eBlackCLR
                                                                      .withOpacity(
                                                                          0.65))),
                                                      Text(
                                                        vehicle?.vehicle
                                                                ?.fastchargePort ??
                                                            "",
                                                        style: logic.isDarkTheme
                                                            ? eDarkExtraSmallTextStyleSTL
                                                            : eLightExtraSmallTextStyleSTL,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(eEngine.tr,
                                                          style: logic.isDarkTheme
                                                              ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                  color: eWhiteCLR
                                                                      .withOpacity(
                                                                          0.65))
                                                              : eLightExtraSmallTextStyleSTL.copyWith(
                                                                  color: eBlackCLR
                                                                      .withOpacity(
                                                                          0.65))),
                                                      Text(
                                                        vehicle?.vehicle
                                                                ?.engine ??
                                                            "",
                                                        style: logic.isDarkTheme
                                                            ? eDarkExtraSmallTextStyleSTL
                                                            : eLightExtraSmallTextStyleSTL,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                              ],
                                            ),
                                            eCLargeSizedBox(),
                                            eCMediumSizedBox(),
                                            eStationDetailsButton(
                                              logic,
                                              title: eRemoveCar.tr,
                                              onPressed: () async {
                                                bool confirmDelete =
                                                    await Get.dialog(
                                                  AlertDialog(
                                                    backgroundColor:
                                                        logic.isDarkTheme
                                                            ? eCardColor
                                                            : eWhiteCLR,
                                                    title: Text(
                                                      eConfirmation.tr,
                                                      style: logic.isDarkTheme
                                                          ? eDarkLTextStyleSTL
                                                          : eLightLTextStyleSTL
                                                              .copyWith(
                                                                  color:
                                                                      eBlackCLR),
                                                    ),
                                                    content: Text(
                                                     eConfirmMessage.tr,
                                                      style: logic.isDarkTheme
                                                          ? eDarkSmallTitleStyleSTL
                                                          : eLightSmallTitleStyleSTL,
                                                    ),
                                                    actions: <Widget>[
                                                      eButton(logic,
                                                          title: "Cancel",
                                                          color: eDPrimaryCLR2,
                                                          onPressed: () {
                                                        Get.back(result: false);
                                                      }),
                                                      eButton(logic,
                                                          title: "Delete",
                                                          color: eDWarningCLR,
                                                          onPressed: () {
                                                        Get.back(result: true);
                                                      }),
                                                    ],
                                                  ),
                                                );

                                                if (confirmDelete == true) {
                                                  if (vehicleController
                                                          .fetchRegCar
                                                          ?.length ==
                                                      1) {
                                                    eCustomToast(
                                                        message:
                                                        eOnlyCarRemoveMessage.tr);
                                                  } else {
                                                    await vehicleController
                                                        .deleteRegCarController(
                                                            vehicle?.uuid ??
                                                                "");
                                                    vehicleController
                                                        .fetchRegisteredCarListApi();
                                                  }
                                                }
                                              },
                                            ),




                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const Expanded(flex: 1, child: Text(""))
                        ],
                      ),
                    ),
                  )),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
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
                  ));
            });
          });
        });
      },
    );
  }
}
