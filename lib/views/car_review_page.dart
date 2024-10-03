import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/vehicle_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarReviewPage extends StatefulWidget {
  const CarReviewPage({super.key});

  @override
  State<CarReviewPage> createState() => _CarReviewPageState();
}

class _CarReviewPageState extends State<CarReviewPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<VehicleController>().fetchVehicleDetailsApi();

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VehicleController vehicleController= VehicleController();


    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<VehicleController>(builder: (vehicleCtl) {
          return Scaffold(
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
              title: Text(
                eViewingCar.tr,
                style: TextStyle(
                  color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: eAppPadding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                    padding: EdgeInsets.only(right: 40.0),
                    child: SizedBox(
                      // width:Get.width*0.42,
                      height: Get.height * 0.23,
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius
                            .circular(
                            12.0),
                        child: Image.network(
                          '${APIConfig.imageURL}${vehicleCtl.mVehicleDetailsModelData?.image ?? ""  }',
                          fit:
                          BoxFit.fitWidth,
                          errorBuilder:
                              (BuildContext
                          context,
                              Object
                              exception,
                              _) {
                            return Image
                                .asset(
                              fit: BoxFit
                                  .contain,
                              "assets/images/audi_4.png",
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
                 // eCEELargeSizedBox(),
                  eCMediumSizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildReviewItem('Make Car',
                                vehicleCtl.selectedMake.text ?? '', logic),
                            _buildReviewItem('Year Model',
                                vehicleCtl.selectedModel.text ?? '', logic),
                            _buildReviewItem(
                                'VIN', vehicleCtl.enteredVIN ?? '', logic),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildReviewItem('Model Car',
                                vehicleCtl.selectedModel.text ?? '', logic),

                            _buildReviewItem('Registration',
                                vehicleCtl.enteredRegistration, logic),
                            _buildReviewItem(' ',
                                vehicleCtl.selectedColor.text ?? '', logic),
                          ],
                        ),
                      ),
                    ],
                  ),
                  eCEELargeSizedBox(),
                  SizedBox(
                      width: double.maxFinite,
                      child: eButton(logic, title: "Confirm", onPressed: () {
                        vehicleCtl.postVehicleController();
                      })),
                  eCEELargeSizedBox(),
                ],
              ),
            )),
          );
        });
      },
    );
  }

  Widget _buildReviewItem(
      String title, String value, AppSystemController logic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: logic.isDarkTheme
              ? eDarkMediumTextStyleSTL
              : eLightMediumTextStyleSTL,
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: logic.isDarkTheme
              ? eDarkMediumTextStyleSTL
              : eLightMediumTextStyleSTL.copyWith(
                  color: eBlackCLR,
                  fontWeight: FontWeight.bold,
                ),
        ),
        Divider(),
      ],
    );
  }
}
