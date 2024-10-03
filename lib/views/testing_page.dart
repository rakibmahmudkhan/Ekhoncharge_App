import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/charger_box_controller.dart';
import 'package:ekhoncharge/controller/pusher_controller.dart';
import 'package:ekhoncharge/models/charger_points.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/views/charging_page.dart';
import 'package:ekhoncharge/widgets/availableWidget.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/occupiedWidget.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> with WidgetsBindingObserver {
  var mChargerBoxCtl = Get.find<ChargerBoxController>();
  PusherController pusherController = Get.put(PusherController());

  @override
  void initState() {
    super.initState();
    // mChargerBoxCtl.fetchChargerPointCtl(isAuto: false);
    // WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mChargerBoxCtl.fetchChargerPointCtl();
    });
  }

  @override
  void dispose() {
    super.dispose();
    // pusherController.onDisConnectAndUnsubscribeFromPusher();
    // mChargerBoxCtl.cancelTimer();
    // WidgetsBinding.instance.removeObserver(this);
    // super.dispose();
  }

  @override
  void deactivate() {
    pusherController.onDisConnectAndUnsubscribeFromPusher();
    super.deactivate();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // if (state == AppLifecycleState.paused) {
    //   mChargerBoxCtl.cancelTimer();
    // } else if (state == AppLifecycleState.resumed) {
    //   mChargerBoxCtl.fetchChargerPointCtl(isAuto: true);
    //   mChargerBoxCtl.setTimer();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<PusherController>(builder: (pusherCtl) {
        print(pusherCtl.pusherData);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          body:

              //**********This Design for StatusNotification && Available*********
             /* SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // eCEELargeSizedBox(),
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  // eCEELargeSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0, top: 4.0, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            "EKHON-CHARGE-001"
                        //      pusherCtl.pusherData[
                        // 'eventDetails']
                        // ['status'] ??
                        //     ''
                            ,
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          )
                        ]),
                        Text(
                          '${DateTime.now().hour}:${DateTime.now().minute}  ',
                          style: logic.isDarkTheme
                              ? eDarkSmallTextStyleSTL
                              : eLightSmallTextStyleSTL,
                        ),
                      ],
                    ),
                  ),
                  eCSmallSizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: const Color.fromRGBO(29, 32, 39, 100),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              // Rounded border
                              border: Border.all(
                                color: Colors.white, // Border color
                                width: 1.0, // Border width
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image(
                                height: 550.0,
                                width: Get.width * 1,
                                image: const AssetImage(
                                    "assets/images/2d_charger.jpg"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            left: 54,
                            child: Container(
                              width: Get.width * 0.6,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      // chargingCtl.chargerPointData.uuid ?? '',

                                      "Connector: CSS A",
                                      style: logic.isDarkTheme
                                          ? eDarkLTextStyleSTL
                                          : eLightLTextStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),
                                    eCMediumSizedBox(),
                                    Text(
                                      // chargingCtl.chargerPointData.uuid ?? '',

                                      "Please Connect Your Vehicle   With Charger...",
                                      style: logic.isDarkTheme
                                          ? eDarkMediumTitleStyleSTL
                                          : eLightMediumTitleStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  eCELargeSizedBox(),
                  eCMediumSizedBox(),

                  Card(
                    elevation: 7.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: const Color.fromRGBO(116, 134, 134, 100),
                    child: Container(
                      height: Get.height * 0.081,
                      width: Get.width * 0.680,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        // itemCount: chargingCtl
                        //         .chargerPointData.connectors?.length ??
                        //     0,
                        itemBuilder: (context, index) {
                          // Connectors record = chargingCtl
                          //     .chargerPointData.connectors![index];
                          return availableWidget(
                              no: index == 0 ? 'A' : 'B',
                              name: index == 0 ?'CSS A':"CSS B",
                              status: index == 0 ?"Available":"Preparing");

                          // record.connectorStatus?.status ==
                          //       'Available'
                          //   ? availableWidget(
                          //       no: index == 0 ? 'A' : 'B',
                          //       name: record.title ?? '',
                          //       status:
                          //           record.connectorStatus?.status ??
                          //               '')
                          //   : occupiedWidget(
                          //       no: index == 0 ? 'A' : 'B',
                          //       name: record.title ?? '',
                          //       status:
                          //           record.connectorStatus?.status ??
                          //               '');
                        },
                      ),
                    ),
                  ),


                  //  eCEELargeSizedBox(),
                  // Spacer(),
                ]),
          ),*/


          //**********This Design for StatusNotification && Charging*********
          //Go to Charging page
          //**********This Design for StatusNotification && Faulted*********

//Other, Faulted,SuspendedEV, SuspendedEVSE, same as Available part UI

          //**********This Design for StatusNotification && Preparing*********
           SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // eCEELargeSizedBox(),
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  // eCEELargeSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0, top: 4.0, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            "EKHON-CHARGE-001"
                        //      pusherCtl.pusherData[
                        // 'eventDetails']
                        // ['status'] ??
                        //     ''
                            ,
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          )
                        ]),
                        Text(
                          '${DateTime.now().hour}:${DateTime.now().minute}  ',
                          style: logic.isDarkTheme
                              ? eDarkSmallTextStyleSTL
                              : eLightSmallTextStyleSTL,
                        ),
                      ],
                    ),
                  ),
                  eCSmallSizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: const Color.fromRGBO(29, 32, 39, 100),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              // Rounded border
                              border: Border.all(
                                color: Colors.white, // Border color
                                width: 1.0, // Border width
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image(
                                height: 550.0,
                                width: Get.width * 1,
                                image: const AssetImage(
                                    "assets/images/2d_charger.jpg"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            left: 54,
                            child: Container(
                              width: Get.width * 0.6,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(


                                      "Connector: CSS A",
                                      style: logic.isDarkTheme
                                          ? eDarkLTextStyleSTL
                                          : eLightLTextStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),
                                    eCMediumSizedBox(),
                                    Text(
                                      // chargingCtl.chargerPointData.uuid ?? '',

                                      "Vehicle Connected.",
                                      style: logic.isDarkTheme
                                          ? eDarkMediumTitleStyleSTL
                                          : eLightMediumTitleStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  eCELargeSizedBox(),
                  eCMediumSizedBox(),

                  Card(
                    elevation: 7.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: const Color.fromRGBO(116, 134, 134, 100),
                    child: Container(
                      height: Get.height * 0.081,
                      width: Get.width * 0.680,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        // itemCount: chargingCtl
                        //         .chargerPointData.connectors?.length ??
                        //     0,
                        itemBuilder: (context, index) {
                          // Connectors record = chargingCtl
                          //     .chargerPointData.connectors![index];
                          return availableWidget(
                              no: index == 0 ? 'A' : 'B',
                              name: 'A',
                              status: 'Preparing');

                          // record.connectorStatus?.status ==
                          //       'Available'
                          //   ? availableWidget(
                          //       no: index == 0 ? 'A' : 'B',
                          //       name: record.title ?? '',
                          //       status:
                          //           record.connectorStatus?.status ??
                          //               '')
                          //   : occupiedWidget(
                          //       no: index == 0 ? 'A' : 'B',
                          //       name: record.title ?? '',
                          //       status:
                          //           record.connectorStatus?.status ??
                          //               '');
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible:"Preparing" ==
                        'Preparing',
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              width: Get.width * 0.37,
                              child: eButton(logic, title: "Start",
                                  onPressed: () async {
                                // await chargingCtl.startPostApi();
                              })),

                        ],
                      ),
                    ),
                  ),

                  //  eCEELargeSizedBox(),
                  // Spacer(),
                ]),
          ),

          //**********This Design for Press "Stop" Button and show payment details*********
          //Go to Payment Details Page


          //**********Old Part**************
          /* SafeArea(
            child: pusherCtl.pusherData['eventName'] == 'StatusNotification' &&
                pusherCtl.pusherData['eventDetails']['status'] ==
                    'Available'
                ? Center(
              child: Column(
                children: [
                  Text(
                      'EventName : ${pusherCtl.pusherData['eventName'] ?? ''}'),
                  Text(
                      'Status : ${pusherCtl.pusherData['eventDetails']['status'] ?? ''}'),
                  const Text('Connect your vehicle with charger'),
                ],
              ),
            )
                : pusherCtl.pusherData['eventName'] == 'StatusNotification' &&
                pusherCtl.pusherData['eventDetails']['status'] ==
                    'Preparing'
                ? Center(
              child: Column(
                children: [
                  Text(
                      'EventName : ${pusherCtl.pusherData['eventName'] ?? ''}'),
                  Text(
                      'Status : ${pusherCtl.pusherData['eventDetails']['status'] ?? ''}'),
                  const Text('Vehicle Connected'),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Start'))
                ],
              ),
            )
                : pusherCtl.pusherData['eventName'] ==
                'StatusNotification' &&
                pusherCtl.pusherData['eventDetails']['status'] ==
                    'Charging'
                ? ChargingPage()
                : pusherCtl.pusherData['eventName'] == 'MeterValues'
                ? Center(
              child: Column(
                children: [
                  Text(pusherCtl.pusherData['eventName'] ??
                      ''),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['Voltage']}'),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['CurrentImport']}'),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['Voltage']}'),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['SoC']}'),
                ],
              ),
            )
                : pusherCtl.pusherData['eventName'] ==
                'StartTransaction'
                ? Center(
              child: Column(
                children: [
                  Text(
                      pusherCtl.pusherData['eventName'] ??
                          ''),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['ocpptag']}'),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['customer_title']}'),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['start_value']}'),
                ],
              ),
            )
                : pusherCtl.pusherData['eventName'] ==
                'StopTransaction'
                ? Center(
              child: Column(
                children: [
                  Text(pusherCtl
                      .pusherData['eventName'] ??
                      ''),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['total_value_kwt']}'),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['total_value_wt']}'),
                  Text(
                      '${pusherCtl.pusherData['eventDetails']['stop_value']}'),
                ],
              ),
            )
                : Column(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  // eCEELargeSizedBox(),
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  // eCEELargeSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0,
                        top: 4.0,
                        left: 20,
                        right: 20),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            // chargingCtl.chargerPointData.title ?? '',
                            pusherCtl.pusherData[
                            'eventDetails']
                            ['status'] ??
                                '',
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          )
                        ]),
                        Text(
                          '${DateTime.now().hour}:${DateTime.now().minute}  ',
                          style: logic.isDarkTheme
                              ? eDarkSmallTextStyleSTL
                              : eLightSmallTextStyleSTL,
                        ),
                      ],
                    ),
                  ),
                  eCSmallSizedBox(),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(
                        horizontal: 20.0),
                    child: Card(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            12.0),
                      ),
                      color: const Color.fromRGBO(
                          29, 32, 39, 100),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(12.0),
                              // Rounded border
                              border: Border.all(
                                color: Colors
                                    .white, // Border color
                                width:
                                1.0, // Border width
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius
                                  .circular(12.0),
                              child: Image(
                                height: 550.0,
                                width: Get.width * 1,
                                image: const AssetImage(
                                    "assets/images/2d_charger.jpg"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            left: 74,
                            child: Container(
                              width: Get.width * 0.6,
                              child: Center(
                                child: Text(
                                  // chargingCtl.chargerPointData.uuid ?? '',
                                  'UUID WILL SET HERE',
                                  //"Please Connect Your Vehicle   With Charger...",
                                  style: logic
                                      .isDarkTheme
                                      ? eDarkELTextStyleSTL
                                      : eDarkELTextStyleSTL,
                                  textAlign: TextAlign
                                      .center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //eCMediumSizedBox(),
                  const Spacer(),
                  Card(
                    elevation: 7.0,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(
                            10.0)),
                    color: const Color.fromRGBO(
                        116, 134, 134, 100),
                    child: Container(
                      height: Get.height * 0.081,
                      width: Get.width * 0.680,
                      child: ListView.builder(
                        scrollDirection:
                        Axis.horizontal,
                        itemCount: 2,
                        // itemCount: chargingCtl
                        //         .chargerPointData.connectors?.length ??
                        //     0,
                        itemBuilder:
                            (context, index) {
                          // Connectors record = chargingCtl
                          //     .chargerPointData.connectors![index];
                          return availableWidget(
                              no: index == 0
                                  ? 'A'
                                  : 'B',
                              name: 'A',
                              status:
                              'status section');

                          // record.connectorStatus?.status ==
                          //       'Available'
                          //   ? availableWidget(
                          //       no: index == 0 ? 'A' : 'B',
                          //       name: record.title ?? '',
                          //       status:
                          //           record.connectorStatus?.status ??
                          //               '')
                          //   : occupiedWidget(
                          //       no: index == 0 ? 'A' : 'B',
                          //       name: record.title ?? '',
                          //       status:
                          //           record.connectorStatus?.status ??
                          //               '');
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: pusherCtl.pusherData[
                    'eventDetails']
                    ['status'] ==
                        'Available',
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .spaceAround,
                        children: [
                          SizedBox(
                              width: Get.width * 0.37,
                              child: eButton(logic,
                                  title: "Start",
                                  onPressed:
                                      () async {
                                    // await chargingCtl.startPostApi();
                                  })),
                          SizedBox(
                            width: Get.width * 0.37,
                            child: eButton(logic,
                                title: "Cancel",
                                onPressed: () async {
                                  // await chargingCtl.stopPostApi();
                                }, color: eDWarningCLR),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  eCEELargeSizedBox(),
                  // Spacer(),
                ]),
          )*/
        );
      });
    });
  }
}
