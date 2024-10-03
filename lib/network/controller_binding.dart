import 'package:get/get.dart';

import '../controller/connectivity-controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectivityController>(() => ConnectivityController());

  }
}