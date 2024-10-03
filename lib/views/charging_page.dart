import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/charger_box_controller.dart';
import 'package:ekhoncharge/controller/pusher_controller.dart';
import 'package:ekhoncharge/models/charger_points.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/availableWidget.dart';
import 'package:ekhoncharge/widgets/occupiedWidget.dart';
import 'package:ekhoncharge/widgets/reusableActionButton.dart';
import 'package:ekhoncharge/widgets/reusableAleartDialog.dart';
import 'package:ekhoncharge/widgets/reusableCard.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ChargingPage extends StatefulWidget {
  ChargingPage({super.key});

  @override
  State<ChargingPage> createState() => _ChargingPageState();
}

class _ChargingPageState extends State<ChargingPage>
    {

  PusherController pusherController = Get.put(PusherController());
  late AnimationController _controller;
  late Animation<double> _animAnimation;



  // pusherController.pusherData['eventDetails']['SoC'] ??'',

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 7),
  //   );
  //   _animAnimation = Tween<double>(
  //     begin: 0.0,
  //    end: 0.0 / 100,
  //   //  end: double.tryParse(pusherController.pusherData['eventDetails']['SoC']??"")??0.0 / 100,
  //   ).animate(_controller);
  //   _controller.forward();
  // }




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<PusherController>(builder: (pusherController) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            body: SafeArea(
              child: GetBuilder<ChargerBoxController>(builder: (chargingCtl) {
                // _animAnimation = Tween(
                //         begin: 0.0,
                //         end: double.parse(
                //                 '${chargingCtl.chargerPointData.chargingDetails?.percent ?? 0}') /
                //             100)
                //     .animate(_controller);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    eCEELargeSizedBox(),
                    eCEELargeSizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 4.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text(
                              pusherController.pusherData['chargerId'] ?? '',
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      // height: 400,
                      width: Get.width * 1,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    bottom: 10.0,
                                    top: 00),
                                child: Card(
                                  elevation: 7.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(15.0)),
                                  color: const Color.fromRGBO(29, 32, 39, 100),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      top: 0.0,
                                      bottom: 0.0,
                                    ),
                                    child: Image(
                                      height: 200.0,
                                      width: 340.0,
                                      image: AssetImage(
                                        "assets/images/charging_2.png",
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 145,
                                top: 28,
                                child: RichText(
                                  text: TextSpan(
                                    text: pusherController
                                        .pusherData['eventDetails']
                                    ['SoC'] ??
                                        '',
                                    style: logic.isDarkTheme
                                        ? eDarkELTextStyleSTL.copyWith(
                                        fontSize: eEELFontSize)
                                        : eDarkELTextStyleSTL.copyWith(
                                        fontSize: eEELFontSize),
                                    children: [
                                      TextSpan(
                                          text: ' %',
                                          style: logic.isDarkTheme
                                              ? eDarkELTextStyleSTL
                                              : eDarkELTextStyleSTL),
                                    ],
                                  ),
                                ),
                              ),
                              // Positioned(
                              //   left: 123,
                              //   bottom: 90,
                              //   child: StatefulBuilder(
                              //       builder: (context, setState) {
                              //         return AnimatedBuilder(
                              //           animation: _animAnimation,
                              //           builder: (context, child) {
                              //             return LinearPercentIndicator(
                              //               width: Get.width / 3.80,
                              //               lineHeight: 13.0,
                              //               percent: _animAnimation.value,
                              //               backgroundColor: Colors.white,
                              //               progressColor: Colors.lightGreenAccent,
                              //             );
                              //           },
                              //         );
                              //       }),
                              // ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 26, right: 26),
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eWhiteCLR,
                                      border: Border.all(
                                          width: 1,
                                          color: logic.isDarkTheme
                                              ? Colors.transparent
                                              : eDPrimaryCLR2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "Voltage:",
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                          const Spacer(),
                                          Text(
                                            pusherController.pusherData[
                                            'eventDetails']
                                            ['Voltage'] ??
                                                '',
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 2,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eWhiteCLR,
                                      border: Border.all(
                                          width: 1,
                                          color: logic.isDarkTheme
                                              ? Colors.transparent
                                              : eDPrimaryCLR2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "Current:",
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                          const Spacer(),
                                          Text(
                                            pusherController.pusherData[
                                            'eventDetails']
                                            ['CurrentImport'] ??
                                                '',
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 2,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eWhiteCLR,
                                      border: Border.all(
                                          width: 1,
                                          color: logic.isDarkTheme
                                              ? Colors.transparent
                                              : eDPrimaryCLR2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "Energy Delivered :",
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                          const Spacer(),
                                          Text(
                                            pusherController.pusherData[
                                            'eventDetails'][
                                            'energy_delivered_kw'] ??
                                                '',
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 2,
                                  color: Colors.transparent,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eWhiteCLR,
                                      border: Border.all(
                                          width: 1,
                                          color: logic.isDarkTheme
                                              ? Colors.transparent
                                              : eDPrimaryCLR2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            "Cost:",
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                          const Spacer(),
                                          Text(
                                            pusherController.pusherData[
                                            'eventDetails'][
                                            'cost'] ??
                                                '',
                                            style: logic.isDarkTheme
                                                ? eDarkSmallTextStyleSTL
                                                : eLightSmallTextStyleSTL,
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 7.0,
                          ),
                          Card(
                            elevation: 7.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: const Color.fromRGBO(116, 134, 134, 100),
                            child: SizedBox(
                                height: Get.height * 0.081,
                                width: Get.width * 0.880,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: chargingCtl.chargerPointData
                                      .connectors?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    Connectors record = chargingCtl
                                        .chargerPointData.connectors![index];
                                    pusherController
                                        .statusChargingConnectorChanged(
                                        status: pusherController
                                            .pusherData['eventDetails']
                                        ['status'],
                                        chargerId: pusherController
                                            .pusherData['connectorId']);
                                    bool isSelected = record.id ==
                                        pusherController
                                            .pusherData['connectorId'];
                                    return record.connectorStatus?.status ==
                                        'Available'
                                        ? availableWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status: record
                                            .connectorStatus?.status ??
                                            '')
                                        : occupiedWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status: record
                                            .connectorStatus?.status ??
                                            '');
                                  },
                                )),
                          ),
                          eCELargeSizedBox(),
                          eCELargeSizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  reusableAlertDialog(logic,
                                    title: "Charging Details  ",
                                    stationName: pusherController.pusherData['chargerId']?? '',
                                    content: SizedBox(
                                      height: 350,
                                      width: double.maxFinite,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          Stack(
                                            children: [
                                              Card(
                                                  elevation: 3.0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                                  color: const Color.fromRGBO(
                                                      116, 134, 134, 100),
                                                  child: SizedBox(
                                                    height: 220,
                                                    width: double.maxFinite,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:38.0),
                                                          child: RichText(
                                                            text: TextSpan(
                                                              text: pusherController.pusherData['eventDetails']['SoC'] ??
                                                                  "",
                                                              style: logic.isDarkTheme
                                                                  ? eDarkELTextStyleSTL
                                                                  .copyWith(
                                                                  fontSize:
                                                                  eEELFontSize)
                                                                  : eDarkELTextStyleSTL
                                                                  .copyWith(
                                                                  fontSize:
                                                                  eEELFontSize),
                                                              children: [
                                                                TextSpan(
                                                                    text: ' %',
                                                                    style: logic
                                                                        .isDarkTheme
                                                                        ? eDarkELTextStyleSTL
                                                                        : eDarkELTextStyleSTL),
                                                              ],
                                                            ),
                                                          ),
                                                        ),


                                                      ],
                                                    ),
                                                  )),
                                              Positioned(
                                                top: 10,
                                                left: 10,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: "Cost: ",
                                                      style: const TextStyle(
                                                          color:
                                                          Colors.lightGreenAccent,
                                                          fontSize: 15),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                            pusherController.pusherData[
                                                            'eventDetails'][
                                                            'cost'] ??
                                                                '',
                                                            style: logic.isDarkTheme
                                                                ? eDarkSmallTextStyleSTL
                                                                : eDarkSmallTextStyleSTL),
                                                        TextSpan(
                                                            text: ' \৳',
                                                            style: logic.isDarkTheme
                                                                ? eDarkSmallTextStyleSTL
                                                                : eDarkSmallTextStyleSTL),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Positioned(
                                              //   left: 27,
                                              //   bottom: 100,
                                              //   child: StatefulBuilder(builder: (context, setState) {
                                              //     return AnimatedBuilder(
                                              //       animation: _animAnimation,
                                              //       builder: (context, child) {
                                              //         return LinearPercentIndicator(
                                              //           width: Get.width / 3.80,
                                              //           lineHeight: 13.0,
                                              //           percent: _animAnimation.value ,
                                              //           backgroundColor: Colors.white,
                                              //           progressColor: Colors.lightGreenAccent,
                                              //         );
                                              //       },
                                              //     );
                                              //   }),
                                              // ),

                                              Positioned(
                                                left: 15,
                                                bottom: 30,
                                                child:  RichText(
                                                  text: TextSpan(
                                                    text:
                                                    "Energy \nDelivered: ",
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .lightGreenAccent,
                                                        fontSize: 15),
                                                    children: [
                                                      TextSpan(
                                                          text:
                                                          pusherController.pusherData[
                                                          'eventDetails']
                                                          ['energy_delivered_kw'] ?? "",
                                                          style: logic
                                                              .isDarkTheme
                                                              ? eDarkSmallTextStyleSTL
                                                              : eDarkSmallTextStyleSTL),
                                                      TextSpan(
                                                          text: '',
                                                          style: logic
                                                              .isDarkTheme
                                                              ? eDarkSmallTitleStyleSTL
                                                              : eDarkSmallTitleStyleSTL),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          reusableCard(logic,
                                              title: "Power",
                                              value: pusherController.pusherData[
                                              'eventDetails']
                                              ['PowerActiveImport'] ?? "",
                                              extension: ""),
                                          reusableCard(logic,
                                              title: "Voltage",
                                              value: pusherController.pusherData[
                                              'eventDetails']
                                              ['Voltage'] ?? "",
                                              extension: ""),
                                          reusableCard(logic,
                                              title: "Current",
                                              value: pusherController.pusherData[
                                              'eventDetails']
                                              ['CurrentImport'] ??
                                                  '',
                                              extension: ""),
                                        ],
                                      ),
                                    ),
                                    action: [
                                      reusableActionButton(
                                        logic,
                                        name: "Back",
                                        onPress: () {
                                          Get.back();
                                        },
                                      ),
                                      /*  reusableActionButton(
                                 logic,
                                 name: "Cancel",
                                 onPress: () {
                                   Get.back();
                                 },
                               ),*/
                                    ],
                                  );
                                  //_animController!.forward();
                                },
                                child: Card(
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                  color: const Color.fromRGBO(116, 134, 134, 100),
                                  child: SizedBox(
                                    height: 30,
                                    width: 75,
                                    child: Center(
                                        child: Text(
                                          "Details",
                                          style: logic.isDarkTheme
                                              ? eDarkSmallTextStyleSTL
                                              : eLightSmallTextStyleSTL,
                                        )),
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () async {
                                  await pusherController.stopPostApi();
                                },
                                child: Card(
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)),
                                  color: const Color.fromARGB(255, 248, 65, 77),
                                  child: SizedBox(
                                    height: 30,
                                    width: 75,
                                    child: Center(
                                        child: Text(
                                          "Stop",
                                          style: logic.isDarkTheme
                                              ? eDarkSmallTextStyleSTL
                                              : eLightSmallTextStyleSTL,
                                        )),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                  ],
                );
              }),
            ),
          );
        });
      },
    );
  }

