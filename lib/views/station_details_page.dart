import 'dart:io';
import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/booking_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/controller/my_google_map_controller.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/models/ekhon_charge_station.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
 import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/rating_widget.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class StationDetailsPage extends StatefulWidget {
  const StationDetailsPage({super.key});

  @override
  State<StationDetailsPage> createState() => _StationDetailsPageState();
}

class _StationDetailsPageState extends State<StationDetailsPage> {
  @override
  void initState() {
    //Get.find<ChargerBoxController>().fetchChargerBoxAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<HomeController>(
          builder: (homeController) {
            EkhonChargeStationData record =
                homeController.stationData[homeController.selectedStationIndex];

            /*   Connectors ChargerRecord =
            homeController.stationData[homeController.selectedStationIndex].chargerpoints[homeController.selectedChargerIndex];
*/
            return GetBuilder<BookingController>(builder: (bookingController) {
              return GetBuilder<MyGoogleMapController>(builder: (mGoogleCtl) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor:
                      logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
                  body: Background(
                    isActive: false,
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //eCEXSmallSizedBox(),
                          SizedBox(
                            height: Get.height * 0.53,
                            width: double.maxFinite,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: Get.height * 0.28,
                                  width: double.maxFinite,
                                  child: Opacity(
                                    opacity: 1,
                                    child: Image.network(
                                      '${APIConfig.imageURL}${record.imagePath ?? ''}',
                                      fit: BoxFit.fill,
                                      errorBuilder: (BuildContext context,
                                          Object exception, ___) {
                                        return Image.asset(
                                          'assets/stationImages/charging_2.png',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      loadingBuilder: (BuildContext context,
                                          Widget childWidget,
                                          ImageChunkEvent? loadingProgress) {
                                        return loadingProgress == null
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
                                Positioned(
                                  left: 0,
                                  top: 10,
                                  child: eAppPadding(
                                    child: GestureDetector(
                                      onTap: () {
                                        //Get.back();
                                        homeController
                                            .resetChargerAndConnectorIndex();
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.withOpacity(.90),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Platform.isIOS
                                                ? Icons.arrow_back_ios
                                                : Icons.arrow_back,
                                            color: logic.isDarkTheme
                                                ? eWhiteCLR
                                                : eWhiteCLR,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: Get.height * 0.17,
                                  left: Get.height * 0.0055,
                                  // right: Get.height*0.001,

                                  child: eAppPadding(
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Opacity(
                                              opacity: 0.89,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    gradient:
                                                        const LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        eDPrimaryCLR3,
                                                        eDSecondPrimaryCLR,
                                                        eDPrimaryCLR3,
                                                        eDSecondPrimaryCLR,
                                                        eDPrimaryCLR3,
                                                        eDSecondPrimaryCLR
                                                      ],
                                                    )),
                                                child: Opacity(
                                                  opacity: 0.32,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image(
                                                      height:
                                                          Get.height * 0.310,
                                                      width: Get.width * 0.9,
                                                      image: const AssetImage(
                                                          "assets/images/location_bg_image.jpeg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.310,
                                              width: Get.width * 0.8,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 18.0,
                                                    top: 10,
                                                    bottom: 7),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    // mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        record.title ?? '',
                                                        style: logic.isDarkTheme
                                                            ? eDarkMediumTextStyleSTL
                                                            : eDarkMediumTextStyleSTL,
                                                      ),
                                                      eCMediumSizedBox(),
                                                      Text(
                                                        record.dataAddress!
                                                                .city ??
                                                            '',
                                                        style: logic.isDarkTheme
                                                            ? eDarkSmallTextStyleSTL
                                                            : eDarkSmallTextStyleSTL,
                                                      ),
                                                      eCMediumSizedBox(),
                                                      eCMediumSizedBox(),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.access_time,
                                                            size: eSmallIcon,
                                                            color: eWhiteCLR,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "${record.operatingStartHours.toString().substring(0, 5)} - ${record.operatingEndHours.toString().substring(0, 5)}",
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eDarkExtraSmallTextStyleSTL
                                                                : eDarkExtraSmallTextStyleSTL,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .location_on_outlined,
                                                            size: eSmallIcon,
                                                            color: eWhiteCLR,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            '2.5 km',
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eDarkExtraSmallTextStyleSTL
                                                                : eDarkExtraSmallTextStyleSTL,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          const Icon(
                                                            Icons
                                                                .star_border_outlined,
                                                            size: eSmallIcon,
                                                            color: eWhiteCLR,
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            '4.5',
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eDarkExtraSmallTextStyleSTL
                                                                : eDarkExtraSmallTextStyleSTL,
                                                          ),
                                                        ],
                                                      ),
                                                      eCMediumSizedBox(),
                                                      Text(
                                                        record.description ??
                                                            '',
                                                        style: logic.isDarkTheme
                                                            ? eDarkSmallTextStyleSTL
                                                            : eDarkSmallTextStyleSTL,
                                                      ),
                                                      eCMediumSizedBox(),
                                                      eCMediumSizedBox(),
                                                      Text(
                                                        eAmenities.tr,
                                                        style: logic.isDarkTheme
                                                            ? eDarkSmallTextStyleSTL
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)
                                                            : eDarkSmallTextStyleSTL
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                      ),
                                                      eCMediumSizedBox(),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.062,
                                                        child: ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            shrinkWrap: true,
                                                            itemCount: record
                                                                    .amenitiesList
                                                                    ?.length ??
                                                                0,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              Amenities
                                                                  amenities =
                                                                  record.amenitiesList![
                                                                      index];
                                                              return Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        18.0),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.03,
                                                                      child: getAmenityIcon(amenities
                                                                          .name
                                                                          .toString()),
                                                                    ),
                                                                    Text(
                                                                      amenities
                                                                              .name ??
                                                                          '',
                                                                      style: logic
                                                                              .isDarkTheme
                                                                          ? eDarkExtraSmallTextStyleSTL
                                                                          : eDarkExtraSmallTextStyleSTL,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }),
                                                      ),
                                                      eCMediumSizedBox(),
                                                      Text(
                                                        ePayment.tr,
                                                        style: logic.isDarkTheme
                                                            ? eDarkSmallTextStyleSTL
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)
                                                            : eDarkSmallTextStyleSTL
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                      ),
                                                      eCMediumSizedBox(),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.062,
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: record
                                                                  .paymentMethodsList
                                                                  ?.length ??
                                                              0,
                                                          itemBuilder:
                                                              (context, index) {
                                                            PaymentMethods
                                                                method =
                                                                record.paymentMethodsList![
                                                                    index];
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          18.0),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        Get.height *
                                                                            0.03,
                                                                    child: method.icon !=
                                                                            null
                                                                        ? Image.asset(
                                                                            "assets/icons/${method.name.toString()}_icon.png"
                                                                                .toString(),
                                                                            fit:
                                                                                BoxFit.contain)
                                                                        : const Icon(
                                                                            FontAwesomeIcons.addressBook,
                                                                          ),
                                                                  ),
                                                                  Text(
                                                                    method.name ??
                                                                        '',
                                                                    style: logic
                                                                            .isDarkTheme
                                                                        ? eDarkExtraSmallTextStyleSTL
                                                                        : eDarkExtraSmallTextStyleSTL,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      eCMediumSizedBox(),
                                                      eCMediumSizedBox(),
                                                      Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () async {
                                                              if (record.phone ==
                                                                      null ||
                                                                  record.phone!
                                                                      .isEmpty) {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) =>
                                                                          AlertDialog(
                                                                    title: Text(
                                                                        ePhoneNumber
                                                                            .tr),
                                                                    titleTextStyle: logic
                                                                            .isDarkTheme
                                                                        ? eDarkMediumTextStyleSTL
                                                                        : eLightMediumTextStyleSTL,
                                                                    content: Text(
                                                                        ePhoneNumberText
                                                                            .tr),
                                                                    contentTextStyle: logic
                                                                            .isDarkTheme
                                                                        ? eDarkSmallTextStyleSTL
                                                                        : eLightSmallTextStyleSTL,
                                                                    backgroundColor: logic
                                                                            .isDarkTheme
                                                                        ? eShaddowColor
                                                                        : eWhiteCLR,
                                                                    actions: <Widget>[
                                                                      TextButton(
                                                                          child:
                                                                              Text(
                                                                            eOk.tr,
                                                                            style: logic.isDarkTheme
                                                                                ? eDarkSmallTitleStyleSTL
                                                                                : eLightSmallTitleStyleSTL,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Get.back();
                                                                          }),
                                                                    ],
                                                                  ),
                                                                );
                                                              } else {
                                                                final Uri url =
                                                                    Uri(
                                                                  scheme: 'tel',
                                                                  path: record
                                                                      .phone,
                                                                );
                                                                if (await canLaunchUrl(
                                                                    url)) {
                                                                  await launchUrl(
                                                                      url);
                                                                } else {
                                                                  print(
                                                                      "Can't launch the URL");
                                                                }
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: eDPrimaryCLR2
                                                                    .withOpacity(
                                                                        1),
                                                              ),
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons.phone,
                                                                  size:
                                                                      eSmallIcon,
                                                                  color: logic
                                                                          .isDarkTheme
                                                                      ? eWhiteCLR
                                                                      : eWhiteCLR,
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          /*  GestureDetector(

                                                            onTap: () async{

                                                              final Uri url= Uri(
                                                                scheme: 'tel',

                                                                path: record.phone.toString() ?? ""
                                                              );

                                                              if(await canLaunchUrl(url)){
                                                                await launchUrl(url);
                                                              }else{
                                                                print("Can't launch the Url");
                                                              }

                                                            },
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: eDPrimaryCLR2
                                                                    .withOpacity(
                                                                        1),
                                                              ),
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons.phone,
                                                                  size:
                                                                      eSmallIcon,
                                                                  color: logic
                                                                          .isDarkTheme
                                                                      ? eWhiteCLR
                                                                      : eWhiteCLR,
                                                                ),
                                                              ),
                                                            ),
                                                          ),*/
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              final latitude = homeController
                                                                      .stationData[
                                                                          homeController
                                                                              .selectedConnectorIndex]
                                                                      .locationLatitude ??
                                                                  "";
                                                              final longitude =
                                                                  homeController
                                                                          .stationData[
                                                                              homeController.selectedConnectorIndex]
                                                                          .locationLongitude ??
                                                                      "";

                                                              if (latitude
                                                                      .isNotEmpty &&
                                                                  longitude
                                                                      .isNotEmpty) {
                                                                mGoogleCtl.lat(
                                                                    double.parse(
                                                                        latitude));
                                                                mGoogleCtl.lon(
                                                                    double.parse(
                                                                        longitude));

                                                                Get.toNamed(
                                                                    RoutesName
                                                                        .directionGoogleMapPage);
                                                              } else {
                                                                Get.snackbar(
                                                                  eError.tr,
                                                                  eLocationCoordinatesAreNotAvailableTxt
                                                                      .tr,
                                                                  snackPosition:
                                                                      SnackPosition
                                                                          .BOTTOM,
                                                                );
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: eDPrimaryCLR2
                                                                    .withOpacity(
                                                                        1),
                                                              ),
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons
                                                                      .directions,
                                                                  size:
                                                                      eSmallIcon,
                                                                  color: logic
                                                                          .isDarkTheme
                                                                      ? eWhiteCLR
                                                                      : eWhiteCLR,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      eCMediumSizedBox(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.35,
                            width: double.maxFinite,
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.circle_notifications_outlined,
                                        size: eSmallIcon,
                                        color: logic.isDarkTheme
                                            ? eWhiteCLR
                                            : eHintCLR,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.8,
                                        child: Text(
                                          eThisStationisSuitablewithAllofYourVehiclesTxt
                                              .tr,
                                          style: logic.isDarkTheme
                                              ? eDarkExtraSmallTextStyleSTL
                                              : eLightExtraSmallTextStyleSTL,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                eCMediumSizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 2),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      eChargers.tr,
                                      style: logic.isDarkTheme
                                          ? eDarkSmallTextStyleSTL.copyWith(
                                              fontWeight: FontWeight.bold)
                                          : eLightSmallTextStyleSTL.copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),

                                // eCMediumSizedBox(),

                                eCMediumSizedBox(),
                                SizedBox(
                                  height: Get.height * 0.14,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.00, vertical: 2.0),
                                    child: record.chargerpoints?.length == 0
                                        ? Center(
                                            child: Text(
                                                eNoChargerDataAvailableTxt.tr),
                                          )
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                record.chargerpoints?.length ??
                                                    0,
                                            itemBuilder: (context, index) {
                                              //homeController.stationData[homeController.selectedStationIndex].chargerpoints?[bookingController.selectedChargerIndex]  ;

                                              ChargerPoint charger =
                                                  record.chargerpoints![index];
                                              bool isSelected = homeController
                                                      .selectedChargerIndex ==
                                                  index;
                                              return InkWell(
                                                onTap: () {
                                                  homeController
                                                          .selectedChargerIndex =
                                                      index;
                                                  PreferenceUtils.setInt(
                                                      eSelectedChargerId,
                                                      homeController
                                                              .stationData[
                                                                  homeController
                                                                      .selectedStationIndex]
                                                              .chargerpoints?[
                                                                  homeController
                                                                      .selectedChargerIndex]
                                                              .id ??
                                                          0);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 4.0,
                                                      vertical: 0),
                                                  child: Container(
                                                    width: Get.width * 0.87,
                                                    height: Get.height * 0.14,
                                                    decoration: BoxDecoration(
                                                        color: logic.isDarkTheme
                                                            ? eCardColor
                                                            : eWhiteCLR,
                                                        border: Border.all(
                                                            color: isSelected
                                                                ? Colors.green
                                                                : (logic.isDarkTheme
                                                                    ? Colors
                                                                        .transparent
                                                                    : eLightThemeBorderCLR),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    12.0)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8.0,
                                                              bottom: 0,
                                                              top: 0.0),
                                                      child: Column(
                                                        children: [
                                                          eCMediumSizedBox(),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Center(
                                                                  child: Text(
                                                                      charger.title ??
                                                                          '',
                                                                      style: logic
                                                                              .isDarkTheme
                                                                          ? eDarkSmallTextStyleSTL.copyWith(
                                                                              fontWeight: FontWeight.bold)
                                                                          : eLightSmallTextStyleSTL.copyWith(fontWeight: FontWeight.bold)),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .electric_bolt_outlined,
                                                                      size:
                                                                          eSmallIcon,
                                                                      color: logic
                                                                              .isDarkTheme
                                                                          ? eWhiteCLR
                                                                          : eBlackCLR,
                                                                    ),
                                                                    Text(
                                                                      ' ${charger.chargingType ?? ''}',
                                                                      style: logic
                                                                              .isDarkTheme
                                                                          ? eDarkSmallTextStyleSTL
                                                                          : eLightSmallTextStyleSTL,
                                                                    ),
                                                                    SizedBox(
                                                                      width: Get
                                                                              .width *
                                                                          0.07,
                                                                    ),
                                                                    Icon(
                                                                      Icons
                                                                          .album_rounded,
                                                                      size:
                                                                          eSmallIcon,
                                                                      color: record.powerCapacity !=
                                                                              null
                                                                          ? Colors
                                                                              .lightGreenAccent
                                                                          : Colors
                                                                              .redAccent,
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: GridView
                                                                    .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  gridDelegate:
                                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        2,
                                                                    // number of items in each row
                                                                    mainAxisSpacing:
                                                                        2.0,
                                                                    // spacing between rows
                                                                    crossAxisSpacing:
                                                                        0.0, // spacing between columns
                                                                  ),

                                                                  /*   itemCount: charger
                                                                          .connectors
                                                                          ?.length ??
                                                                      0,*/
                                                                  itemCount: charger
                                                                          .connectors
                                                                          ?.where((connector) =>
                                                                              connector.title !=
                                                                              "0")
                                                                          .length ??
                                                                      0,

                                                                  /* itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    Connectors
                                                                        connector =
                                                                        charger.connectors![
                                                                            index];*/
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    Connectors connector = charger
                                                                        .connectors!
                                                                        .where((connector) =>
                                                                            connector.title !=
                                                                            "0")
                                                                        .toList()[index];

                                                                    return Center(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          eCMediumSizedBox(),
                                                                          SizedBox(
                                                                            height:
                                                                                Get.height * 0.025,
                                                                            child:
                                                                                Image.asset("assets/icons/ccs2.png", color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(3.0),
                                                                            child:
                                                                                Text(
                                                                              connector.title ?? '',
                                                                              overflow: TextOverflow.ellipsis,
                                                                              maxLines: 1,
                                                                              style: logic.isDarkTheme ? eDarkExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900) : eLightExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      eMaxCapacityTxt
                                                                          .tr,
                                                                      style: logic
                                                                              .isDarkTheme
                                                                          ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                              fontWeight: FontWeight.normal)
                                                                          : eLightExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.normal),
                                                                    ),
                                                                    Text(
                                                                      "${record.powerCapacity}",
                                                                      style: logic
                                                                              .isDarkTheme
                                                                          ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                              fontWeight: FontWeight.w900)
                                                                          : eLightExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "${record.pricingTitle}",
                                                                      style: logic
                                                                              .isDarkTheme
                                                                          ? eDarkMediumTextStyleSTL.copyWith(
                                                                              fontWeight: FontWeight.w900)
                                                                          : eLightMediumTextStyleSTL.copyWith(fontWeight: FontWeight.w900),
                                                                    ),
                                                                    Text(
                                                                      ePerKWTxt
                                                                          .tr,
                                                                      style: logic
                                                                              .isDarkTheme
                                                                          ? eDarkExtraSmallTextStyleSTL.copyWith(
                                                                              fontWeight: FontWeight.normal)
                                                                          : eLightExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.normal),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                  ),
                                ),
                                eCMediumSizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 2),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      eConnector.tr,
                                      style: logic.isDarkTheme
                                          ? eDarkSmallTextStyleSTL.copyWith(
                                              fontWeight: FontWeight.bold)
                                          : eLightSmallTextStyleSTL.copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                eCMediumSizedBox(),
                                // SizedBox(
                                //   height: Get.height * 0.1,
                                //   width: Get.width * 0.08,
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(
                                //         horizontal: 16.00, vertical: 2.0),
                                //     child: homeController
                                //                     .stationData[homeController
                                //                         .selectedStationIndex]
                                //                     .chargerpoints?[
                                //                 homeController
                                //                     .selectedChargerIndex] ==
                                //             null
                                //         ? Center(
                                //             child: Text(
                                //                 eNoChargerAreSelectedTxt.tr),
                                //           )
                                //         : record
                                //                     .chargerpoints?[homeController
                                //                         .selectedChargerIndex]
                                //                     .connectors!
                                //                     .length ==
                                //                 0
                                //             ? Center(
                                //                 child: Text(
                                //                     eNoConnectorAreSelectedTxt
                                //                         .tr),
                                //               )
                                //             : SizedBox.expand(
                                //                 child: ListView.builder(
                                //                   scrollDirection:
                                //                       Axis.horizontal,
                                //                   shrinkWrap: true,
                                //                   /*    gridDelegate:
                                //     const SliverGridDelegateWithFixedCrossAxisCount(
                                //       crossAxisCount:
                                //       2,
                                //       // number of items in each row
                                //       mainAxisSpacing:
                                //       2.0,
                                //       // spacing between rows
                                //       crossAxisSpacing:
                                //       0.0, // spacing between columns
                                //     ),*/
                                //                   itemCount: homeController
                                //                           .stationData[
                                //                               homeController
                                //                                   .selectedStationIndex]
                                //                           .chargerpoints?[
                                //                               homeController
                                //                                   .selectedChargerIndex]
                                //                           .connectors!
                                //                           .length ??
                                //                       0,
                                //                   itemBuilder:
                                //                       (context, index) {
                                //                     bool isSelected = homeController
                                //                             .selectedConnectorIndex ==
                                //                         index;
                                //                     Color connectorColor =
                                //                         isSelected
                                //                             ? Colors.green
                                //                             : (logic.isDarkTheme
                                //                                 ? eWhiteCLR
                                //                                 : eBlackCLR);
                                //
                                //                     return Center(
                                //                       child: InkWell(
                                //                         onTap: () {
                                //                           homeController
                                //                                   .selectedConnectorIndex =
                                //                               index;
                                //                           PreferenceUtils.setInt(
                                //                               eSelectedConnectorId,
                                //                               homeController
                                //                                       .stationData[
                                //                                           homeController
                                //                                               .selectedStationIndex]
                                //                                       .chargerpoints?[
                                //                                           homeController
                                //                                               .selectedChargerIndex]
                                //                                       .connectors![
                                //                                           index]
                                //                                       .id ??
                                //                                   0);
                                //                         },
                                //                         child: SizedBox(
                                //                           height:
                                //                               Get.height * 0.08,
                                //                           width:
                                //                               Get.width * 0.4,
                                //                           child: Column(
                                //                             children: [
                                //                               eCMediumSizedBox(),
                                //                               SizedBox(
                                //                                 height:
                                //                                     Get.height *
                                //                                         0.025,
                                //                                 child: Image.asset(
                                //                                     "assets/icons/ccs2.png",
                                //                                     color:
                                //                                         connectorColor),
                                //                               ),
                                //                               Padding(
                                //                                 padding:
                                //                                     const EdgeInsets
                                //                                         .all(
                                //                                         3.0),
                                //                                 child: Text(
                                //                                   homeController
                                //                                           .stationData[homeController
                                //                                               .selectedStationIndex]
                                //                                           .chargerpoints?[homeController
                                //                                               .selectedChargerIndex]
                                //                                           .connectors?[
                                //                                               index]
                                //                                           .title ??
                                //                                       '',
                                //                                   overflow:
                                //                                       TextOverflow
                                //                                           .ellipsis,
                                //                                   maxLines: 1,
                                //                                   style: isSelected
                                //                                       ? eDarkExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900, color: Colors.green)
                                //                                       : logic.isDarkTheme
                                //                                           ? eDarkExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900)
                                //                                           : eLightExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900),
                                //                                 ),
                                //                               ),
                                //                             ],
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     );
                                //                   },
                                //                 ),
                                //               ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.08,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.00, vertical: 2.0),
                                    child: homeController
                                                    .stationData[homeController
                                                        .selectedStationIndex]
                                                    .chargerpoints?[
                                                homeController
                                                    .selectedChargerIndex] ==
                                            null
                                        ? Center(
                                            child: Text(
                                                eNoChargerAreSelectedTxt.tr),
                                          )
                                        : record
                                                    .chargerpoints?[homeController
                                                        .selectedChargerIndex]
                                                    .connectors!
                                                    .length ==
                                                0
                                            ? Center(
                                                child: Text(
                                                    eNoConnectorAreSelectedTxt
                                                        .tr),
                                              )
                                            : SizedBox.expand(
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  /*    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                      2,
                                      // number of items in each row
                                      mainAxisSpacing:
                                      2.0,
                                      // spacing between rows
                                      crossAxisSpacing:
                                      0.0, // spacing between columns
                                    ),*/

                                                  // itemCount: homeController
                                                  //     .stationData[
                                                  // homeController
                                                  //     .selectedStationIndex]
                                                  //     .chargerpoints?[
                                                  // homeController
                                                  //     .selectedChargerIndex]
                                                  //     .connectors!
                                                  //     .length ??
                                                  //     0,

                                                  itemCount: homeController
                                                          .stationData[
                                                              homeController
                                                                  .selectedStationIndex]
                                                          .chargerpoints?[
                                                              homeController
                                                                  .selectedChargerIndex]
                                                          .connectors!
                                                          .where((connector) =>
                                                              connector.title !=
                                                              "0")
                                                          .length ??
                                                      0,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final filteredConnectors =
                                                        homeController
                                                            .stationData[
                                                                homeController
                                                                    .selectedStationIndex]
                                                            .chargerpoints?[
                                                                homeController
                                                                    .selectedChargerIndex]
                                                            .connectors!
                                                            .where((connector) =>
                                                                connector
                                                                    .title !=
                                                                "0")
                                                            .toList();
                                                    final connector =
                                                        filteredConnectors![
                                                            index];
                                                    bool isSelected = homeController
                                                            .selectedConnectorIndex ==
                                                        index;
                                                    Color connectorColor =
                                                        isSelected
                                                            ? Colors.green
                                                            : (logic.isDarkTheme
                                                                ? eWhiteCLR
                                                                : eBlackCLR);

                                                    return Center(
                                                      child: InkWell(
                                                        onTap: () {
                                                          homeController
                                                                  .selectedConnectorIndex =
                                                              index;
                                                          PreferenceUtils.setInt(
                                                              eSelectedConnectorId,
                                                              homeController
                                                                      .stationData[
                                                                          homeController
                                                                              .selectedStationIndex]
                                                                      .chargerpoints?[
                                                                          homeController
                                                                              .selectedChargerIndex]
                                                                      .connectors![
                                                                          index]
                                                                      .id ??
                                                                  0);
                                                        },
                                                        child: SizedBox(
                                                          height:
                                                              Get.height * 0.08,
                                                          width:
                                                              Get.width * 0.4,
                                                          child: Column(
                                                            children: [
                                                              eCMediumSizedBox(),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.025,
                                                                child: Image.asset(
                                                                    "assets/icons/ccs2.png",
                                                                    color:
                                                                        connectorColor),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        3.0),
                                                                child: Text(
                                                                  // homeController
                                                                  //     .stationData[homeController
                                                                  //     .selectedStationIndex]
                                                                  //     .chargerpoints?[homeController
                                                                  //     .selectedChargerIndex]
                                                                  //     .connectors?[
                                                                  // index]
                                                                  //     .title ??
                                                                  //     '',
                                                                  connector
                                                                          .title ??
                                                                      "",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  style: isSelected
                                                                      ? eDarkExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900, color: Colors.green)
                                                                      : logic.isDarkTheme
                                                                          ? eDarkExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900)
                                                                          : eLightExtraSmallTextStyleSTL.copyWith(fontWeight: FontWeight.w900),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                  ),
                                ),

                                eCMediumSizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 3,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: logic.isDarkTheme
                                              ? eLightCouponCLR
                                              : eLightCouponCLR,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: logic.isDarkTheme
                                              ? eLightCouponCLR
                                              : eLightCouponCLR,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 8,
                                      decoration: BoxDecoration(
                                          color: logic.isDarkTheme
                                              ? eLightCouponCLR
                                              : eLightCouponCLR,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                  ],
                                ),
                                eCMediumSizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 2),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      eRatingAndReview.tr,
                                      style: logic.isDarkTheme
                                          ? eDarkSmallTextStyleSTL.copyWith(
                                              fontWeight: FontWeight.bold)
                                          : eLightSmallTextStyleSTL.copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                eCMediumSizedBox(),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 2),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.end,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: logic.isDarkTheme
                                                    ? eCardColor
                                                    : eWhiteCLR,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: logic.isDarkTheme
                                                        ? Colors.transparent
                                                        : eLightCouponCLR,
                                                    width: 1)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "4.5",
                                                    style: logic.isDarkTheme
                                                        ? eDarkMediumTextStyleSTL
                                                        : eLightMediumTextStyleSTL,
                                                  ),
                                                  const SizedBox(height: 4),
                                                  RatingWidget(rating: 4.5),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Top-notch EV charging station! Convenient, fast, and user-friendly. Rated 4.5 for a consistently excellent experience.",
                                            textAlign: TextAlign.justify,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: logic.isDarkTheme
                                                ? eDarkExtraSmallTextStyleSTL
                                                : eLightExtraSmallTextStyleSTL,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                eCELargeSizedBox(),
                                eCELargeSizedBox(),
                                eCELargeSizedBox(),
                                eCELargeSizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.width * 0.42,
                        child: eStationDetailsButton(
                          logic,
                          title: eBookSlot.tr,
                          onPressed: () {
                            if (homeController.selectedChargerIndex == null &&
                                homeController.selectedConnectorIndex == null) {
                              Get.snackbar(
                                  eError.tr, eNotSelectChargerAndConnector.tr,
                                  snackPosition: SnackPosition.BOTTOM);
                            } else if (homeController.selectedChargerIndex ==
                                null) {
                              Get.snackbar(eError.tr, eNotSelectChargerTxt.tr,
                                  snackPosition: SnackPosition.BOTTOM);
                            } else if (homeController.selectedConnectorIndex ==
                                null) {
                              Get.snackbar(eError.tr, eNotSelectConnectorTxt.tr,
                                  snackPosition: SnackPosition.BOTTOM);
                            } else {
                              PreferenceUtils.setString(
                                  eStationOperatingHours,
                                  homeController
                                          .stationData[homeController
                                              .selectedStationIndex]
                                          .operatingStartHours ??
                                      "");
                              PreferenceUtils.setInt(
                                  eSelectedChargerId,
                                  homeController
                                          .stationData[homeController
                                              .selectedStationIndex]
                                          .chargerpoints?[homeController
                                              .selectedChargerIndex]
                                          .id ??
                                      0);
                              PreferenceUtils.setInt(
                                  eSelectedConnectorId,
                                  homeController
                                          .stationData[homeController
                                              .selectedStationIndex]
                                          .chargerpoints?[homeController
                                              .selectedChargerIndex]
                                          .connectors![homeController
                                              .selectedConnectorIndex]
                                          .id ??
                                      0);
                              Get.toNamed(RoutesName.slotBookingPage);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.42,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: eStationDetailsButton(
                            logic,
                            title: eDirection.tr,
                            onPressed: () {
                              final latitude = homeController
                                      .stationData[
                                          homeController.selectedConnectorIndex]
                                      .locationLatitude ??
                                  "";
                              final longitude = homeController
                                      .stationData[
                                          homeController.selectedConnectorIndex]
                                      .locationLongitude ??
                                  "";

                              if (latitude.isNotEmpty && longitude.isNotEmpty) {
                                mGoogleCtl.lat(double.parse(latitude));
                                mGoogleCtl.lon(double.parse(longitude));

                                Get.toNamed(RoutesName.directionGoogleMapPage);
                              } else {
                                Get.snackbar(
                                  eError.tr,
                                  eLocationCoordinatesAreNotAvailableTxt.tr,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  /*floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width * 0.42,
                      child: eStationDetailsButton(
                        logic,
                        title: "Book Slot",
                        onPressed: () {
                          if (homeController.selectedChargerIndex == null &&
                              homeController.selectedConnectorIndex == null) {
                            Get.snackbar("Error",
                                "You have not selected a charger and a connector",
                                snackPosition: SnackPosition.BOTTOM);
                          } else if (homeController.selectedChargerIndex ==
                              null) {
                            Get.snackbar(
                                "Error", "You have not selected a charger",
                                snackPosition: SnackPosition.BOTTOM);
                          } else if (homeController.selectedConnectorIndex ==
                              null) {
                            Get.snackbar(
                                "Error", "You have not selected a connector",
                                snackPosition: SnackPosition.BOTTOM);
                          } else {
                            PreferenceUtils.setString(
                                eStationOperatingHours,
                                homeController
                                        .stationData[
                                            homeController.selectedStationIndex]
                                        .operatingHours ??
                                    "");
                            PreferenceUtils.setInt(
                                eSelectedChargerId,
                                homeController
                                        .stationData[
                                            homeController.selectedStationIndex]
                                        .chargerpoints?[
                                            homeController.selectedChargerIndex]
                                        .id ??
                                    0);
                            PreferenceUtils.setInt(
                                eSelectedConnectorId,
                                homeController
                                        .stationData[
                                            homeController.selectedStationIndex]
                                        .chargerpoints?[
                                            homeController.selectedChargerIndex]
                                        .connectors![homeController
                                            .selectedConnectorIndex]
                                        .id ??
                                    0);
                            Get.toNamed(RoutesName.slotBookingPage);
                            print(
                                "Charger id :${homeController.stationData[homeController.selectedStationIndex].chargerpoints?[homeController.selectedChargerIndex].id.toString()}");
                            print(
                                "Connector id :${homeController.stationData[homeController.selectedStationIndex].chargerpoints?[homeController.selectedChargerIndex].connectors![homeController.selectedConnectorIndex].id.toString()}");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.42,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                            child: eStationDetailsButton(logic,
                                title: "Direction", onPressed: () {
                          // Get.back();
                        })),
                      ),
                    ),
                  ],
                ),*/
                );
              });
            });
          },
        );
      },
    );
  }

  Widget getAmenityIcon(String amenityName) {
    IconData iconData;
    Color iconColor = eWhiteCLR;

    switch (amenityName) {
      case "Cafe":
        iconData = Icons.coffee_outlined;
        break;
      case "Toilet":
        iconData = Icons.meeting_room_outlined;
        break;
      case "Parking":
        iconData = Icons.local_parking;
        break;
      case "Food":
        iconData = Icons.fastfood_outlined;
        break;
      default:
        iconData = Icons.error_outline;
    }

    return SizedBox(
      width: eSmallIcon,
      height: eSmallIcon,
      child: Icon(
        iconData,
        size: eSmallIcon,
        color: iconColor,
      ),
    );
  }
}
