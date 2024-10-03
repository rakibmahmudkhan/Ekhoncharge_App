import 'dart:async';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/controller/pusher_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/models/charger_box.dart';
import 'package:ekhoncharge/models/charger_points.dart';
import 'package:ekhoncharge/repository/charge_box_repository.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargerBoxController extends GetxController {
  final _chargerRepository = ChargeBoxRepository();

  var logic = Get.find<AppSystemController>();
  var _page = 1;
  var _limit = 10;
  var _hasNextPage = true;
  var _isFirstLoadRunning = true;
  final _isLoadMoreRunning = false.obs;
  ScrollController scrollController = ScrollController();

  var _totalChargers = 0;
  final _chargerBoxes = <ChargerBoxData>[].obs;
  final _chargerPointData = ChargerPointData().obs;
  Timer? _timer;
  bool _waitingForResponse = false;
  var _qrCode = '';

  get qrCode => _qrCode;

  set qrCode(value) {
    _qrCode = value;
  }

  Timer? get timer => _timer;

  void setTimer() {
    int delaySeconds = 10;
    cancelTimer();
    _timer = Timer.periodic(Duration(seconds: delaySeconds), (t) async {
      if (!_waitingForResponse) {
        _waitingForResponse = true;
        await fetchChargerPointCtl(isAuto: true);
        _waitingForResponse = false;
      }
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  ChargerPointData get chargerPointData => _chargerPointData.value;

  set chargerPointData(value) {
    _chargerPointData.value = value;
  }

  List<ChargerBoxData> get chargerBoxes => _chargerBoxes;

  set addChargerList(value) {
    _chargerBoxes.addAll(value);
  }

  set chargerBoxes(value) {
    _chargerBoxes.value = value;
  }

  get totalChargers => _totalChargers;

  set totalChargers(value) {
    _totalChargers = value;
  }

  get limit => _limit;

  set limit(value) {
    _limit = value;
  }

  get hasNextPage => _hasNextPage;

  set hasNextPage(value) {
    _hasNextPage = value;
  }

  get isFirstLoadRunning => _isFirstLoadRunning;

  set isFirstLoadRunning(value) {
    _isFirstLoadRunning = value;
  }

  get isLoadMoreRunning => _isLoadMoreRunning.value;

  set isLoadMoreRunning(value) {
    _isLoadMoreRunning.value = value;
    update();
  }

  get page => _page;

  set page(value) {
    _page = value;
  }

  void setScrollController() {
    scrollController.addListener(loadMoreChargerBoxAPI);
  }

  void disposeScrollController() {
    scrollController.removeListener(loadMoreChargerBoxAPI);
  }

  Future<void> fetchChargerPointCtl({bool isAuto = false}) async {
    resetChargerPointPage();
    if (!isAuto) {
      await Future.delayed(const Duration(milliseconds: 1));
      eProgressLoader();
    }

    try {
      var response = await _chargerRepository.fetchChargerPoint(qrCode);
      if (response != null) {
        ChargerPoint chargerPoint = ChargerPoint.fromJson((response));
        if (chargerPoint.success == true && chargerPoint.data != null) {
          chargerPointData = chargerPoint.data!;
          chargerPointData.uuid = response['message'];
        } else {
          eCustomToast(message: response['message'] ?? '');
          Get.back();
          Get.find<HomeController>().selectedNavIndexWithoutUpdate = 2;
          Get.offAllNamed(RoutesName.home);
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      if (!isAuto) {
        Get.back();
      }
      update();
    }
  }

  Future<void> fetchChargerBoxAPI() async {
    resetChargerPageAPIs();
    await Future.delayed(const Duration(milliseconds: 1));
    eProgressLoader();

    try {
      var response = await _chargerRepository.fetchChargerBox(page, limit);
      if (response != null) {
        ChargerBox chargerBox = ChargerBox.fromJson((response));
        if (chargerBox.status == true && chargerBox.data != null) {
          totalChargers = chargerBox.data!.length;
          chargerBoxes = chargerBox.data!;
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  Future<void> loadMoreChargerBoxAPI() async {
    ScrollPosition position = scrollController.position;
    if (hasNextPage &&
        !isFirstLoadRunning &&
        !isLoadMoreRunning &&
        position.maxScrollExtent == position.pixels &&
        chargerBoxes.length < totalChargers) {
      isLoadMoreRunning = true;
      page++;
      try {
        var response = await _chargerRepository.fetchChargerBox(page, limit);
        if (response != null) {
          ChargerBox chargerBox = ChargerBox.fromJson((response));
          if (chargerBox.status == true && chargerBox.data != null) {
            if (chargerBox.data!.isNotEmpty) {
              addChargerList = chargerBox.data!;
            } else {
              hasNextPage = false;
            }
          }
        }
      } catch (error) {
        eLocalLogWriter(error.toString());
      } finally {
        isLoadMoreRunning = false;
        update();
      }
    }
  }

  final Rx<Color> _buttonColor =
      eDPrimaryCLR2.obs; // Initial color  for my start button
  Color get buttonColor => _buttonColor.value;

  set buttonColor(Color value) {
    _buttonColor.value = value;
    update();
  }

  void resetChargerPointPage() {
    _chargerPointData.value = ChargerPointData();
  }

  void resetChargerPageAPIs() {
    page = 1;
    limit = 10;
    hasNextPage = true;
    _isLoadMoreRunning.value = false;
    _chargerBoxes.value = [];
  }

  Connectors connectedConnector() {
    var pusherCtl = Get.find<PusherController>();

    for (Connectors connector in chargerPointData.connectors ?? []) {
      if (connector.id == pusherCtl.pusherData['connectorId']) {
        return connector;
      }
    }
    return Connectors();
  }
}
