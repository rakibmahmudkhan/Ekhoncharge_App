import 'dart:convert';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/charger_box_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/models/charger_points.dart';
import 'package:ekhoncharge/repository/pusher_repository.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:ekhoncharge/views/charging_page.dart';
import 'package:ekhoncharge/views/payment_details.dart';
import 'package:ekhoncharge/widgets/availableWidget.dart';
import 'package:ekhoncharge/widgets/occupiedWidget.dart';
import 'package:ekhoncharge/widgets/reusableActionButton.dart';
import 'package:ekhoncharge/widgets/reusableAleartDialog.dart';
import 'package:ekhoncharge/widgets/reusableCard.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:get/get.dart';
import 'dart:async';

class PusherController extends GetxController
     {
  static var pusherRepo = PusherRepository();
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  var logic = Get.find<AppSystemController>();
  final _isInitial = true.obs;
  final _isChargerPointWidget = false.obs;
  var _selectedChargerPortIndex = -1;
  final _paymentJson = {}.obs;

  get paymentJson => _paymentJson;

  set paymentJson(value) {
    _paymentJson.value = value;
  }


  final _walletPaymentJson= {}.obs;

  get walletPaymentJson => _walletPaymentJson;

  set walletPaymentJson(value) {
    _walletPaymentJson.value = value;
  }

  // AnimationController? animationController;

  // void setAnimationController(TickerProvider tickerProvider) {
  //   animationController = AnimationController(
  //     vsync: tickerProvider,
  //     duration: Duration(seconds: mInterval),
  //   )..addListener(() {
  //     update();
  //   });
  // }

  get selectedChargerPortIndex => _selectedChargerPortIndex;

  set selectedChargerPortIndex(value) {
    _selectedChargerPortIndex = value;
  }

  get isChargerPointWidget => _isChargerPointWidget.value;

  set isChargerPointWidget(value) {
    _isChargerPointWidget.value = value;
  }

  get isInitial => _isInitial.value;

  set isInitial(value) {
    _isInitial.value = value;
  }

  final _isStartButtonEnable = true.obs;

  get isStartButtonEnable => _isStartButtonEnable.value;

  set isStartButtonEnable(value) {
    _isStartButtonEnable.value = value;
  }

  final _pusherData = {}.obs;
  final Rx<Widget> _widget = const Center(
    child: CircularProgressIndicator(),
  ).obs;

  Widget get widget => _widget.value;

  set widget(Widget value) {
    _widget.value = value;
  }

  get pusherData => _pusherData;

  set pusherData(value) {
    _pusherData.value = value;
  }

  Future<void> onConnectToPusher(int connectorId) async {
    EasyLoading.show();
    try {
      await pusher.init(
        apiKey: pusherKey,
        cluster: pusherCluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        // onAuthorizer: onAuthorizer,
      );
      await pusher.subscribe(channelName: '$pusherChannelName-$connectorId');
      pusher.connect().then((value) {
        isInitial = false;
        isChargerPointWidget = true;
        update();
      });
    } on Exception {
      throw Exception();
    } finally {
      EasyLoading.dismiss();
    }
  }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    return await pusherAuthenticateCtl(socketId, channelName);
  }

  Future<Map<String, dynamic>> pusherAuthenticateCtl(
      String socketId, String channelName) async {
    dynamic responses;
    EasyLoading.show();
    try {
      responses =
          await pusherRepo.pusherAuthenticateRepo(socketId, channelName);
      if (responses != null) {
        EasyLoading.dismiss();
        return responses;
      } else {
        EasyLoading.showInfo('Internal error has been occurred');
      }
    } on Exception {
      throw Exception();
    } finally {
      EasyLoading.dismiss();
    }
    EasyLoading.dismiss();
    return responses;
  }

  Future<void> startPostApi() async {
    eProgressLoader();

    isStartButtonEnable = false;
    update();
    try {
      var startBtnResponse = await pusherRepo.postStartBtn(
        type: "RemoteStartTransaction",
        chargerId: pusherData['chargerId'],
        connectorId: pusherData['connectorId'],
      );
      if (startBtnResponse['success'] == true) {
        //success TODO
        eCustomToast(message: startBtnResponse['message']);
      } else {
        eCustomToast(message: startBtnResponse['message']);
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      isStartButtonEnable = true;
      update();
      Get.back();
    }
  }





  Future<void> fetchEnergyTxnSummery() async {
    eProgressLoader();
    try {
      var response = await pusherRepo.energyTnxSummeryRepo(
          pusherData['eventDetails']
              ['txn_id']); //pass transaction id from pusher
      PreferenceUtils.setInt(eEnergyTransactionId, pusherData['eventDetails']
      ['txn_id']?? 0);
      if (response != null) {
        if (response["success"] == true) {
          paymentJson = response["data"];
          print('record.toString()');
          print(response["data"].toString());
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }
  var _isPressed = false.obs;

  get isPressed => _isPressed;

  set isPressed(value) {
    _isPressed.value = value;
  }

  Future<void> fetchWalletPayment() async {
    eProgressLoader();
    try {
      var response = await pusherRepo.paymentWalletRepo(
          PreferenceUtils.getInt(eEnergyTransactionId)??0 ); /*pass transaction id from paymentJson*/


      if (response != null) {
        if (response["status"] == true) {
          walletPaymentJson = response["data"];
          eCustomToast(message: response['message']);
          print('record.toString()');
          print(response["data"].toString());
        }else{
          eCustomToast(message: response['message']);
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
     Get.toNamed(RoutesName.home);
     _isPressed.value = true;
      update();
    }
  }

  Future<void> stopPostApi() async {
    eProgressLoader();

    try {
      if (pusherData['eventDetails']['txn_id'] == null) {
        eCustomToast(message: 'Please wait for pusher event');
      } else {
        var stopBtnResponse = await pusherRepo.postStopBtn(
          type: "RemoteStopTransaction",
          chargerId: pusherData['chargerId'],
          transactionId: pusherData['eventDetails']['txn_id'],
        );
        if (stopBtnResponse['success'] == true) {
          eCustomToast(message: stopBtnResponse['message']);
        } else {
          eCustomToast(message: stopBtnResponse['message']);
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    print("Pusher Connection Changed: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    print("Pusher onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) async {
    try {
      pusherData = jsonDecode(event.data);
      ePrintWrapped(pusherData.toString());
      if (pusherData['eventName'] != null) {
        isInitial = false;
        isChargerPointWidget = false;
      }
    } on Exception {
      throw Exception();
    } finally {
      EasyLoading.dismiss();
      update();
    }
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    print("pusher onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    print("Pusher Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    print("Pusher onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    print("Pusher onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    print("Pusher onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    print("Pusher onMemberRemoved: $channelName user: $member");
  }

  Future<void> onDisConnectAndUnsubscribeFromPusher({int type = 0}) async {
    try {
      var charCtl = Get.find<ChargerBoxController>();
      await pusher.unsubscribe(
        channelName:
            '$pusherChannelName-${charCtl.chargerPointData.connectors!.first.id}',
      );

      await pusher.disconnect();
      print(pusher.connectionState);
    } on Exception {
      throw Exception();
    } finally {
      EasyLoading.dismiss();
      if (type == 1) {
        await fetchEnergyTxnSummery();
      }
    }
  }

  String connectedPort() {
    var crgCtl = Get.find<ChargerBoxController>();
    String port = '';
    for (Connectors connector in crgCtl.chargerPointData.connectors ?? []) {
      if (connector.id == pusherData['connectorId']) {
        port = connector.title ?? '';
        break;
      }
    }
    return port;
  }

  void statusConnectorChanged({String? status, int? chargerId}) {
    ChargerBoxController chargerBoxController =
        Get.find<ChargerBoxController>();
    for (Connectors connectors
        in chargerBoxController.chargerPointData.connectors ?? []) {
      if (connectors.id == chargerId) {
        connectors.connectorStatus?.status = status;
        break;
      }
    }
  }

  void statusChargingConnectorChanged({String? status, int? chargerId}) {
    ChargerBoxController chargerBoxController =
        Get.find<ChargerBoxController>();
    for (Connectors connectors
        in chargerBoxController.chargerPointData.connectors ?? []) {
      if (connectors.id == chargerId) {
        connectors.connectorStatus?.status = status ?? 'Charging';
        break;
      }
    }
  }

  var chargerBoxCtl = Get.find<ChargerBoxController>();
  late AnimationController _controller;

  // void onInit() {
  //   super.onInit();
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 7),
  //   );
  //
  //   _controller.forward();
  // }
  //
  // void onClose() {
  //   _controller.dispose();
  //   super.onClose();
  // }

  Widget customWidgetRender(ChargerBoxController crgCtl) {
    switch (crgCtl.chargerPointData.connectors![selectedChargerPortIndex]
            .connectorStatus?.status ??
        '') {
      case 'Available':
        return Center(
          child: SafeArea(
            child: SingleChildScrollView(
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
                              "${crgCtl.chargerPointData.chargerId}",
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
                              child: SizedBox(
                                width: Get.width * 0.6,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Connector: ${crgCtl.chargerPointData.connectors![selectedChargerPortIndex].title}",
                                        style: logic.isDarkTheme
                                            ? eDarkLTextStyleSTL
                                            : eLightLTextStyleSTL,
                                        textAlign: TextAlign.center,
                                      ),
                                      eCMediumSizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 220,
                              //left: 110,
                              child: Text(
                                "Please Connect Your Vehicle With Charger",
                                style: logic.isDarkTheme
                                    ? eDarkMediumTitleStyleSTL
                                    : eLightMediumTitleStyleSTL,
                                textAlign: TextAlign.center,
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
                      child: SizedBox(
                        height: Get.height * 0.081,
                        width: Get.width * 0.880,
                        child: ListView.builder(
                          itemCount:
                              crgCtl.chargerPointData.connectors?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Connectors connector =
                                crgCtl.chargerPointData.connectors![index];
                            return availableWidget(
                                onTap: () {
                                  if (selectedChargerPortIndex != index) {
                                    selectedChargerPortIndex = index;
                                    onConnectToPusher(connector.id!);
                                  }
                                },
                                isSelected: selectedChargerPortIndex == index,
                                no: index == 0 ? 'A' : 'B',
                                name: connector.title ?? '',
                                status:
                                    connector.connectorStatus?.status ?? '');
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        );

      case 'Faulted':
        return Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    eCMediumSizedBox(),
                    eCMediumSizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 4.0, top: 4.0, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text(
                              "${crgCtl.chargerPointData.chargerId}",
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
                              child: SizedBox(
                                width: Get.width * 0.6,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Connector: ${crgCtl.chargerPointData.connectors![selectedChargerPortIndex].title}",
                                        style: logic.isDarkTheme
                                            ? eDarkLTextStyleSTL
                                            : eLightLTextStyleSTL,
                                        textAlign: TextAlign.center,
                                      ),
                                      eCMediumSizedBox(),
                                      /* Text(
                                        "Connector Faulted. Try Again Later",
                                        style: logic.isDarkTheme
                                            ? eDarkMediumTitleStyleSTL
                                            : eLightMediumTitleStyleSTL,
                                        textAlign: TextAlign.center,
                                      ),*/
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 220,
                              //  left: 110,
                              child: Text(
                                "Connector Faulted. Try Again Later",
                                style: logic.isDarkTheme
                                    ? eDarkMediumTitleStyleSTL
                                    : eLightMediumTitleStyleSTL,
                                textAlign: TextAlign.center,
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
                      child: SizedBox(
                          height: Get.height * 0.081,
                          width: Get.width * 0.880,
                          child: ListView.builder(
                            itemCount:
                                crgCtl.chargerPointData.connectors?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              Connectors connector =
                                  crgCtl.chargerPointData.connectors![index];
                              return availableWidget(
                                  onTap: () {
                                    if (selectedChargerPortIndex != index) {
                                      selectedChargerPortIndex = index;
                                      onConnectToPusher(connector.id!);
                                    }
                                  },
                                  isSelected: selectedChargerPortIndex == index,
                                  no: index == 0 ? 'A' : 'B',
                                  name: connector.title ?? '',
                                  status:
                                      connector.connectorStatus?.status ?? '');
                            },
                          )),
                    ),

                    //  eCEELargeSizedBox(),
                    // Spacer(),
                  ]),
            ),
          ),
        );

      case 'Offline':
        return Center(
          child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0, top: 4.0, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(
                            "${crgCtl.chargerPointData.chargerId}",
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
                            child: SizedBox(
                              width: Get.width * 0.6,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Connector: ${crgCtl.chargerPointData.connectors![selectedChargerPortIndex].title}",
                                      style: logic.isDarkTheme
                                          ? eDarkLTextStyleSTL
                                          : eLightLTextStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),
                                    eCMediumSizedBox(),
                                    /* Text(
                                      "Connector Offline. Try Again Later",
                                      style: logic.isDarkTheme
                                          ? eDarkMediumTitleStyleSTL
                                          : eLightMediumTitleStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 220,
                            //  left: 110,
                            child: Text(
                              "Connector Offline. Try Again Later",
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                              textAlign: TextAlign.center,
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
                    child: SizedBox(
                      height: Get.height * 0.081,
                      width: Get.width * 0.880,
                      child: ListView.builder(
                        itemCount:
                            crgCtl.chargerPointData.connectors?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Connectors connector =
                              crgCtl.chargerPointData.connectors![index];
                          return availableWidget(
                              onTap: () {
                                if (selectedChargerPortIndex != index) {
                                  selectedChargerPortIndex = index;
                                  onConnectToPusher(connector.id!);
                                }
                              },
                              isSelected: selectedChargerPortIndex == index,
                              no: index == 0 ? 'A' : 'B',
                              name: connector.title ?? '',
                              status: connector.connectorStatus?.status ?? '');
                        },
                      ),
                    ),
                  ),

                  //  eCEELargeSizedBox(),
                  // Spacer(),
                ]),
          ),
        );

      case 'SuspendedEV':
        return Center(
          child: SafeArea(
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
                            "${crgCtl.chargerPointData.chargerId}",
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
                            child: SizedBox(
                              width: Get.width * 0.6,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Connector: ${crgCtl.chargerPointData.connectors![selectedChargerPortIndex].title}",
                                      style: logic.isDarkTheme
                                          ? eDarkLTextStyleSTL
                                          : eLightLTextStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),
                                    eCMediumSizedBox(),
                                    /*Text(
                                      "Connector Suspended EV.  ",
                                      style: logic.isDarkTheme
                                          ? eDarkMediumTitleStyleSTL
                                          : eLightMediumTitleStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 220,
                            //  left: 110,
                            child: Text(
                              "Connector Suspended EV.",
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                              textAlign: TextAlign.center,
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
                    child: SizedBox(
                      height: Get.height * 0.081,
                      width: Get.width * 0.880,
                      child: ListView.builder(
                        itemCount:
                            crgCtl.chargerPointData.connectors?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Connectors connector =
                              crgCtl.chargerPointData.connectors![index];
                          return availableWidget(
                              onTap: () {
                                if (selectedChargerPortIndex != index) {
                                  selectedChargerPortIndex = index;
                                  onConnectToPusher(connector.id!);
                                }
                              },
                              isSelected: selectedChargerPortIndex == index,
                              no: index == 0 ? 'A' : 'B',
                              name: connector.title ?? '',
                              status: connector.connectorStatus?.status ?? '');
                        },
                      ),
                    ),
                  ),

                  //  eCEELargeSizedBox(),
                  // Spacer(),
                ]),
          ),
        );

      case 'SuspendedEVSE':
        return Center(
          child: SafeArea(
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
                            "${crgCtl.chargerPointData.chargerId}",
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
                            child: SizedBox(
                              width: Get.width * 0.6,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Connector: ${crgCtl.chargerPointData.connectors![selectedChargerPortIndex].title}",
                                      style: logic.isDarkTheme
                                          ? eDarkLTextStyleSTL
                                          : eLightLTextStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),
                                    eCMediumSizedBox(),
                                    /*     Text(
                                      // crgCtl.chargerPointData.uuid ?? '',

                                      "Connector Suspended EVSE.  ",
                                      style: logic.isDarkTheme
                                          ? eDarkMediumTitleStyleSTL
                                          : eLightMediumTitleStyleSTL,
                                      textAlign: TextAlign.center,
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 220,
                            //left: 110,
                            child: Text(
                              "Connector Suspended EVSE.",
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                              textAlign: TextAlign.center,
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
                    child: SizedBox(
                      height: Get.height * 0.081,
                      width: Get.width * 0.880,
                      child: ListView.builder(
                        itemCount:
                            crgCtl.chargerPointData.connectors?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Connectors connector =
                              crgCtl.chargerPointData.connectors![index];
                          return availableWidget(
                              onTap: () {
                                if (selectedChargerPortIndex != index) {
                                  selectedChargerPortIndex = index;
                                  onConnectToPusher(connector.id!);
                                }
                              },
                              isSelected: selectedChargerPortIndex == index,
                              no: index == 0 ? 'A' : 'B',
                              name: connector.title ?? '',
                              status: connector.connectorStatus?.status ?? '');
                        },
                      ),
                    ),
                  ),

                  //  eCEELargeSizedBox(),
                  // Spacer(),
                ]),
          ),
        );

      case 'Preparing':
        return Center(
          child: SafeArea(
            child: SingleChildScrollView(
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
                              "${crgCtl.chargerPointData.chargerId}",
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
                              child: SizedBox(
                                width: Get.width * 0.6,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Connector: ${crgCtl.chargerPointData.connectors![selectedChargerPortIndex].title}",
                                        style: logic.isDarkTheme
                                            ? eDarkLTextStyleSTL
                                            : eLightLTextStyleSTL,
                                        textAlign: TextAlign.center,
                                      ),
                                      eCMediumSizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 220,
                              //  left: 110,
                              child: Text(
                                "Vehicle Connected",
                                style: logic.isDarkTheme
                                    ? eDarkMediumTitleStyleSTL
                                    : eLightMediumTitleStyleSTL,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 110,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.37,
                                      child: InkWell(
                                        onTap: () async {
                                          if (isStartButtonEnable) {
                                            await startPostApi();
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: eELPaMaButton,
                                            vertical: eLPaMa,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isStartButtonEnable
                                                ? Colors.green
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(eMPaMa),
                                          ),
                                          child: Text(
                                            "Start",
                                            style: eLightBtnTextStyleSTL,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
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
                      child: SizedBox(
                        height: Get.height * 0.081,
                        width: Get.width * 0.880,
                        child: ListView.builder(
                          itemCount:
                              crgCtl.chargerPointData.connectors?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Connectors connector =
                                crgCtl.chargerPointData.connectors![index];
                            return availableWidget(
                                onTap: () {
                                  if (selectedChargerPortIndex != index) {
                                    selectedChargerPortIndex = index;
                                    onConnectToPusher(connector.id!);
                                  }
                                },
                                isSelected: selectedChargerPortIndex == index,
                                no: index == 0 ? 'A' : 'B',
                                name: connector.title ?? '',
                                status:
                                    connector.connectorStatus?.status ?? '');
                          },
                        ),
                        /*ListView.builder(
                          itemCount:
                              crgCtl.chargerPointData.connectors?.length ??
                                  0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Connectors connector =
                                crgCtl.chargerPointData.connectors![index];

                            return availableWidget(
                                onTap: () {
                                  if (selectedChargerPortIndex != index) {
                                    crgCtl.mDynamicPusherConnection(
                                        connector.id!, index);
                                  }
                                },
                                isSelected: selectedChargerPortIndex == index,
                                no: index == 0 ? 'A' : 'B',
                                name: connector.title ?? '',
                                status:
                                    connector.connectorStatus?.status ?? '');
                          },
                        )*/
                      ),
                    ),
                  ]),
            ),
          ),
        );

      case 'Charging':
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
                      crgCtl.chargerPointData.chargerId ?? '',
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
                            text: crgCtl.chargerPointData.chargingDetails
                                    ?.percent ??
                                "0",
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
                      //   child: StatefulBuilder(builder: (context, setState) {
                      //     return AnimatedBuilder(
                      //       animation: _animAnimation,
                      //       builder: (context, child) {
                      //         return LinearPercentIndicator(
                      //           width: Get.width / 3.80,
                      //           lineHeight: 13.0,
                      //           percent: _animAnimation.value / 100,
                      //           backgroundColor: Colors.white,
                      //           progressColor: Colors.lightGreenAccent,
                      //         );
                      //       },
                      //     );
                      //   }),
                      // ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 26, right: 26),
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
                                    crgCtl.chargerPointData.chargingDetails
                                            ?.v ??
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
                                    crgCtl.chargerPointData.chargingDetails
                                            ?.a ??
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
                                    crgCtl.chargerPointData.chargingDetails
                                            ?.energytxnTitle ??
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
                                    "Cost:",
                                    style: logic.isDarkTheme
                                        ? eDarkSmallTextStyleSTL
                                        : eLightSmallTextStyleSTL,
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${crgCtl.chargerPointData.chargingDetails?.totalCost ?? ''}',
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
                          itemCount:
                              crgCtl.chargerPointData.connectors?.length ?? 0,
                          itemBuilder: (context, index) {
                            Connectors record =
                                crgCtl.chargerPointData.connectors![index];
                            bool isSelected =
                                record.id == pusherData['connectorId'];
                            return record.connectorStatus?.status == 'Available'
                                ? availableWidget(
                                    isSelected: isSelected,
                                    no: index == 0 ? 'A' : 'B',
                                    name: record.title ?? '',
                                    status:
                                        record.connectorStatus?.status ?? '')
                                : occupiedWidget(
                                    isSelected: isSelected,
                                    no: index == 0 ? 'A' : 'B',
                                    name: record.title ?? '',
                                    status:
                                        record.connectorStatus?.status ?? '');
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
                          reusableAlertDialog(
                            logic,
                            title: "Charging Details  ",
                            stationName:
                                crgCtl.chargerPointData.chargerId ?? '',
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
                                                  BorderRadius.circular(10.0)),
                                          color: const Color.fromRGBO(
                                              116, 134, 134, 100),
                                          child: SizedBox(
                                            height: 220,
                                            width: double.maxFinite,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 38.0),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: crgCtl
                                                              .chargerPointData
                                                              .chargingDetails
                                                              ?.percent ??
                                                          "0",
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
                                                        '${crgCtl.chargerPointData.chargingDetails?.totalCost ?? ''}',
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
                                      //   child: StatefulBuilder(
                                      //       builder: (context, setState) {
                                      //         return AnimatedBuilder(
                                      //           animation: _animAnimation,
                                      //           builder: (context, child) {
                                      //             return LinearPercentIndicator(
                                      //               width: Get.width / 3.80,
                                      //               lineHeight: 13.0,
                                      //               percent: _animAnimation.value ?? 0.0 / 100,
                                      //               backgroundColor: Colors.white,
                                      //               progressColor:
                                      //               Colors.lightGreenAccent,
                                      //             );
                                      //           },
                                      //         );
                                      //       }),
                                      // ),
                                      Positioned(
                                        left: 15,
                                        bottom: 30,
                                        child: RichText(
                                          text: TextSpan(
                                            text: "Energy \nDelivered: ",
                                            style: const TextStyle(
                                                color: Colors.lightGreenAccent,
                                                fontSize: 15),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      '${crgCtl.chargerPointData.chargingDetails?.kW ?? ''}',
                                                  style: logic.isDarkTheme
                                                      ? eDarkSmallTextStyleSTL
                                                      : eDarkSmallTextStyleSTL),
                                              TextSpan(
                                                  text: ' kWh',
                                                  style: logic.isDarkTheme
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
                                      value: crgCtl.chargerPointData
                                              .chargingDetails?.kW ??
                                          0,
                                      extension: " kWh"),
                                  reusableCard(logic,
                                      title: "Voltage",
                                      value: crgCtl.chargerPointData
                                              .chargingDetails?.v ??
                                          '',
                                      extension: " V"),
                                  reusableCard(logic,
                                      title: "Current",
                                      value: crgCtl.chargerPointData
                                              .chargingDetails?.a ??
                                          0,
                                      extension: " A"),
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
                          await stopPostApi();

                          // await fetchStopEnergyTnx(85);
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
                    ],
                  ),
                ],
              ),
            ),
            // const Spacer(),
          ],
        );

      default:
        return const CircularProgressIndicator();
    }
  }

  Widget setInitialChargerPointsWidget(
      ChargerBoxController chargerBoxCtl, AppSystemController logic) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            eCMediumSizedBox(),
            eCMediumSizedBox(),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 4.0, top: 4.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    chargerBoxCtl.chargerPointData.chargerId ?? '',
                    style: logic.isDarkTheme
                        ? eDarkSmallTextStyleSTL
                        : eLightSmallTextStyleSTL,
                  ),
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
                          image:
                              const AssetImage("assets/images/2d_charger.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 54,
                      child: SizedBox(
                        width: Get.width * 0.6,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'Please Select Connector..',
                                style: logic.isDarkTheme
                                    ? eDarkLTextStyleSTL
                                    : eLightLTextStyleSTL,
                                textAlign: TextAlign.center,
                              ),
                              /*  Text(
                                 chargerPointData.uuid ?? '',
                                style: logic.isDarkTheme
                                    ? eDarkLTextStyleSTL
                                    : eLightLTextStyleSTL,
                                textAlign: TextAlign.center,
                              ),*/
                              eCMediumSizedBox(),
                              /*Text(
                               chargerPointData.uuid ?? '',
                                style: logic.isDarkTheme
                                    ? eDarkMediumTitleStyleSTL
                                    : eLightMediumTitleStyleSTL,
                                textAlign: TextAlign.center,
                              ),*/
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
              child: SizedBox(
                height: Get.height * 0.081,
                width: Get.width * 0.880,
                child: ListView.builder(
                  itemCount:
                      chargerBoxCtl.chargerPointData.connectors?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Connectors connector =
                        chargerBoxCtl.chargerPointData.connectors![index];
                    return availableWidget(
                        onTap: () {
                          selectedChargerPortIndex = index;
                          onConnectToPusher(connector.id!);
                        },
                        isSelected: false,
                        no: index == 0 ? 'A' : 'B',
                        name: connector.title ?? '',
                        status: connector.connectorStatus?.status ?? '');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mOnPusherEvent(
      AppSystemController logic, ChargerBoxController chargerBoxCtl) {
    switch (pusherData['eventName']) {
      case 'StatusNotification':
        switch (pusherData['eventDetails']['status']) {
          case 'Available':
            statusConnectorChanged(
                status: pusherData['eventDetails']['status'],
                chargerId: pusherData['connectorId']);
            return Center(
              child: SafeArea(
                child: SingleChildScrollView(
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
                                  "${pusherData['chargerId']}",
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
                                  child: SizedBox(
                                    width: Get.width * 0.6,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Connector: ${pusherData['connectorId']}',
                                            style: logic.isDarkTheme
                                                ? eDarkLTextStyleSTL
                                                : eLightLTextStyleSTL,
                                            textAlign: TextAlign.center,
                                          ),
                                          eCMediumSizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 220,
                                  //left: 110,
                                  child: Text(
                                    "Please Connect Your Vehicle With Charger",
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTitleStyleSTL
                                        : eLightMediumTitleStyleSTL,
                                    textAlign: TextAlign.center,
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
                          child: SizedBox(
                            height: Get.height * 0.081,
                            width: Get.width * 0.880,
                            child: ListView.builder(
                              itemCount: chargerBoxCtl
                                      .chargerPointData.connectors?.length ??
                                  0,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                Connectors record = chargerBoxCtl
                                    .chargerPointData.connectors![index];
                                bool isSelected =
                                    record.id == pusherData['connectorId'];

                                return availableWidget(
                                    onTap: () {
                                      selectedChargerPortIndex = index;
                                      onConnectToPusher(
                                          pusherData['connectorId']);
                                    },
                                    isSelected: isSelected,
                                    no: index == 0 ? 'A' : 'B',
                                    name: record.title ?? '',
                                    status:
                                        record.connectorStatus?.status ?? '');
                              },
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            );
          case 'Faulted':
            statusConnectorChanged(
                status: pusherData['eventDetails']['status'],
                chargerId: pusherData['connectorId']);
            return Center(
              child: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 4.0, top: 4.0, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Text(
                                "${pusherData['chargerId']}",
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
                                child: SizedBox(
                                  width: Get.width * 0.6,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Connector: ${pusherData['connectorId']}',
                                          style: logic.isDarkTheme
                                              ? eDarkLTextStyleSTL
                                              : eLightLTextStyleSTL,
                                          textAlign: TextAlign.center,
                                        ),
                                        eCMediumSizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 220,
                                //left: 110,
                                child: Text(
                                  "Connector Faulted. Try Again Later",
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTitleStyleSTL
                                      : eLightMediumTitleStyleSTL,
                                  textAlign: TextAlign.center,
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
                        child: SizedBox(
                          height: Get.height * 0.081,
                          width: Get.width * 0.880,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: chargerBoxCtl
                                    .chargerPointData.connectors?.length ??
                                0,
                            itemBuilder: (context, index) {
                              Connectors record = chargerBoxCtl
                                  .chargerPointData.connectors![index];
                              bool isSelected =
                                  record.id == pusherData['connectorId'];
                              return record.connectorStatus?.status ==
                                      'Available'
                                  ? availableWidget(
                                      isSelected: isSelected,
                                      no: index == 0 ? 'A' : 'B',
                                      name: record.title ?? '',
                                      status:
                                          record.connectorStatus?.status ?? '')
                                  : occupiedWidget(
                                      isSelected: isSelected,
                                      no: index == 0 ? 'A' : 'B',
                                      name: record.title ?? '',
                                      status:
                                          record.connectorStatus?.status ?? '');
                            },
                          ),
                        ),
                      ),

                      //  eCEELargeSizedBox(),
                      // Spacer(),
                    ]),
              )),
            );

          case 'Offline':
            statusConnectorChanged(
                status: pusherData['eventDetails']['status'],
                chargerId: pusherData['connectorId']);
            return Center(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        eCMediumSizedBox(),
                        eCMediumSizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 4.0, top: 4.0, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Text(
                                  "${pusherData['chargerId']}",
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
                                  child: SizedBox(
                                    width: Get.width * 0.6,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Connector: ${pusherData['connectorId']}',
                                            style: logic.isDarkTheme
                                                ? eDarkLTextStyleSTL
                                                : eLightLTextStyleSTL,
                                            textAlign: TextAlign.center,
                                          ),
                                          eCMediumSizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 220,
                                  //left: 110,
                                  child: Text(
                                    "Connector Offline. Try Again Later",
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTitleStyleSTL
                                        : eLightMediumTitleStyleSTL,
                                    textAlign: TextAlign.center,
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
                          child: SizedBox(
                            height: Get.height * 0.081,
                            width: Get.width * 0.880,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: chargerBoxCtl
                                      .chargerPointData.connectors?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                Connectors record = chargerBoxCtl
                                    .chargerPointData.connectors![index];
                                bool isSelected =
                                    record.id == pusherData['connectorId'];
                                return record.connectorStatus?.status ==
                                        'Available'
                                    ? availableWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status:
                                            record.connectorStatus?.status ??
                                                '')
                                    : occupiedWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status:
                                            record.connectorStatus?.status ??
                                                '');
                              },
                            ),
                          ),
                        ),

                        //  eCEELargeSizedBox(),
                        // Spacer(),
                      ]),
                ),
              ),
            );

          case 'SuspendedEV':
            statusConnectorChanged(
                status: pusherData['eventDetails']['status'],
                chargerId: pusherData['connectorId']);
            return Center(
              child: SafeArea(
                child: SingleChildScrollView(
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
                                  "${pusherData['chargerId']}",
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
                                  child: SizedBox(
                                    width: Get.width * 0.6,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Connector: ${pusherData['connectorId']}',
                                            style: logic.isDarkTheme
                                                ? eDarkLTextStyleSTL
                                                : eLightLTextStyleSTL,
                                            textAlign: TextAlign.center,
                                          ),
                                          eCMediumSizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 220,
                                  //left: 110,
                                  child: Text(
                                    "Connector Suspended EV. ",
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTitleStyleSTL
                                        : eLightMediumTitleStyleSTL,
                                    textAlign: TextAlign.center,
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
                          child: SizedBox(
                            height: Get.height * 0.081,
                            width: Get.width * 0.880,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: chargerBoxCtl
                                      .chargerPointData.connectors?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                Connectors record = chargerBoxCtl
                                    .chargerPointData.connectors![index];
                                bool isSelected =
                                    record.id == pusherData['connectorId'];
                                return record.connectorStatus?.status ==
                                        'Available'
                                    ? availableWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status:
                                            record.connectorStatus?.status ??
                                                '')
                                    : occupiedWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status:
                                            record.connectorStatus?.status ??
                                                '');
                              },
                            ),
                          ),
                        ),

                        //  eCEELargeSizedBox(),
                        // Spacer(),
                      ]),
                ),
              ),
            );

          case 'SuspendedEVSE':
            statusConnectorChanged(
                status: pusherData['eventDetails']['status'],
                chargerId: pusherData['connectorId']);
            return Center(
              child: SafeArea(
                child: SingleChildScrollView(
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
                                  "${pusherData['chargerId']}",
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
                                  child: SizedBox(
                                    width: Get.width * 0.6,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Connector: ${pusherData['connectorId']}',
                                            style: logic.isDarkTheme
                                                ? eDarkLTextStyleSTL
                                                : eLightLTextStyleSTL,
                                            textAlign: TextAlign.center,
                                          ),
                                          eCMediumSizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 220,
                                  //  left: 110,
                                  child: Text(
                                    "Connector Suspended EVSE",
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTitleStyleSTL
                                        : eLightMediumTitleStyleSTL,
                                    textAlign: TextAlign.center,
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
                          child: SizedBox(
                            height: Get.height * 0.081,
                            width: Get.width * 0.880,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: chargerBoxCtl
                                      .chargerPointData.connectors?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                Connectors record = chargerBoxCtl
                                    .chargerPointData.connectors![index];
                                bool isSelected =
                                    record.id == pusherData['connectorId'];
                                return record.connectorStatus?.status ==
                                        'Available'
                                    ? availableWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status:
                                            record.connectorStatus?.status ??
                                                '')
                                    : occupiedWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status:
                                            record.connectorStatus?.status ??
                                                '');
                              },
                            ),
                          ),
                        ),

                        //  eCEELargeSizedBox(),
                        // Spacer(),
                      ]),
                ),
              ),
            );

          case 'Preparing':
            statusConnectorChanged(
                status: pusherData['eventDetails']['status'],
                chargerId: pusherData['connectorId']);
            return Center(
              child: SafeArea(
                  child: SingleChildScrollView(
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
                                "${pusherData['chargerId']}",
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
                                child: SizedBox(
                                  width: Get.width * 0.6,
                                  child: Center(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Connector: ${pusherData['connectorId']}',
                                          style: logic.isDarkTheme
                                              ? eDarkLTextStyleSTL
                                              : eLightLTextStyleSTL,
                                          textAlign: TextAlign.center,
                                        ),
                                        eCMediumSizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 120,
                                //  left: 110,
                                child: Text(
                                  "Vehicle Connected",
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTitleStyleSTL
                                      : eLightMediumTitleStyleSTL,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 110,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 40.0,
                                  ),
                                  child: SizedBox(
                                    width: Get.width * 0.37,
                                    child: InkWell(
                                      onTap: () async {
                                        if (isStartButtonEnable) {
                                          await startPostApi();
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: eELPaMaButton,
                                          vertical: eLPaMa,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isStartButtonEnable
                                              ? Colors.green
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(eMPaMa),
                                        ),
                                        child: Text(
                                          "Start",
                                          style: eLightBtnTextStyleSTL,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
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
                        child: SizedBox(
                          height: Get.height * 0.081,
                          width: Get.width * 0.880,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: chargerBoxCtl
                                    .chargerPointData.connectors?.length ??
                                0,
                            itemBuilder: (context, index) {
                              Connectors record = chargerBoxCtl
                                  .chargerPointData.connectors![index];
                              bool isSelected =
                                  record.id == pusherData['connectorId'];
                              return record.connectorStatus?.status ==
                                      'Available'
                                  ? availableWidget(
                                      isSelected: isSelected,
                                      no: index == 0 ? 'A' : 'B',
                                      name: record.title ?? '',
                                      status:
                                          record.connectorStatus?.status ?? '')
                                  : occupiedWidget(
                                      isSelected: isSelected,
                                      no: index == 0 ? 'A' : 'B',
                                      name: record.title ?? '',
                                      status:
                                          record.connectorStatus?.status ?? '');
                            },
                          ),
                        ),
                      ),
                    ]),
              )),
            );

          case 'Charging':
            statusChargingConnectorChanged(
                status: pusherData['eventDetails']['status'],
                chargerId: pusherData['connectorId']);
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
                          pusherData['chargerId'] ?? '',
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
                                text: pusherData['eventDetails']['SoC'] ?? '',
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
                          /*           Positioned(
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
                      ),*/
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
                                        pusherData['eventDetails']['Voltage'] ??
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
                                        pusherData['eventDetails']
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
                                        pusherData['eventDetails'][
                                                'EnergyActiveImportRegister'] ??
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
                                        pusherData['eventDetails'][
                                                'EnergyActiveImportRegister'] ??
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
                              itemCount: chargerBoxCtl
                                      .chargerPointData.connectors?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                Connectors record = chargerBoxCtl
                                    .chargerPointData.connectors![index];
                                statusChargingConnectorChanged(
                                    status: pusherData['eventDetails']
                                        ['status'],
                                    chargerId: pusherData['connectorId']);
                                bool isSelected =
                                    record.id == pusherData['connectorId'];
                                return record.connectorStatus?.status ==
                                        'Available'
                                    ? availableWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status:
                                            record.connectorStatus?.status ??
                                                '')
                                    : occupiedWidget(
                                        isSelected: isSelected,
                                        no: index == 0 ? 'A' : 'B',
                                        name: record.title ?? '',
                                        status:
                                            record.connectorStatus?.status ??
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
                                  stationName: pusherData['chargerId'] ?? '',
                                  content: SizedBox(
                                    height: 350,
                                    width: double.maxFinite,
                                    child: ListView(
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
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 38.0),
                                                        child: RichText(
                                                          text: TextSpan(
                                                            text: pusherData[
                                                                        'eventDetails']
                                                                    ['SoC'] ??
                                                                '',
                                                            style: logic
                                                                    .isDarkTheme
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

                                                      /*     Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: RichText(
                                                          text: TextSpan(
                                                            text:
                                                                "Energy Delivered: ",
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .lightGreenAccent,
                                                                fontSize: 15),
                                                            children: [
                                                              TextSpan(
                                                                  text:
                                                                  pusherData['eventDetails'][
                                                                  'EnergyActiveImportRegister'] ??
                                                                      '',
                                                                  style: logic
                                                                          .isDarkTheme
                                                                      ? eDarkSmallTextStyleSTL
                                                                      : eDarkSmallTextStyleSTL),
                                                              TextSpan(
                                                                  text: ' ',
                                                                  style: logic
                                                                          .isDarkTheme
                                                                      ? eDarkSmallTitleStyleSTL
                                                                      : eDarkSmallTitleStyleSTL),
                                                            ],
                                                          ),
                                                        ),
                                                      ),*/
                                                    ],
                                                  ),
                                                )),
                                            Positioned(
                                              top: 10,
                                              left: 10,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: "Cost: ",
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .lightGreenAccent,
                                                        fontSize: 15),
                                                    children: [
                                                      TextSpan(
                                                          text: pusherData[
                                                                      'eventDetails']
                                                                  [
                                                                  'EnergyActiveImportRegister'] ??
                                                              '',
                                                          style: logic
                                                                  .isDarkTheme
                                                              ? eDarkSmallTextStyleSTL
                                                              : eDarkSmallTextStyleSTL),
                                                      TextSpan(
                                                          text: ' \৳',
                                                          style: logic
                                                                  .isDarkTheme
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
                                            //   child: StatefulBuilder(
                                            //       builder: (context, setState) {
                                            //         return AnimatedBuilder(
                                            //           animation: _animAnimation,
                                            //           builder: (context, child) {
                                            //             return LinearPercentIndicator(
                                            //               width: Get.width / 3.80,
                                            //               lineHeight: 13.0,
                                            //               percent: _animAnimation.value / 100,
                                            //               backgroundColor: Colors.white,
                                            //               progressColor:
                                            //               Colors.lightGreenAccent,
                                            //             );
                                            //           },
                                            //         );
                                            //       }),
                                            // ),
                                            Positioned(
                                              left: 15,
                                              bottom: 30,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: "Energy \nDelivered: ",
                                                  style: const TextStyle(
                                                      color: Colors
                                                          .lightGreenAccent,
                                                      fontSize: 15),
                                                  children: [
                                                    TextSpan(
                                                        text: pusherData[
                                                                    'eventDetails']
                                                                [
                                                                'energy_delivered_kw'] ??
                                                            "",
                                                        style: logic.isDarkTheme
                                                            ? eDarkSmallTextStyleSTL
                                                            : eDarkSmallTextStyleSTL),
                                                    TextSpan(
                                                        text: '',
                                                        style: logic.isDarkTheme
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
                                            value: pusherData['eventDetails']
                                                    ['PowerActiveImport'] ??
                                                "",
                                            extension: " "),
                                        reusableCard(logic,
                                            title: "Voltage",
                                            value: pusherData['eventDetails']
                                                    ['Voltage'] ??
                                                '',
                                            extension: " "),
                                        reusableCard(logic,
                                            title: "Current",
                                            value: pusherData['eventDetails']
                                                    ['CurrentImport'] ??
                                                '',
                                            extension: " "),
                                      ],
                                    ),
                                  ),
                                  action: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        reusableActionButton(
                                          logic,
                                          name: "Back",
                                          onPress: () {
                                            Get.back();
                                          },
                                        ),
                                        /*     reusableActionButton(
                                          logic,
                                          name: "Cancel",
                                          onPress: () {
                                            Get.back();
                                          },
                                        ),*/
                                      ],
                                    )
                                  ]);
                              // _animController!.forward();
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
                              await stopPostApi();
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
                ),
                // const Spacer(),
              ],
            );

          default:
            return const CircularProgressIndicator();
        }

      case 'MeterValues':
        return Center(child: ChargingPage());
      case 'StartTransaction':
        return const Center(
          child: CircularProgressIndicator(),
        );

      case 'StopTransaction':
        return PaymentDetails();

      default:
        return const CircularProgressIndicator();
    }
  }
}
