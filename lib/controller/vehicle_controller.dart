import 'dart:convert';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/models/vehicle_details_model.dart';
import 'package:ekhoncharge/models/make_model_year.dart';
import 'package:ekhoncharge/models/old_user_model.dart';
import 'package:ekhoncharge/models/registered_car_model.dart';
import 'package:ekhoncharge/repository/vehicle_repository.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:ekhoncharge/views/car_review_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../models/registered_car_model.dart';

class VehicleController extends GetxController {
  final _vehicleRepository = VehicleRepository();
  final _regCarList = RegisteredCarModel().obs;

  get regCarList => _regCarList;

  set regCarList(value) {
    _regCarList.value = value;
  }

  final _makes = <MakeModelYearData>[].obs;
  final _selectedMake = MakeModelYearData().obs;
  final _models = <MakeModelYearData>[].obs;
  final _selectedModel = MakeModelYearData().obs;
  final _years = <MakeModelYearData>[].obs;
  final _selectedYear = MakeModelYearData().obs;
  final _colors = <MakeModelYearData>[].obs;
  final _selectedColor = MakeModelYearData().obs;
  String enteredVIN = '';
  String enteredRegistration = '';
  TextEditingController vinController = TextEditingController();
  TextEditingController regController = TextEditingController();

  MakeModelYearData get selectedMake => _selectedMake.value;

  set selectedMake(value) {
    _selectedMake.value = value;
    fetchVehicleModelListAPI(_selectedMake.value.id ?? 0);
  }

  MakeModelYearData get selectedModel => _selectedModel.value;

  set selectedModel(value) {
    _selectedModel.value = value;
    fetchVehicleYearListAPI(
        _selectedMake.value.id ?? 0, _selectedModel.value.id ?? 0);
  }

  MakeModelYearData get selectedYear => _selectedYear.value;

  set selectedYear(value) {
    _selectedYear.value = value;
    fetchVehicleColorListAPI();
  }

  MakeModelYearData get selectedColor => _selectedColor.value;

  set selectedColor(value) {
    _selectedColor.value = value;
    update();
  }

  List<MakeModelYearData> get colors => _colors;

  set colors(value) {
    _colors.value = value;
  }

  List<MakeModelYearData> get years => _years;

  set years(value) {
    _years.value = value;
  }

  List<MakeModelYearData> get makes => _makes;

  set makes(value) {
    _makes.value = value;
  }

  List<MakeModelYearData> get models => _models;

  set models(value) {
    _models.value = value;
  }

