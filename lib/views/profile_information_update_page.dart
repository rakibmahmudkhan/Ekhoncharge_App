import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/controller/user_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/views/profession_selection_button.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/asterisk_text.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/date_picker.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:ekhoncharge/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:get/get.dart';


class ProfileInformationUpdatePage extends StatefulWidget {
  const ProfileInformationUpdatePage({Key? key}) : super(key: key);

  @override
  State<ProfileInformationUpdatePage> createState() =>
      _ProfileInformationUpdatePageState();
}

class _ProfileInformationUpdatePageState
    extends State<ProfileInformationUpdatePage> {
  @override
  Widget build(BuildContext context) {
    Get.find<UserController>().updateProfileInformationPage();
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<UserController>(
          builder: (userController) {
            return GetBuilder<AuthController>(builder: (authCtl) {
              return Scaffold(
                backgroundColor:
                    logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
                appBar: eAppBar(
                  logic,
                  title: 'Profile Setup',
                ),
                body: Background(
                  isActive: logic.isDarkTheme,
                  opacity: false,
                  child: SafeArea(
                    child: eAppPadding(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            eCEELargeSizedBox(),
                            Center(
                              child: Stack(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      authCtl.userModel.user != null &&
                                              authCtl.userModel.user != null
                                          ? '${APIConfig.imageURL}${authCtl.userModel.user!.imagePath ?? ''}'
                                          : '',
                                      fit: BoxFit.cover,
                                      height: 180,
                                      width: 180,
                                      errorBuilder: (BuildContext context,
                                          Object exception, ___) {
                                        return Image.asset(
                                          'assets/images/profile.jpg',
                                          fit: BoxFit.cover,
                                          height: 180,
                                          width: 180,
                                        );
                                      },
                                      loadingBuilder: (BuildContext context,
                                          Widget childWidget,
                                          ImageChunkEvent? loadingProgress) {
                                        return loadingProgress == null
                                            ? childWidget
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: InkWell(
                                      onTap: () {
                                        userController
                                            .openBottomSheetForImageUpload(
                                                context, logic);
                                      },
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: eMPrimaryCLR,
                                            radius: 20,
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            eCMediumSizedBox(),
                            asteriskWidget(logic, labelText: 'First Name'),
                            eCSmallSizedBox(),
                            // eGeneralTextFiled(
                            //     txtController:userController.
                            //     firstNameTxtController,
                            //     hint: 'Enter first name',
                            //   prefix: Icons.person_3_outlined,
                            // ),
                            SizedBox(
                              height: Get.height * 0.063,
                              width: double.maxFinite,
                              child: Card(
                                color: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                elevation: 5,
                                shadowColor: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                child: eNewTextFiled(
                                    userController.firstNameTxtController,
                                    inputType: TextInputType.name,
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTextStyleSTL
                                        : eLightMediumTextStyleSTL,
                                    colorr: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eWhiteCLR,
                                    enableColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    focusColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    hint: 'Enter first name',
                                    hintStyle: logic.isDarkTheme
                                        ? eLightMediumHintWthSTL
                                        : eLightMediumHintSTL,
                                    prefixWidget: Icon(
                                      Icons.person_3_outlined,
                                      size: eSmallIcon,
                                      color: logic.isDarkTheme
                                          ? eWhiteCLR
                                          : eHintCLR,
                                    )),
                              ),
                            ),
                            eCMediumSizedBox(),
                            asteriskWidget(logic, labelText: 'Last Name'),
                            eCSmallSizedBox(),

                            SizedBox(
                              height: Get.height * 0.063,
                              width: double.maxFinite,
                              child: Card(
                                color: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                elevation: 5,
                                shadowColor: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                child: eNewTextFiled(
                                    userController.lastNameTxtController,
                                    inputType: TextInputType.name,
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTextStyleSTL
                                        : eLightMediumTextStyleSTL,
                                    colorr: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eWhiteCLR,
                                    enableColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    focusColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    hint: 'Enter last name',
                                    hintStyle: logic.isDarkTheme
                                        ? eLightMediumHintWthSTL
                                        : eLightMediumHintSTL,
                                    prefixWidget: Icon(
                                      Icons.person_3_outlined,
                                      size: eSmallIcon,
                                      color: logic.isDarkTheme
                                          ? eWhiteCLR
                                          : eHintCLR,
                                    )),
                              ),
                            ),
                            eCMediumSizedBox(),
                            asteriskWidget(logic, labelText: 'Profession'),

                            SizedBox(
                              height: Get.height * 0.063,
                              width: double.maxFinite,
                              child: ProfessionSelectionButton(),
                            ),

                            eCMediumSizedBox(),
                            asteriskWidget(logic, labelText: 'Address'),
                            eCSmallSizedBox(),

                            SizedBox(
                              height: Get.height * 0.063,
                              width: double.maxFinite,
                              child: Card(
                                color: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                elevation: 5,
                                shadowColor: logic.isDarkTheme
                                    ? eDSecondPrimaryCLR
                                    : eWhiteCLR,
                                child: eNewTextFiled(
                                    userController.addressTxtController,
                                    inputType: TextInputType.name,
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTextStyleSTL
                                        : eLightMediumTextStyleSTL,
                                    colorr: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eWhiteCLR,
                                    enableColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    focusColor: logic.isDarkTheme
                                        ? eDSecondPrimaryCLR
                                        : eDSecondaryCLR,
                                    hint: 'Enter address',
                                    hintStyle: logic.isDarkTheme
                                        ? eLightMediumHintWthSTL
                                        : eLightMediumHintSTL,
                                    prefixWidget: Icon(
                                      Icons.location_city_outlined,
                                      size: eSmallIcon,
                                      color: logic.isDarkTheme
                                          ? eWhiteCLR
                                          : eHintCLR,
                                    )),
                              ),
                            ),

                            eCMediumSizedBox(),
                            asteriskWidget(logic,
                                labelText: 'Date of Birth', isEnabled: true),
                            eCSmallSizedBox(),
                            eDatePicker(
                              userController.dateOfBirth == ''
                                  ? 'Select Birth Date'
                                  : userController.dateOfBirth,
                              txtStyle: userController.dateOfBirth == ''
                                  ? logic.isDarkTheme
                                      ? eLightMediumHintWthSTL
                                      : eLightMediumHintSTL
                                  : logic.isDarkTheme
                                      ? eDarkMediumTextStyleSTL
                                      : eLightMediumTextStyleSTL,
                              bColor: logic.isDarkTheme
                                  ? eDSecondPrimaryCLR
                                  : eDSecondaryCLR,
                              color: logic.isDarkTheme
                                  ? eDSecondPrimaryCLR
                                  : eWhiteCLR,
                              onPressed: () async {
                                userController.dateOfBirth =
                                    await datePicker(context);
                              },
                            ),
                            eCMediumSizedBox(),
                            asteriskWidget(logic, labelText: 'Gender'),
                            eCSmallSizedBox(),
                            SizedBox(
                              height: Get.height * 0.130,
                              width: double.maxFinite,
                              child: ListView(
                                shrinkWrap: false,
                                children: [
                                  Center(child: _genderWidget()),
                                ],
                              ),
                            ),
                            eCLargeSizedBox(),
                            eCLargeSizedBox(),

                            SizedBox(
                              width: double.maxFinite,
                              child: eButton(
                                logic,
                                title: 'Save & Continue',
                                onPressed: () async {
                                  userController.postProfileUpdateAPI();

                                  //get back 2 second letters for user profile update completed
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  Get.back();

                                  // Get.offAllNamed(
                                  //   RoutesName.home,
                                  //   // arguments: {
                                  //   //   'successMessage':
                                  //   //       '',
                                  //   //
                                  //   // },
                                  // );
                                },
                              ),
                            ),
                            eCELargeSizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }

  Widget _genderWidget() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: GenderPickerWithImage(
        showOtherGender: false,
        verticalAlignedText: true,
        onChanged: (Gender? _gender) {
          String mapGenderToString(Gender _gender) {
            switch (_gender) {
              case Gender.Male:
                return "male";
              case Gender.Female:
                return "female";
              default:
                return "unknown";
            }
          }

          String genderString = mapGenderToString(_gender!).toString();

          PreferenceUtils.setString(eSelectedGenderTitle, genderString);
          print(genderString);
        },
        selectedGender: Gender.Male,
        //By Default
        selectedGenderTextStyle:
            const TextStyle(color: eDPrimaryCLR2, fontWeight: FontWeight.bold),
        unSelectedGenderTextStyle:
            const TextStyle(color: eHintCLR, fontWeight: FontWeight.bold),
        equallyAligned: true,
        size: 64.0,
        // default size 40.0
        animationDuration: const Duration(seconds: 1),
        isCircular: true,
        // by default true
        opacityOfGradient: 0.5,
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
