import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationSearchController extends GetxController {
  TextEditingController stationSearchTxtController = TextEditingController();

  void updateStationSearchPage() {
    stationSearchTxtController.clear();
  }
}
