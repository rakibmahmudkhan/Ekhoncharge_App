import 'package:ekhoncharge/controller/vehicle_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/models/customer_charging_history.dart';
import 'package:ekhoncharge/models/ekhon_charge_station.dart';
import 'package:ekhoncharge/repository/home_repository.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/views/over_view_page.dart';
import 'package:ekhoncharge/views/profile_nav_page.dart';
import 'package:ekhoncharge/views/station_search_page.dart';
import 'package:ekhoncharge/views/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/charging_history.dart';

class HomeController extends GetxController {
  final _dashboardRepository = HomeRepository();
  final _selectedNavIndex = 0.obs;
  final _stationData = <EkhonChargeStationData>[].obs;
  var _selectedStationIndex = 0;
  var _selectedConnectorIndex = 0;
  var _selectedChargerIndex = 0;
  // GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  get selectedStationIndex => _selectedStationIndex;

  set selectedStationIndex(value) {
    _selectedStationIndex = value;
    update();
  }

  // void tabChangeTo(int index) {
  //   if (bottomNavigationKey.currentState != null) {
  //     bottomNavigationKey.currentState!.setPage(index);
  //   }
  // }

  get selectedChargerIndex => _selectedChargerIndex;

  set selectedChargerIndex(value) {
    _selectedChargerIndex = value;
    update();
  }

  get selectedConnectorIndex => _selectedConnectorIndex;

  set selectedConnectorIndex(value) {
    _selectedConnectorIndex = value;
    update();
  }
  void resetChargerAndConnectorIndex(){
    selectedChargerIndex= 0;
    selectedConnectorIndex= 0;
    update();
    Get.back();
  }
  void resetChargerAndConnectorIndexWithOutBack(){
    selectedChargerIndex= 0;
    selectedConnectorIndex= 0;
    update();

  }



  final _chargingHistoryDataList = <ChargingHistoryData>[].obs;
  final _customerChargingHistoryDataList = <CustomerChargingHistoryData>[].obs;

  List<CustomerChargingHistoryData> get customerChargingHistoryDataList =>
      _customerChargingHistoryDataList;

  List<ChargingHistoryData> get chargingHistoryDataList =>
      _chargingHistoryDataList;

  set chargingHistoryDataList(value) {
    _chargingHistoryDataList.value = value;
  }

  List<EkhonChargeStationData> get stationData => _stationData;

  set stationData(value) {
    _stationData.value = value;
  }

  Future<void> fetchEkhonChargeStations() async {
    resetVehicleSetupPage();
    eProgressLoader();
    try {
      var response =
          await _dashboardRepository.fetchEkhonChargeStationAPIRepo();
      if (response != null) {
        EkhonChargeStation ekhonChargeStation =
            EkhonChargeStation.fromJson(response);
        if (ekhonChargeStation.success == true) {
          stationData = ekhonChargeStation.data;
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  // Future<List<Map<String, dynamic>>?> fetchEkhonChargeStationsWithOutModel() async {
  //   resetVehicleSetupPage();
  //   await Future.delayed(const Duration(milliseconds: 1));
  //   eProgressLoader();
  //   try {
  //     var response =
  //         await _dashboardRepository.fetchEkhonChargeStationAPIRepo();
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> jsonResponse = json.decode(response.body);
  //       final List<dynamic> stations = jsonResponse['data'] ?? [];
  //       final List<Map<String, dynamic>> stationDataList = [];
  //
  //       for (final station in stations) {
  //         final List<dynamic> chargerPoints = station['chargerpoints'] ?? [];
  //
  //         for (final chargerPoint in chargerPoints) {
  //           final List<dynamic> connectors = chargerPoint['connectors'] ?? [];
  //           final Map<String, dynamic> data = {};
  //
  //           // Extract payment_methods
  //           final List<Map<String, dynamic>> paymentMethodsList = [];
  //           for (final connector in connectors) {
  //             final Map<String, dynamic> paymentMethods = connector['payment_methods'] ?? {};
  //             paymentMethodsList.add(paymentMethods);
  //           }
  //           data['payment_methods'] = paymentMethodsList;
  //
  //           // Extract amenities
  //           final List<String> amenitiesList = chargerPoint['amenities']?.cast<String>() ?? [];
  //           data['amenities'] = amenitiesList;
  //
  //           // Extract data_address
  //           final Map<String, dynamic> dataAddress = chargerPoint['data_address'] ?? {};
  //           data['data_address'] = dataAddress;
  //
  //           stationDataList.add(data);
  //         }
  //       }
  //
  //       return stationDataList;
  //     }
  //   } catch (error) {
  //     eLocalLogWriter(error.toString());
  //   } finally {
  //     Get.back();
  //     update();
  //   }
  //   return null;
  // }

  Future<void> customerChargingHistory() async {
    _customerChargingHistoryDataList.value = [];
    try {
      var response =
          await _dashboardRepository.customerTransactionHistoryAPIRepo();
      if (response != null) {
        CustomerTransactionHistory customerTransactionHistory =
            CustomerTransactionHistory.fromJson((response));
        if (customerTransactionHistory.data != null &&
            customerTransactionHistory.data!.isNotEmpty) {
          _customerChargingHistoryDataList.value =
              customerTransactionHistory.data!;
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    }
  }

  Future<void> fetchChargingHistoryCtl() async {
    eProgressLoader();
    _chargingHistoryDataList.value = [];
    try {
      await Get.find<VehicleController>().fetchRegisteredCarListApi();
      var response =
          await _dashboardRepository.customerTransactionHistoryAPIRepo();
      if (response != null) {
        ChargingHistory transactionHistory =
            ChargingHistory.fromJson((response));
        if (transactionHistory.status == 200 &&
            transactionHistory.data!.isNotEmpty) {
          _chargingHistoryDataList.value = transactionHistory.data!;
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  void resetVehicleSetupPage() {
    _stationData.value = [];
  }

  get selectedNavIndex => _selectedNavIndex.value;

  set selectedNavIndex(value) {
    _selectedNavIndex.value = value;
    update();
  }

  set selectedNavIndexWithoutUpdate(value) {
    _selectedNavIndex.value = value;
  }

  List<Widget> getHomeBody() {
    return homeWidgets();
  }

  List<Widget> homeWidgets() {
    return [
      const OverViewPage(),
      const WalletPage(),
      const StationSearchPage(),
      const ProfileNavPage()
    ];
  }
}
