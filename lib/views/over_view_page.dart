import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/controller/vehicle_controller.dart';
import 'package:ekhoncharge/controller/wallet_controller.dart';
import 'package:ekhoncharge/models/charging_history.dart';
import 'package:ekhoncharge/models/registered_car_model.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/banner_widget.dart';
import 'package:ekhoncharge/widgets/my_e_charge_payment_widget.dart';
import 'package:ekhoncharge/widgets/show_transaction_details.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OverViewPage extends StatefulWidget {
  const OverViewPage({Key? key}) : super(key: key);

  @override
  State<OverViewPage> createState() => OverViewPageState();
}

class OverViewPageState extends State<OverViewPage> {
  final GlobalKey<OverViewPageState> appBarKey = GlobalKey<OverViewPageState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeController>().fetchChargingHistoryCtl();
      Get.find<WalletController>().fetchWalletData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<HomeController>(
          builder: (homeController) {
            return GetBuilder<AuthController>(builder: (authCtl) {
              return GetBuilder<WalletController>(
                builder: (walletCtl) {
                  return GetBuilder<VehicleController>(
                      builder: (vehicleController) {
                    return Scaffold(
                      backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR ,
                      key: scaffoldKey,
                      appBar: eHomeAppBarWithBalance(
                        logic,
                        authCtl,
                        walletCtl.wallet.wallet?.balance ?? '',
                        appBarKey,
                        scaffoldKey,
                      ),
                      // endDrawer: DrawerWidget(),
                      body: SingleChildScrollView(
                        child: SafeArea(
                          child: eAppPadding(
                            child: Column(
                              children: [
                                eCMediumSizedBox(),
                                eCMediumSizedBox(),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: logic.isDarkTheme
                                        ? eDarkThemeBGCLR
                                        : eWhiteCLR,
                                    border: Border.all(
                                        width: 1,
                                        color: logic.isDarkTheme
                                            ? eDSecondPrimaryCLR
                                            : eLightThemeBorderCLR),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${eMyCar.tr} ',
                                        style: logic.isDarkTheme
                                            ? eDarkSmallTitleStyleSTL
                                            : eLightSmallTitleStyleSTL,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.22,
                                  width: Get.width * 1,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        vehicleController.fetchRegCar?.length ??
                                            0,
                                    itemBuilder: (context, index) {
                                      VehiclesData? vehicle =
                                          vehicleController.fetchRegCar?[index];
                                      bool isLastVehicle = index ==
                                          (vehicleController
                                                  .fetchRegCar!.length -
                                              1);
                                      bool isMultipleVehicles =
                                          vehicleController
                                              .fetchRegCar!.isNotEmpty;

                                      return Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                              width: Get.width * 0.95,
                                              decoration: BoxDecoration(
                                                color: logic.isDarkTheme
                                                    ? eCardColor
                                                    : eWhiteCLR,
                                                border: Border.all(
                                                  width: 0.9,
                                                  color: logic.isDarkTheme
                                                      ? eCardColor
                                                      : eLightThemeBorderCLR,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 5.0),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 2.0,
                                                                horizontal: 8),
                                                        child: ListView(
                                                          children: [
                                                            Text(
                                                              vehicle?.vehicle
                                                                      ?.title ??
                                                                  '',
                                                              style: logic
                                                                      .isDarkTheme
                                                                  ? eDarkMediumTitleStyleSTL
                                                                  : eLightMediumTitleStyleSTL,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            eCMediumSizedBox(),
                                                            eCMediumSizedBox(),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .battery_charging_full_outlined,
                                                                      color: logic
                                                                              .isDarkTheme
                                                                          ? eWhiteCLR
                                                                          : eHintCLR,
                                                                      size:
                                                                          eMidMediumIcon,
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.045,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          vehicle?.vehicle?.useableCapacity ??
                                                                              "",
                                                                          style: logic.isDarkTheme
                                                                              ? eDarkExtraSmallTextStyleSTL
                                                                              : eLightExtraSmallTextStyleSTL,
                                                                        ),
                                                                        eCSmallSizedBox(),
                                                                        Text(
                                                                          "Usable Battery",
                                                                          style: logic.isDarkTheme
                                                                              ? eDarkExtraSmallTextStyleSTL
                                                                              : eLightExtraSmallTextStyleSTL,
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                                eCSmallSizedBox(),
                                                                eCMediumSizedBox(),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .add_road,
                                                                      color: logic
                                                                              .isDarkTheme
                                                                          ? eWhiteCLR
                                                                          : eHintCLR,
                                                                      size:
                                                                          eMidMediumIcon,
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.045,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          vehicle?.vehicle?.electricRange ??
                                                                              "",
                                                                          style: logic.isDarkTheme
                                                                              ? eDarkExtraSmallTextStyleSTL
                                                                              : eLightExtraSmallTextStyleSTL,
                                                                        ),
                                                                        eCSmallSizedBox(),
                                                                        Text(
                                                                          "Real Range",
                                                                          style: logic.isDarkTheme
                                                                              ? eDarkExtraSmallTextStyleSTL
                                                                              : eLightExtraSmallTextStyleSTL,
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                                eCSmallSizedBox(),
                                                                eCMediumSizedBox(),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .electric_bolt,
                                                                      color: logic
                                                                              .isDarkTheme
                                                                          ? eWhiteCLR
                                                                          : eHintCLR,
                                                                      size:
                                                                          eMidMediumIcon,
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.045,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          vehicle?.vehicle?.totalPower ??
                                                                              "",
                                                                          style: logic.isDarkTheme
                                                                              ? eDarkExtraSmallTextStyleSTL
                                                                              : eLightExtraSmallTextStyleSTL,
                                                                        ),
                                                                        eCSmallSizedBox(),
                                                                        Text(
                                                                          "Total Power",
                                                                          style: logic.isDarkTheme
                                                                              ? eDarkExtraSmallTextStyleSTL
                                                                              : eLightExtraSmallTextStyleSTL,
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: SizedBox(
                                                        // width:Get.width*0.42,
                                                        //height: Get.height * 0.53,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          child: Image.network(
                                                            '${APIConfig.imageURL}${vehicle?.vehicle?.image}',
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            errorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    _) {
                                                              return Image
                                                                  .asset(
                                                                fit: BoxFit
                                                                    .contain,
                                                                "assets/images/audi1.png",
                                                              );
                                                            },
                                                            loadingBuilder: (BuildContext
                                                                    context,
                                                                Widget
                                                                    childWidget,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                              return loadingProgress ==
                                                                      null
                                                                  ? childWidget
                                                                  : Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        value: loadingProgress.expectedTotalBytes !=
                                                                                null
                                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                                                loadingProgress.expectedTotalBytes!
                                                                            : null,
                                                                      ),
                                                                    );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (isMultipleVehicles &&
                                              isLastVehicle)
                                            Container(
                                              width: Get.width * 0.95,
                                              decoration: BoxDecoration(
                                                color: logic.isDarkTheme
                                                    ? eCardColor
                                                    : eWhiteCLR,
                                                border: Border.all(
                                                  width: 1,
                                                  color: logic.isDarkTheme
                                                      ? eCardColor
                                                      : eLightThemeBorderCLR,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.toNamed(
                                                      RoutesName.selectCarPage);
                                                },
                                                child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    decoration: BoxDecoration(
                                                      color: logic.isDarkTheme
                                                          ? eCardColor
                                                          : eWhiteCLR,
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        bottomRight:
                                                            Radius.circular(12),
                                                        bottomLeft:
                                                            Radius.circular(12),
                                                      ),
                                                      border: Border.all(
                                                        width: 0.5,
                                                        color: logic.isDarkTheme
                                                            ? eCardColor
                                                            : eLightThemeBorderCLR,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        // FaIcon(FontAwesomeIcons.plus, size: eSmallIcon,),
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .carOn,
                                                          size: eMediumIcon,
                                                          color:
                                                              logic.isDarkTheme
                                                                  ? eWhiteCLR
                                                                  : eBlackCLR,
                                                        ),
                                                        eCSmallSizedBox(),
                                                        Text(
                                                          "Add Car",
                                                          style: logic
                                                                  .isDarkTheme
                                                              ? eDarkSmallTextStyleSTL
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)
                                                              : eLightSmallTextStyleSTL
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),

                                eCMediumSizedBox(),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: logic.isDarkTheme
                                        ? eDarkThemeBGCLR
                                        : eWhiteCLR,
                                    border: Border.all(
                                        width: 1,
                                        color: logic.isDarkTheme
                                            ? eDSecondPrimaryCLR
                                            : eLightThemeBorderCLR),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${eChargingHistory.tr} (${homeController.chargingHistoryDataList.length} )',
                                        style: logic.isDarkTheme
                                            ? eDarkSmallTitleStyleSTL
                                            : eLightSmallTitleStyleSTL,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 170,
                                  width: Get.width * 1.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: logic.isDarkTheme
                                            ? eCardColor
                                            : eWhiteCLR,
                                        border: Border.all(
                                            width: 1,
                                            color: logic.isDarkTheme
                                                ? eCardColor
                                                : eLightThemeBorderCLR),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4))),
                                    child: homeController
                                            .chargingHistoryDataList.isEmpty
                                        ? const Center(
                                            child: Text(
                                                'No transaction data available'),
                                          )
                                        : ListView.builder(
                                            itemCount: homeController
                                                .chargingHistoryDataList.length,
                                            itemBuilder: (context, index) {
                                              ChargingHistoryData record =
                                                  homeController
                                                          .chargingHistoryDataList[
                                                      index];

                                              return Column(
                                                children: [
                                                  // eRSmallSizedBox(),
                                                  // eRSmallSizedBox(),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 5,
                                                            right: 5,
                                                            top: 5),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color: logic
                                                                    .isDarkTheme
                                                                ? eCardColor
                                                                : eLightThemeBorderCLR),
                                                        color: logic.isDarkTheme
                                                            ? eDarkThemeBGCLR
                                                            : eWhiteCLR,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    4))),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 12.0,
                                                          horizontal: 6.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Column(
                                                              // mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  DateFormat(
                                                                          'dd-MMM-yyyy')
                                                                      .format(DateTime.parse(record
                                                                          .createdAt!
                                                                          .substring(
                                                                              0,
                                                                              10))),
                                                                  style: logic
                                                                          .isDarkTheme
                                                                      ? eDarkExtraSmallTextStyleSTL
                                                                      : eLightExtraSmallTextStyleSTL,
                                                                ),
                                                                eCMediumSizedBox(),
                                                                Text(
                                                                  record.chargerpointTitle ??
                                                                      "",
                                                                  style: logic
                                                                          .isDarkTheme
                                                                      ? eDarkSmallTitleStyleSTL
                                                                      : eLightSmallTitleStyleSTL,
                                                                ),
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  record.invoice
                                                                              ?.status ==
                                                                          0
                                                                      ? " Paid"
                                                                      : " Due",
                                                                  style: logic
                                                                          .isDarkTheme
                                                                      ? eDarkExtraSmallTextStyleSTL
                                                                      : eLightExtraSmallTextStyleSTL,
                                                                ),
                                                                Text(
                                                                  '${record.totalPrice ?? ""} ৳',
                                                                  style: logic
                                                                          .isDarkTheme
                                                                      ? eDarkMediumTitleStyleSTL.copyWith(
                                                                          color: record.invoice?.status == 0
                                                                              ? eLSuccessCLR
                                                                              : eRedAccentColor)
                                                                      : eLightMediumTitleStyleSTL.copyWith(
                                                                          color: record.invoice?.status == 0
                                                                              ? eLSuccessCLR
                                                                              : eRedAccentColor),
                                                                ),
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            InkWell(
                                                              onTap: () {
                                                                showTransactionDetails(
                                                                    homeController,
                                                                    logic,
                                                                    context,
                                                                    index);
                                                                //                                    context);
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .navigate_next,
                                                                color: logic
                                                                        .isDarkTheme
                                                                    ? eWhiteCLR
                                                                    : eHintCLR,
                                                                size:
                                                                    eSemiMediumIcon,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                  ),
                                ),
                                eCMediumSizedBox(),
                                // Text(
                                //   eOffers.tr,
                                //   style: logic.isDarkTheme
                                //       ? eDarkMediumTitleStyleSTL
                                //       : eLightMediumTitleStyleSTL,
                                // ),


                                //const MyEchargePaymentWidget(),
                                eCMediumSizedBox(),
                                const BannerWidget(),
                                eCMediumSizedBox(),

                                /* ListView.builder(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: homeController.nearbyChargers.length,
                 itemBuilder: (context, index) {
                       Chargers charger = homeController.nearbyChargers[index];
                       return Container(
                         decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(eMPaMa),
                         color: logic.isDarkTheme
                             ? eDarkThemeIconCLR
                             : eWhiteCLR,
                         ),
                         child: Card(
                         elevation: eSPaMa,
                         margin: const EdgeInsets.all(eSPaMa),
                         child: Padding(
                           padding: const EdgeInsets.all(eMPaMa),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment:
                                 CrossAxisAlignment.start,
                             children: [
                               Text(
                                 charger.name ?? '',
                                 style: logic.isDarkTheme
                                     ? eDarkMediumTitleStyleSTL.copyWith(
                                         fontSize: 20,
                                       )
                                     : eLightMediumTitleStyleSTL
                                         .copyWith(
                                         fontSize: 20,
                                       ),
                               ),
                             */ /*
                             Row(
                                 mainAxisAlignment:
                                     MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       const Icon(
                                         FontAwesomeIcons.carBattery,
                                         size: 60,
                                         color: Colors.green,
                                       ),
                                       eRMediumSizedBox(),
                                       Column(
                                         children: [
                                           Text(
                                             charger.address??'',
                                             style: logic.isDarkTheme
                                                 ? eDarkMediumTitleStyleSTL
                                                     .copyWith(
                                                     fontSize: 24,
                                                   )
                                                 : eLightMediumTitleStyleSTL
                                                     .copyWith(
                                                     fontSize: 24,
                                                   ),
                                           ),
                                           Text(
                                            '${ charger.availablePorts??''} ports available',
                                             style: logic.isDarkTheme
                                                 ? eDarkMediumTextStyleSTL
                                                 : eLightMediumTextStyleSTL,
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                   Image.asset(
                                     charger.photo ?? '',
                                     width: 180,
                                     height: 100,
                                   ),
                                 ],
                               ),*/ /*
                             ],
                           ),
                         ),
                         ),
                       );
                 },
               ),
               eCLargeSizedBox(),
               ListView.builder(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: homeController.nearbyChargers.length,
                 itemBuilder: (context, index) {
                       Chargers charger = homeController.nearbyChargers[index];
                       return Container(
                         decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(eMPaMa),
                         color: logic.isDarkTheme
                             ? eDarkThemeIconCLR
                             : eWhiteCLR,
                         ),
                         child: Card(
                         elevation: eSPaMa,
                         margin: const EdgeInsets.all(eSPaMa),
                         child: Padding(
                           padding: const EdgeInsets.all(eMPaMa),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment:
                             CrossAxisAlignment.start,
                             children: [
                               Text(
                                 charger.name ?? '',
                                 style: logic.isDarkTheme
                                     ? eDarkMediumTitleStyleSTL.copyWith(
                                   fontSize: 20,
                                 )
                                     : eLightMediumTitleStyleSTL
                                     .copyWith(
                                   fontSize: 20,
                                 ),
                               ),
                             */ /*  Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       const Icon(
                                         FontAwesomeIcons.carBattery,
                                         size: 60,
                                         color: Colors.green,
                                       ),
                                       eRMediumSizedBox(),
                                       Column(
                                         children: [
                                           Text(
                                             'sajkhasfkhj',
                                             style: logic.isDarkTheme
                                                 ? eDarkMediumTitleStyleSTL
                                                 .copyWith(
                                               fontSize: 24,
                                             )
                                                 : eLightMediumTitleStyleSTL
                                                 .copyWith(
                                               fontSize: 24,
                                             ),
                                           ),
                                           Text(
                                             '${ charger.availablePorts??''} ports available',
                                             style: logic.isDarkTheme
                                                 ? eDarkMediumTextStyleSTL
                                                 : eLightMediumTextStyleSTL,
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),
                                   Image.asset(
                                     charger.photo ?? '',
                                     width: 180,
                                     height: 100,
                                   ),
                                 ],
                               ),*/ /*
                             ],
                           ),
                         ),
                         ),
                       );
                 },
               )*/
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                },
              );
            });
          },
        );
      },
    );
  }
}
