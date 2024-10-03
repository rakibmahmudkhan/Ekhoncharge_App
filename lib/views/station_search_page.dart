import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/controller/station_search_controller.dart';
import 'package:ekhoncharge/models/ekhon_charge_station.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ekhoncharge/settings/colors.dart';

class StationSearchPage extends StatefulWidget {
  const StationSearchPage({super.key});

  @override
  State<StationSearchPage> createState() => _StationSearchPageState();
}

class _StationSearchPageState extends State<StationSearchPage> {
  StationSearchController stationSearchController =
      Get.put(StationSearchController());
  HomeController homeController = Get.put(HomeController());
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeController>().fetchEkhonChargeStations();
      //Get.find<HomeController>().resetChargerAndConnectorIndexWithOutBack();
    });
  }

  String _selectedLocation = 'All';
  String _selectedChargerType = '';
  List<String> _selectedConnectors = [];

  final List<String> _locations = ['All', 'Dhaka', 'Comilla'];
  final List<String> _chargerTypes = ['AC', 'DC'];
  final List<String> _connectors = [
    'CSS 1',
    'CSS 2',
    'Type 1',
    'Type 2',
    'CHAdeMO',
    'GB/T'
  ];
  bool _showMultiSearch = false;

  @override
  Widget build(BuildContext context) {
    Get.find<StationSearchController>().updateStationSearchPage();
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<HomeController>(
          builder: (homeController) {
            return Scaffold(
              backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
              resizeToAvoidBottomInset: false,
              appBar: eHomeAppBarWithoutBalance(logic, authController),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: eAppPadding(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        eCLargeSizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              !_showMultiSearch ? eStationNearby.tr : "",
                              style: logic.isDarkTheme
                                  ? eDarkMediumTextStyleSTL
                                  : eLightMediumTextStyleSTL,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _showMultiSearch =
                                        !_showMultiSearch; // Toggle visibility
                                  });
                                },
                                child: Icon(!_showMultiSearch
                                    ? Icons.search
                                    : Icons.close)),
                          ],
                        ),
                        !_showMultiSearch ? SizedBox() : eCMediumSizedBox(),
                        if (_showMultiSearch) ...[
                          //   eCLargeSizedBox(),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButtonFormField(
                              hint: Text('Select an option'),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eHintCLR,
                                      width:logic.isDarkTheme
                                          ? 3:1),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eHintCLR,
                                      width: logic.isDarkTheme
                                          ? 3:1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eHintCLR,
                                      width: logic.isDarkTheme
                                          ? 3:1),
                                ),
                                filled: false,
                                fillColor: eCardColor,
                                labelText: 'Location',
                                labelStyle: logic.isDarkTheme
                                    ? eDarkMediumTitleStyleSTL
                                    : eLightMediumTitleStyleSTL,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: logic.isDarkTheme ? eWhiteCLR : eHintCLR,
                              ),
                              elevation: 16,
                              dropdownColor:
                                  logic.isDarkTheme ? eCardColor : eWhiteCLR,
                              borderRadius: BorderRadius.circular(18.0),
                              value: _selectedLocation,
                              items: _locations.map((location) {
                                return DropdownMenuItem(
                                  value: location,
                                  child: Text(
                                    location,
                                    style: logic.isDarkTheme
                                        ? eDarkSmallTitleStyleSTL
                                        : eLightSmallTitleStyleSTL,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedLocation = value.toString();
                                });
                              },
                            ),
                          ),
                          eCELargeSizedBox(),
                          Text(
                            "Charger Type",
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          ),
                          eCMediumSizedBox(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _chargerTypes.map((chargerType) {
                              return ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedChargerType = chargerType;
                                  });
                                },
                                child: Text(
                                  chargerType,
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTitleStyleSTL
                                      : eLightSmallTitleStyleSTL,
                                ),
                                style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                      color: _selectedChargerType == chargerType
                                          ? eDPrimaryCLR2
                                          : logic.isDarkTheme
                                              ? eCardColor
                                              : eWhiteCLR,
                                      width: 2,
                                    ),
                                    backgroundColor:
                                        _selectedChargerType == chargerType
                                            ? logic.isDarkTheme
                                                ? eCardColor
                                                : eWhiteCLR
                                            : logic.isDarkTheme
                                                ? eCardColor
                                                : eWhiteCLR),
                              );
                            }).toList(),
                          ),
                          eCELargeSizedBox(),
                          Text(
                            "Connector Type",
                            style: logic.isDarkTheme
                                ? eDarkSmallTextStyleSTL
                                : eLightSmallTextStyleSTL,
                          ),
                          eCMediumSizedBox(),
                          Wrap(
                            spacing: 8.0,
                            children: _connectors.map((connector) {
                              return ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_selectedConnectors
                                        .contains(connector)) {
                                      _selectedConnectors.remove(connector);
                                    } else {
                                      _selectedConnectors.add(connector);
                                    }
                                  });
                                },
                                child: Text(connector , style: logic.isDarkTheme
                                  ? eDarkSmallTitleStyleSTL
                                  : eLightSmallTitleStyleSTL,),
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                    color: _selectedConnectors.contains(connector)
                                        ? eDPrimaryCLR2
                                        : logic.isDarkTheme
                                        ? eCardColor
                                        : eWhiteCLR,
                                    width: 2,
                                  ),
                                  backgroundColor:
                                      _selectedConnectors.contains(connector)
                                          ? logic.isDarkTheme
                                          ? eCardColor
                                          : eWhiteCLR
                                          : logic.isDarkTheme
                                          ? eCardColor
                                          : eWhiteCLR),

                              );
                            }).toList(),
                          ),
                          eCELargeSizedBox(),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedLocation = 'All';
                                _selectedChargerType = '';
                                _selectedConnectors.clear();
                              });
                            },
                            child: Text('Clear',style: logic.isDarkTheme?eDarkMediumTitleStyleSTL:eLightMediumTitleStyleSTL,),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: logic.isDarkTheme
                                  ? eCardColor
                                  : eWhiteCLR,
                                width: 2,),

                              backgroundColor:
                                logic.isDarkTheme
                                  ? eCardColor
                                  : eWhiteCLR
                             ),
                          ),
                          eCELargeSizedBox(),
                          Text(
                            'Selected Location: $_selectedLocation\n'
                            'Selected Charger Type: $_selectedChargerType\n'
                            'Selected Connectors: ${_selectedConnectors.join(", ")}',
                            style: logic.isDarkTheme?eDarkMediumTextStyleSTL:eLightMediumTextStyleSTL,
                          ),
                          eCLargeSizedBox(),

                        ],
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homeController.stationData.length,
                          itemBuilder: (context, index) {
                            EkhonChargeStationData record =
                                homeController.stationData[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: InkWell(
                                onTap: () {
                                  homeController.selectedStationIndex = index;
                                  homeController
                                      .resetChargerAndConnectorIndexWithOutBack();
                                  if (record.chargerpoints!.isNotEmpty) {
                                    Get.toNamed(RoutesName.stationDetailsPage);
                                  } else {
                                    Get.snackbar(
                                      eOops.tr,
                                      eNoConnectorAvailable.tr,
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor:
                                          Colors.red.withOpacity(0.8),
                                      colorText: Colors.white,
                                      duration: const Duration(seconds: 3),
                                      borderRadius: 10.0,
                                      margin: const EdgeInsets.all(10.0),
                                      padding: const EdgeInsets.all(15.0),
                                      isDismissible: true,
                                      forwardAnimationCurve: Curves.easeOutBack,
                                      reverseAnimationCurve: Curves.easeInBack,
                                    );
                                  }
                                },
                                child: Card(
                                  elevation: 4,
                                  shadowColor: logic.isDarkTheme
                                      ? eShaddowColor
                                      : eELigthShadowCLR,
                                  color: logic.isDarkTheme
                                      ? eCardColor
                                      : eWhiteCLR,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: logic.isDarkTheme
                                            ? eCardColor
                                            : eLightThemeBorderCLR,
                                        width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: SizedBox(
                                      height: Get.height * 0.120,
                                      width: Get.width * 1,
                                      child: ListView(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4,
                                                              top: 8,
                                                              right: 4.0),
                                                      // Border width
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        child:
                                                            SizedBox.fromSize(
                                                          size: const Size
                                                              .fromRadius(28),
                                                          // Image radius
                                                          child: Image.network(
                                                            '${APIConfig.imageURL}${record.imagePath}',
                                                            fit: BoxFit.cover,
                                                            errorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    ___) {
                                                              return Image
                                                                  .asset(
                                                                'assets/images/audi1.png',
                                                                fit: BoxFit
                                                                    .cover,
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
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 8,
                                                        top: 8,
                                                      ),
                                                      child: SizedBox(
                                                        height: 55,
                                                        //color: Colors.white,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              record.title ??
                                                                  '',
                                                              style: logic
                                                                      .isDarkTheme
                                                                  ? eDarkSmallTextStyleSTL
                                                                  : eLightSmallTextStyleSTL,
                                                            ),
                                                            // SizedBox(
                                                            //   height: 40,
                                                            // ),
                                                            Text(
                                                                '${eAvailableCharger.tr}  ${record.chargerpoints?.length ?? 0}',
                                                                style: logic
                                                                        .isDarkTheme
                                                                    ? eDarkExtraSmallTextStyleSTL
                                                                    : eLightExtraSmallTextStyleSTL),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                  ],
                                                ),
                                              ),
                                              eCMediumSizedBox(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3.0,
                                                    right: 3.0,
                                                    bottom: 4.0),
                                                child: SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              Icons
                                                                  .ev_station_outlined,
                                                              color: logic
                                                                      .isDarkTheme
                                                                  ? eEELSecondaryCLR
                                                                  : eBlackCLR),
                                                          Text(
                                                            "${ePowerCapacity.tr} ${record.powerCapacity ?? ''}",
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eLightMediumHintWthSTL.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color:
                                                                        eEELSecondaryCLR)
                                                                : eLightMediumHintWthSTL
                                                                    .copyWith(
                                                                        color:
                                                                            eBlackCLR),
                                                          ),
                                                        ],
                                                      ),
                                                      //   Spacer(),
                                                      // Container(),

                                                      Row(
                                                        //  mainAxisAlignment: MainAxisAlignment.end,
                                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            record.operatingStartHours !=
                                                                null &&
                                                                record
                                                                    .operatingStartHours!
                                                                    .isNotEmpty
                                                                ? '${record.operatingStartHours.toString().substring(0, 5)} - ${record.operatingEndHours.toString().substring(0, 5)}'
                                                                : '',
                                                            style: logic
                                                                    .isDarkTheme
                                                                ? eLightMediumHintWthSTL.copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color:
                                                                        eEELSecondaryCLR)
                                                                : eLightMediumHintWthSTL
                                                                    .copyWith(
                                                                        color:
                                                                            eBlackCLR),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }


}
