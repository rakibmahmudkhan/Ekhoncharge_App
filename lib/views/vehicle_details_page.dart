import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes_name.dart';

class VehicleDetailsPage extends StatelessWidget {
  final String brandName;
  final String carModel;
  final String carModelYear;
  final String carColor;
  final String vinNumber;
  final String registrationNo;

  VehicleDetailsPage(this.brandName, this.carModel, this.carModelYear,
      this.carColor, this.vinNumber, this.registrationNo,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          appBar: AppBar(
            title: Text(
              'Vehicle Details  ',
              style: TextStyle(
                color: logic.isDarkTheme ? eWhiteCLR : eHintCLR,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: logic.isDarkTheme ? eWhiteCLR : eHintCLR,
                )),
            titleTextStyle: eLightBtnTextStyleSTL,
            centerTitle: true,
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            elevation: 0.0,
            toolbarHeight: 40,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: ListView(
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: eCardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                        title: Text(
                      'Brand Name: $brandName',
                      style: logic.isDarkTheme
                          ? eDarkMediumTextStyleSTL
                          : eLightMediumTextStyleSTL,
                    ))),
                Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: eCardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                        title: Text(
                      ' Car Model: $carModel',
                      style: logic.isDarkTheme
                          ? eDarkMediumTextStyleSTL
                          : eLightMediumTextStyleSTL,
                    ))),
                Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: eCardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                        title: Text(
                      'Car Model Year: $carModelYear',
                      style: logic.isDarkTheme
                          ? eDarkMediumTextStyleSTL
                          : eLightMediumTextStyleSTL,
                    ))),
                Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: eCardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                        title: Text(
                      'Car Color: $carColor',
                      style: logic.isDarkTheme
                          ? eDarkMediumTextStyleSTL
                          : eLightMediumTextStyleSTL,
                    ))),
                Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: eCardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                        title: Text(
                      'VIN: $vinNumber',
                      style: logic.isDarkTheme
                          ? eDarkMediumTextStyleSTL
                          : eLightMediumTextStyleSTL,
                    ))),
                Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: eCardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                        title: Text(
                      'Registration Number: $registrationNo',
                      style: logic.isDarkTheme
                          ? eDarkMediumTextStyleSTL
                          : eLightMediumTextStyleSTL,
                    ))),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 00),
                  child: GestureDetector(
                    onTap: () async {
                      Get.toNamed(
                        RoutesName.successfulMessagePage,
                        arguments: {
                          'successMessage': 'Your Vehicle Setup Successful',
                          'setupMessage': 'Add Your Wallet',
                          'fromPage': 3,
                        },
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: eLSuccessCLR,
                          borderRadius: BorderRadius.circular(10)),
                      height: 45,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Next",
                          style: eLightAppNameStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class SuccessfulMessagePage extends StatefulWidget {
//   SuccessfulMessagePage();
//
//   @override
//   State<SuccessfulMessagePage> createState() => _SuccessfulMessagePageState();
// }
//
// class _SuccessfulMessagePageState extends State<SuccessfulMessagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: eDPrimaryCLR3,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
//           child: Container(
//             height: Get.height * 1,
//             width: Get.width * 1,
//             decoration: BoxDecoration(
//               color: eDPrimaryCLR3,
//             ),
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   eCEELargeSizedBox(),
//                   eCEELargeSizedBox(),
//                   SizedBox(
//                     height: Get.height * .25,
//                     width: Get.width * .39,
//                     child: Image(
//                       fit: BoxFit.contain,
//                       image:
//                           AssetImage("assets/images/work_progress_success.png"),
//                     ),
//                   ),
//                   eCEELargeSizedBox(),
//                   eCEELargeSizedBox(),
//                   eCEELargeSizedBox(),
//                   Center(
//                     child: Text(
//                       "Your Vehicle Setup Successful",
//                       style: eWhiteELTextStyleSTL,
//                     ),
//                   ),
//                   eCEELargeSizedBox(),
//                   Card(
//                     elevation: 3,
//                     color: eDPrimaryCLR3,
//                     child: Container(
//                       height: Get.height * .3,
//                       width: Get.width * .9,
//                       decoration: BoxDecoration(
//                         color: eDSecondPrimaryCLR,
//                         borderRadius: BorderRadius.circular(22.0),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Center(
//                                 child: Text(
//                               "Add Your Wallet ",
//                               style: eWhiteELTextStyleSTL,
//                             )),
//                             Spacer(),
//                             GestureDetector(
//                               onTap: () {
//                                 Get.find<HomeController>().selectedNavIndex = 1;
//                                 Get.toNamed(RoutesName.home);
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: eDPrimaryCLR2,
//                                   borderRadius: BorderRadius.circular(20.0),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 120, vertical: 10),
//                                   child: Text(
//                                     "Continue",
//                                     style: eWhiteELTextStyleSTL,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   "Skip Now",
//                                   style: eWhiteELTextStyleSTL,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