  Future<void> fetchVehicleMakeListAPI() async {
    resetVehicleSetupPage();
    await Future.delayed(const Duration(milliseconds: 1));
    eProgressLoader();
    try {
      var response = await _vehicleRepository.fetchVehicleMakeListAPIRepo();
      if (response != null) {
        MakeModelYear makeModelYear = MakeModelYear.fromJson(response);
        if (makeModelYear.success == true) {
          makes = makeModelYear.data ?? [];
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  Future<void> fetchVehicleModelListAPI(int makeId) async {
    //reset
    _models.value = [];
    _selectedModel.value = MakeModelYearData();
    _years.value = [];
    _selectedYear.value = MakeModelYearData();
    eProgressLoader();
    try {
      var response =
          await _vehicleRepository.fetchVehicleModelListAPIRepo(makeId);
      if (response != null) {
        MakeModelYear makeModelYear = MakeModelYear.fromJson(response);
        if (makeModelYear.success == true) {
          models = makeModelYear.data ?? [];
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  Future<void> fetchVehicleYearListAPI(int makeId, int modelId) async {
    _years.value = [];
    _selectedYear.value = MakeModelYearData();
    eProgressLoader();
    try {
      var response =
          await _vehicleRepository.fetchVehicleYearListAPIRepo(makeId, modelId);
      if (response != null) {
        MakeModelYear makeModelYear = MakeModelYear.fromJson(response);
        if (makeModelYear.success == true) {
          years = makeModelYear.data ?? [];
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  Future<void> fetchVehicleColorListAPI() async {
    _colors.value = [];
    _selectedColor.value = MakeModelYearData();
    eProgressLoader();
    try {
      var response = await _vehicleRepository.fetchVehicleColorListAPIRepo();
      if (response != null) {
        MakeModelYear makeModelYear = MakeModelYear.fromJson(response);
        if (makeModelYear.success == true) {
          // colors = makeModelYear.data ?? [];
          colors = [
            MakeModelYearData(id: 1, text: 'White'),
            MakeModelYearData(id: 2, text: 'Black'),
            MakeModelYearData(id: 2, text: 'Red'),
          ];
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
    _makes.value = [];
    _selectedMake.value = MakeModelYearData();
    _models.value = [];
    _selectedModel.value = MakeModelYearData();
    _years.value = [];
    _selectedYear.value = MakeModelYearData();
    enteredVIN = '';
    enteredRegistration = '';
    vinController.clear();
    regController.clear();
  }

  /* void showDetailsMakeBottomSheet(BuildContext context,
      {Color? bottomBackColor, TextStyle? bottomTextStyle}) {
    TextEditingController searchController = TextEditingController();
    List<MakeModelYearData> filteredMakes = _makes;

    showModalBottomSheet(
      backgroundColor: bottomBackColor ?? eDPrimaryCLR3,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  selectedMake.id == null
                      ? 'Choose Make Car'
                      : selectedMake.text ?? '',
                  style: bottomTextStyle ?? eLightMediumHintWthSTL,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: bottomTextStyle ?? eLightMediumHintWthSTL),
                  onChanged: (searchText) {
                    filteredMakes = _makes
                        .where((make) => make.text!
                        .toLowerCase()
                        .contains(searchText.toLowerCase()))
                        .toList();
                    update();
                    // items = items
                    //     .where((item) => item
                    //         .toLowerCase()
                    //         .contains(searchText.toLowerCase()))
                    //     .toList();
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredMakes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredMakes[index].text ?? '',
                      style: bottomTextStyle ?? eLightMediumHintWthSTL,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      selectedMake = filteredMakes[index];
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }*/
  void showDetailsMakeBottomSheet(BuildContext context,
      {Color? bottomBackColor, TextStyle? bottomTextStyle}) {
    TextEditingController searchController = TextEditingController();
    List<MakeModelYearData> filteredMakes = _makes;
    final double screenHeight = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the bottom sheet full height
      backgroundColor: Colors.transparent, // Transparent background
      builder: (BuildContext context) {
        return SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: Get.height * 0.6, // Adjust the height as needed
            decoration: BoxDecoration(
              color: bottomBackColor ?? eDPrimaryCLR3,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: bottomTextStyle ?? eLightMediumHintWthSTL,
                      ),
                      onChanged: (searchText) {
                        filteredMakes = _makes
                            .where((make) => make.text!
                                .toLowerCase()
                                .contains(searchText.toLowerCase()))
                            .toList();
                        update();
                      },
                    ),
                  ),
                  const Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredMakes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filteredMakes[index].text ?? '',
                          style: bottomTextStyle ?? eLightMediumHintWthSTL,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          selectedMake = filteredMakes[index];
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showDetailsModelBottomSheet(BuildContext context,
      {Color? bottomBackColor, TextStyle? bottomTextStyle}) {
    TextEditingController searchController = TextEditingController();

    showModalBottomSheet(
      backgroundColor: bottomBackColor ?? eDPrimaryCLR3,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: bottomBackColor ?? eDPrimaryCLR3,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    selectedModel.id == null
                        ? 'Choose Model Car'
                        : selectedModel.text ?? '',
                    style: bottomTextStyle ?? eLightMediumHintWthSTL,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: bottomTextStyle ?? eLightMediumHintWthSTL),
                    onChanged: (searchText) {
                      // items = items
                      //     .where((item) => item
                      //         .toLowerCase()
                      //         .contains(searchText.toLowerCase()))
                      //     .toList();
                    },
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: models.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        models[index].text ?? '',
                        style: bottomTextStyle ?? eLightMediumHintWthSTL,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        selectedModel = models[index];
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showDetailsYearBottomSheet(BuildContext context,
      {Color? bottomBackColor, TextStyle? bottomTextStyle}) {
    TextEditingController searchController = TextEditingController();

    showModalBottomSheet(
      backgroundColor: bottomBackColor ?? eDPrimaryCLR3,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: Get.height * 0.8, // Adjust the height as needed
            decoration: BoxDecoration(
              color: bottomBackColor ?? eDPrimaryCLR3,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    selectedYear.id == null
                        ? 'Choose Year Car'
                        : selectedYear.text ?? '',
                    style: bottomTextStyle ?? eLightMediumHintWthSTL,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: bottomTextStyle ?? eLightMediumHintWthSTL),
                    onChanged: (searchText) {
                      // items = items
                      //     .where((item) => item
                      //         .toLowerCase()
                      //         .contains(searchText.toLowerCase()))
                      //     .toList();
                    },
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: years.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        years[index].text ?? '',
                        style: bottomTextStyle ?? eLightMediumHintWthSTL,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        selectedYear = years[index];
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /* void showDetailsColorBottomSheet(BuildContext context,
      {Color? bottomBackColor, TextStyle? bottomTextStyle}) {
    TextEditingController searchController = TextEditingController();

    showModalBottomSheet(
      backgroundColor: bottomBackColor ?? eDPrimaryCLR3,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  selectedYear.id == null
                      ? 'Choose Color Car'
                      : selectedYear.text ?? '',
                  style: bottomTextStyle ?? eLightMediumHintWthSTL,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: bottomTextStyle ?? eLightMediumHintWthSTL),
                  onChanged: (searchText) {
                    // items = items
                    //     .where((item) => item
                    //         .toLowerCase()
                    //         .contains(searchText.toLowerCase()))
                    //     .toList();
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      colors[index].text ?? '',
                      style: bottomTextStyle ?? eLightMediumHintWthSTL,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      selectedColor = colors[index];
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }*/

  void validateVehicleForm(BuildContext context) {
    if (selectedMake.id != null &&
            selectedModel.id != null &&
            selectedYear.id != null &&
        enteredVIN.isNotEmpty &&
        enteredRegistration.isNotEmpty) {
      Get.to(() => const CarReviewPage());
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:   Text(eIncompleteDataTxt.tr),
            content:
                  Text(ePleaseFillInAllSectionsTxt.tr),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:   Text(eOk.tr),
              ),
            ],
          );
        },
      );
    }
  }
  Future<void> postVehicleController() async {
    try {
      eProgressLoader();
      var loginResponse = await _vehicleRepository.postVehicle(
        email: PreferenceUtils.getString(eEmail) ?? '',
        makeId: selectedMake.id,
        modelId: selectedModel.id,
        yearId: selectedYear.id,
        vin: enteredVIN,
        registrationNo: enteredRegistration,
        // color: selectedColor.text ?? '',
      );
      if ((loginResponse['success'] == true)) {
        Get.back();
        eCustomToast(message: loginResponse['message']);
        var authCtl = Get.find<AuthController>();

        PreferenceUtils.setBool(eIsVehicleUpdated, true);

        UserModel vehicles = UserModel.fromJson2(loginResponse);
        //SET VEHICLE VALUES IN SHARE-PREFERENCE
        PreferenceUtils.setString(eVehiclesJson, jsonEncode(vehicles));
        authCtl.userModel.vehicles = vehicles.vehicles;
        if (authCtl.userModel.isWalletUpdate == false) {
          Get.offAllNamed(RoutesName.walletCreatePage);
        } else {
          Get.find<HomeController>().selectedNavIndex = 0;
          Get.offAllNamed(RoutesName.home);
        }
      } else {
        Get.back();
        Get.snackbar('Validation Error', loginResponse['message'] ?? '',
            backgroundColor: Colors.redAccent, colorText: eWhiteCLR);
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

  final _registeredCarRepository = VehicleRepository();
  final regCarData = <VehiclesData>[].obs;

  List<VehiclesData>? _fetchRegCar = [];
  List<VehicleDetailsModel>? _fetchVehDetails = [];

  List<VehicleDetailsModel>? get fetchVehDetails => _fetchVehDetails;

  set fetchVehDetails(List<VehicleDetailsModel>? value) {
    _fetchVehDetails  = value;
    update();
  }

  List<VehiclesData>? get fetchRegCar => _fetchRegCar;

  set fetchRegCar(List<VehiclesData>? value) {
    _fetchRegCar = value;
    update();
  }

  Future<void> fetchRegisteredCarListApi() async {
    eProgressLoader();
    int cusId = PreferenceUtils.getInt(eCustomerId) ?? 0;

    try {
      var response = await _registeredCarRepository.fetchRegCarListAPIRepo(
          customerId: cusId);
      if (response != null) {
        RegisteredCarModel registeredCarModel =
            RegisteredCarModel.fromJson(response);
        if (registeredCarModel.status == true) {
          _fetchRegCar = registeredCarModel.vehicles;
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  VehicleDetailsModelData? _mVehicleDetailsModelData;

  VehicleDetailsModelData? get mVehicleDetailsModelData => _mVehicleDetailsModelData;

  set mVehicleDetailsModelData(VehicleDetailsModelData? value) {
    _mVehicleDetailsModelData= value;
    update();
  }

  Future<void> fetchVehicleDetailsApi() async {
    eProgressLoader();
    String make=selectedMake.id.toString();
    String model=selectedModel.id.toString();
    String year=selectedYear.id.toString();


    try {
      var response = await _registeredCarRepository.fetchVehicleDetailsAPIRepo(
          make: make, model: model, year:year);
      if (response != null) {
        VehicleDetailsModel vehicleDetailsModel =
        VehicleDetailsModel.fromJson(response);
        if (vehicleDetailsModel.success == true) {
          //fetchVehDetails?.addAll(vehicleDetailsModel as Iterable<VehicleDetailsModel>);
         // fetchVehDetails=vehicleDetailsModel as List<VehicleDetailsModel>?;
         // mVehicleDetailsModelData= vehicleDetailsModel.data;
          mVehicleDetailsModelData=vehicleDetailsModel.data;

        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  Future<void> deleteRegCarController(String uuid) async {
    try {
      eProgressLoader();
      var deleteResponse = await _vehicleRepository.deleteRegCar(uuid: uuid);
      if ((deleteResponse['status'] == true)) {
        update();

        eCustomToast(message: deleteResponse['message']);
        await fetchRegisteredCarListApi();
        Get.back();
      } else {
        Get.back();
        Get.snackbar('Validation Error', deleteResponse['message'] ?? '',
            backgroundColor: Colors.redAccent, colorText: eWhiteCLR);
      }
    } catch (error) {
      Get.back();
      eLocalLogWriter(error.toString());
    }
  }

// var _prevIndex = -1;
// var _prevModelIndex = -1;
// final _isButtonVisible = false.obs;
// final _isModelSelected = false.obs;
// var _selectedMakeIndex = -1;
// var _selectedModelIndex = -1;
// final _makeList = <Make>[].obs;
// final _yearList = [].obs;
// var _selectedYearIndex = -1;
// var _prevYearIndex = -1;
// final _isYearSelected = false.obs;
//
// get selectedYearIndex => _selectedYearIndex;
//
// set selectedYearIndex(value) {
//   _selectedYearIndex = value;
// }
//
// get yearList => _yearList;
//
// set yearList(value) {
//   _yearList.value = value;
// }
//
// void onSelectedYear(int index) {
//   selectedYearIndex = index;
//   isButtonVisible = true;
//   if (prevIndex > -1) {
//     yearList[prevIndex]['isSelected'] = false;
//   }
//   yearList[index]['isSelected'] = true;
//   prevIndex = index;
//   update();
// }
//
// get selectedModelIndex => _selectedModelIndex;
//
// set selectedModelIndex(value) {
//   _selectedModelIndex = value;
// }
//
// get prevModelIndex => _prevModelIndex;
//
// set prevModelIndex(value) {
//   _prevModelIndex = value;
// }
//
// get isModelSelected => _isModelSelected.value;
//
// set isModelSelected(value) {
//   _isModelSelected.value = value;
// }
//
// get selectedMakeIndex => _selectedMakeIndex;
//
// set selectedMakeIndex(value) {
//   _selectedMakeIndex = value;
// }
//
// get isButtonVisible => _isButtonVisible.value;
//
// set isButtonVisible(value) {
//   _isButtonVisible.value = value;
// }
//
// get prevIndex => _prevIndex;
//
// set prevIndex(value) {
//   _prevIndex = value;
// }
//
// List<Make> get makeList => _makeList;
//
// set makeList(value) {
//   _makeList.value = value;
// }
//
// void fetchMakeListAPI() {
//   makeList = _vehicleRepository.fetchMakeListAPI();
//   update();
// }
//
// void fetchYearListAPI() {
//   yearList = _vehicleRepository.fetchYearList();
//   // update();
// }
//
// void onSelectedMake(int index) {
//   selectedMakeIndex = index;
//   isButtonVisible = true;
//   if (prevIndex > -1) {
//     makeList[prevIndex].isSelected = false;
//   }
//   makeList[index].isSelected = true;
//   prevIndex = index;
//   update();
// }
//
// void onSelectedModel(int index) {
//   selectedModelIndex = index;
//   isModelSelected = true;
//   if (prevModelIndex > -1) {
//     makeList[selectedMakeIndex].modelList![prevModelIndex].isSelected = false;
//   }
//   makeList[selectedMakeIndex].modelList![index].isSelected = true;
//   prevModelIndex = index;
//   update();
// }
//
// void resetMakePage() {
//   prevIndex = -1;
//   isButtonVisible = false;
// }
//
// void resetYearPage() {
//   prevYearIndex = -1;
//   isYearSelected = false;
// }
//
// void resetModelPage() {
//   prevModelIndex = -1;
//   isModelSelected = false;
// }
//
// List<Model> get models => makeList[selectedMakeIndex].modelList!;
//
// String get selectedMake => makeList[selectedMakeIndex].title!;
//
// String get selectedModel =>
//     makeList[selectedMakeIndex].modelList![selectedModelIndex].title!;
//
// get prevYearIndex => _prevYearIndex;
//
// set prevYearIndex(value) {
//   _prevYearIndex = value;
// }
//
// get isYearSelected => _isYearSelected.value;
//
// set isYearSelected(value) {
//   _isYearSelected.value = value;
// }
}