/*  Widget chargingDialogContent(AppSystemController logic,
      ChargerBoxController chargingCtl, PusherController pusherController) {
    return SizedBox(
      // height: 400,
      width: Get.width * 1,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0, top: 00),
                child: Card(
                  elevation: 7.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: const Color.fromRGBO(29, 32, 39, 100),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 0.0,
                      bottom: 0.0,
                    ),
                    child: Image(
                      height: 200.0,
                      width: 340.0,
                      image: AssetImage(
                        "assets/images/charging_2.png",
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 145,
                top: 28,
                child: RichText(
                  text: TextSpan(
                    text: pusherController.pusherData['SoC'] ?? '',
                    style: logic.isDarkTheme
                        ? eDarkELTextStyleSTL.copyWith(fontSize: eEELFontSize)
                        : eDarkELTextStyleSTL.copyWith(fontSize: eEELFontSize),
                    children: [
                      TextSpan(
                          text: ' %',
                          style: logic.isDarkTheme
                              ? eDarkELTextStyleSTL
                              : eDarkELTextStyleSTL),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 123,
                bottom: 90,
                child: StatefulBuilder(builder: (context, setState) {
                  return AnimatedBuilder(
                    animation: _animAnimation!,
                    builder: (context, child) {
                      return LinearPercentIndicator(
                        width: Get.width / 3.80,
                        lineHeight: 13.0,
                        percent: _animAnimation!.value,
                        backgroundColor: Colors.white,
                        progressColor: Colors.lightGreenAccent,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 26, right: 26),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                      border: Border.all(
                          width: 1,
                          color: logic.isDarkTheme
                              ? Colors.transparent
                              : eDPrimaryCLR2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Voltage:",
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          ),
                          const Spacer(),
                          Text(
                            pusherController.pusherData['Voltage'] ?? '',
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 2,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                      border: Border.all(
                          width: 1,
                          color: logic.isDarkTheme
                              ? Colors.transparent
                              : eDPrimaryCLR2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Current:",
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          ),
                          const Spacer(),
                          Text(
                            pusherController.pusherData['CurrentImport'] ?? '',
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 2,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                      border: Border.all(
                          width: 1,
                          color: logic.isDarkTheme
                              ? Colors.transparent
                              : eDPrimaryCLR2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Energy Delivered :",
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          ),
                          const Spacer(),
                          Text(
                            pusherController
                                    .pusherData['EnergyActiveImportRegister'] ??
                                '',
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Card(
                //   elevation: 2,
                //   color: Colors.transparent,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                //       border: Border.all(
                //           width: 1,
                //           color: logic.isDarkTheme
                //               ? Colors.transparent
                //               : eDPrimaryCLR2),
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(4),
                //       ),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(12.0),
                //       child: Row(
                //         // mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           const SizedBox(
                //             width: 30,
                //           ),
                //           Text(
                //             "Cost:",
                //             style: logic.isDarkTheme
                //                 ? eDarkSmallTextStyleSTL
                //                 : eLightSmallTextStyleSTL,
                //           ),
                //           const Spacer(),
                //           Text(
                //             pusherController.pusherData['EnergyActiveImportRegister'],
                //             style: logic.isDarkTheme
                //                 ? eDarkSmallTextStyleSTL
                //                 : eLightSmallTextStyleSTL,
                //           ),
                //           const SizedBox(
                //             width: 30,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),

          Card(
            elevation: 7.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: const Color.fromRGBO(116, 134, 134, 100),

            // child: SizedBox(
            //   height: Get.height * 0.081,
            //   width: Get.width * 0.680,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: staticData.length,
            //     itemBuilder: (context, index) {
            //       final data = staticData[index];
            //       final no = data['no'];
            //       final name = data['name'];
            //       final status = data['status'];
            //
            //       return 'Charging' == 'Charging'
            //           ? availableWidget(no: no, name: name, status: status)
            //           : occupiedWidget(no: no, name: name, status: status);
            //     },
            //   ),
            // ),

              child:  SizedBox(
                    height: Get.height * 0.081,
                    width: Get.width * 0.880,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          chargingCtl.chargerPointData.connectors?.length ?? 0,
                      itemBuilder: (context, index) {
                        Connectors record =
                            chargingCtl.chargerPointData.connectors![index];
                        bool isSelected = record.id ==
                            pusherController.pusherData['connectorId'];
                        return record.connectorStatus?.status == 'Available'
                            ? availableWidget(

                                isSelected: isSelected,
                                no: index == 0 ? 'A' : 'B',
                                name: record.title ?? '',
                                status: record.connectorStatus?.status ?? '')
                            : availableWidget(
                                isSelected: isSelected,
                                no: index == 0 ? 'A' : 'B',
                                name: record.title ?? '',
                                status: record.connectorStatus?.status ?? '');
                      },
                    )),
          ),
          eCELargeSizedBox(),
          eCELargeSizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GestureDetector(
              //   onTap: () {
              //     reusableAlertDialog(logic,
              //         context: context,
              //         title: "Charging Details  ",
              //         stationName: "1234",
              //         content: SizedBox(
              //           height: 450,
              //           width: double.maxFinite,
              //           child: ListView(
              //             children: [
              //               Stack(
              //                 children: [
              //                   Card(
              //                       elevation: 3.0,
              //                       shape: RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(10.0)),
              //                       color: const Color.fromRGBO(
              //                           116, 134, 134, 100),
              //                       child: SizedBox(
              //                         height: 220,
              //                         width: double.maxFinite,
              //                         child: Column(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           // crossAxisAlignment: CrossAxisAlignment.start,
              //                           children: [
              //                             RichText(
              //                               text: TextSpan(
              //                                 text: chargingCtl
              //                                         .chargerPointData
              //                                         .chargingDetails
              //                                         ?.percent ??
              //                                     '',
              //                                 style: logic.isDarkTheme
              //                                     ? eDarkELTextStyleSTL
              //                                         .copyWith(
              //                                             fontSize:
              //                                                 eEELFontSize)
              //                                     : eDarkELTextStyleSTL
              //                                         .copyWith(
              //                                             fontSize:
              //                                                 eEELFontSize),
              //                                 children: [
              //                                   TextSpan(
              //                                       text: ' %',
              //                                       style: logic.isDarkTheme
              //                                           ? eDarkELTextStyleSTL
              //                                           : eDarkELTextStyleSTL),
              //                                 ],
              //                               ),
              //                             ),
              //                             AnimatedBuilder(
              //                               animation: _animAnimation!,
              //                               builder: (context, child) {
              //                                 return LinearPercentIndicator(
              //                                   width: MediaQuery.of(context)
              //                                           .size
              //                                           .width /
              //                                       1.6,
              //                                   lineHeight: 15.0,
              //                                   percent: _animAnimation!.value,
              //                                   backgroundColor:
              //                                       logic.isDarkTheme
              //                                           ? eWhiteCLR
              //                                           : eWhiteCLR,
              //                                   progressColor:
              //                                       Colors.lightGreenAccent,
              //                                 );
              //                               },
              //                             ),
              //                             Padding(
              //                               padding: const EdgeInsets.all(8.0),
              //                               child: RichText(
              //                                 text: TextSpan(
              //                                   text: "Energy Delivered: ",
              //                                   style: const TextStyle(
              //                                       color:
              //                                           Colors.lightGreenAccent,
              //                                       fontSize: 15),
              //                                   children: [
              //                                     TextSpan(
              //                                         text:
              //                                             '${chargingCtl.chargerPointData.chargingDetails?.kW ?? ''}',
              //                                         style: logic.isDarkTheme
              //                                             ? eDarkSmallTextStyleSTL
              //                                             : eDarkSmallTextStyleSTL),
              //                                     TextSpan(
              //                                         text: ' kWh',
              //                                         style: logic.isDarkTheme
              //                                             ? eDarkSmallTitleStyleSTL
              //                                             : eDarkSmallTitleStyleSTL),
              //                                   ],
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       )),
              //                   Positioned(
              //                     top: 10,
              //                     left: 10,
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: RichText(
              //                         text: TextSpan(
              //                           text: "Cost: ",
              //                           style: const TextStyle(
              //                               color: Colors.lightGreenAccent,
              //                               fontSize: 15),
              //                           children: [
              //                             TextSpan(
              //                                 text:
              //                                     '${chargingCtl.chargerPointData.chargingDetails?.totalCost ?? ''}',
              //                                 style: logic.isDarkTheme
              //                                     ? eDarkSmallTextStyleSTL
              //                                     : eDarkSmallTextStyleSTL),
              //                             TextSpan(
              //                                 text: ' \৳',
              //                                 style: logic.isDarkTheme
              //                                     ? eDarkSmallTextStyleSTL
              //                                     : eDarkSmallTextStyleSTL),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   )
              //                 ],
              //               ),
              //               reusableCard(logic,
              //                   title: "Power",
              //                   value: chargingCtl
              //                           .chargerPointData.chargingDetails?.kW ??
              //                       0,
              //                   extension: " kWh"),
              //               reusableCard(logic,
              //                   title: "Voltage",
              //                   value: chargingCtl
              //                           .chargerPointData.chargingDetails?.v ??
              //                       '',
              //                   extension: " V"),
              //               reusableCard(logic,
              //                   title: "Current",
              //                   value: chargingCtl
              //                           .chargerPointData.chargingDetails?.a ??
              //                       0,
              //                   extension: " A"),
              //             ],
              //           ),
              //         ),
              //         action: [
              //           Row(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               reusableActionButton(logic, name: "Back",
              //                   onPress: () {
              //                 Navigator.of(context).pop();
              //               }),
              //               reusableActionButton(logic, name: "Cancel",
              //                   onPress: () {
              //                 Navigator.of(context).pop();
              //               }),
              //             ],
              //           )
              //         ]);
              //     _animController!.forward();
              //   },
              //   child: Card(
              //     elevation: 3.0,
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0)),
              //     color: const Color.fromRGBO(116, 134, 134, 100),
              //     child: SizedBox(
              //       height: 30,
              //       width: 75,
              //       child: Center(
              //           child: Text(
              //         "Details",
              //         style: logic.isDarkTheme
              //             ? eDarkSmallTextStyleSTL
              //             : eLightSmallTextStyleSTL,
              //       )),
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () async {
                  // await chargingCtl.stopPostApi();
                },
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  color: const Color.fromARGB(255, 248, 65, 77),
                  child: SizedBox(
                    height: 30,
                    width: 75,
                    child: Center(
                        child: Text(
                      "Stop",
                      style: logic.isDarkTheme
                          ? eDarkSmallTextStyleSTL
                          : eLightSmallTextStyleSTL,
                    )),
                  ),
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              //   child: Text("Cancle"),
              // )
            ],
          ),
        ],
      ),
    );
  }*/
}

