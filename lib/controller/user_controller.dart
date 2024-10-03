 import 'dart:io';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/models/professional_model.dart';
import 'package:ekhoncharge/repository/user_repository.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:ekhoncharge/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final userRepository = UserRepository();
  TextEditingController addressTxtController = TextEditingController();
  TextEditingController lastNameTxtController = TextEditingController();
  TextEditingController firstNameTxtController = TextEditingController();

  RxList<ProfessionData> professionList = <ProfessionData>[].obs;
  RxBool isSelectedProfession = false.obs;
  RxString searchInput = ''.obs;

  // Fetch and store all professions
  void fetchAllProfessionData() async {
    try {
      var response = await userRepository.fetchProfessionDataListAPIRepo();
      if (response != null) {
        // Convert the response to a Profession object
        Profession profession = Profession.fromJson(response);

        if (profession.data != null) {
          // Update the RxList with the fetched professions
          professionList.assignAll(profession.data!);
        }
      }
    } catch (error) {
      // Handle error
      print(error.toString());
    }
  }

  void handleProfessionSelection(String title, int id, String uuid) async {
    // Save selected profession data to shared preferences
    PreferenceUtils.setBool('isSelectedProfession', true);
    PreferenceUtils.setString(eSelectedProfessionTitle, title);
    PreferenceUtils.setInt(eProfessionId, id);
    PreferenceUtils.setString(eProfessionUuid, uuid);
    update();

    //buttonNameUpdate();
    isSelectedProfession.value = true;
    update();
  }

  void buttonNameUpdate() {
    PreferenceUtils.getString(eProfessionTitle);
    update();
  }

  // Search for a profession based on the provided search input
  void searchForProfession(String searchInput) {
    List<ProfessionData> filteredList = professionList
        .where((profession) =>
            profession.title
                ?.toLowerCase()
                .contains(searchInput.toLowerCase()) ??
            false)
        .toList();

     professionList.assignAll(filteredList);


    update();
  }

  final ImagePicker picker = ImagePicker();
  final _imageFile = File('').obs;
  final _dateOfBirth = ''.obs;

  get dateOfBirth => _dateOfBirth.value;

  set dateOfBirth(value) {
    _dateOfBirth.value = value;
    update();
    PreferenceUtils.setString(eDateofBirth, "${_dateOfBirth.value}");

    print("dateofBirth ${_dateOfBirth.value}");
  }

  File get imageFile => _imageFile.value;

  set imageFile(value) {
    _imageFile.value = value;
  }

  void updateProfileInformationPage() {
    //addressTxtController.clear();
   // lastNameTxtController.clear();
    //firstNameTxtController.clear();
  }

  void openBottomSheetForImageUpload(
      BuildContext context, AppSystemController logic) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.camera_alt_outlined,
                size: 20,
              ),
              title: Text(
                'Take a photo',
                style: logic.isDarkTheme
                    ? eDarkMediumTextStyleSTL
                    : eLightMediumTextStyleSTL,
              ),
              onTap: () {
                Navigator.of(context).pop();
                pickCustomImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_library,
                size: 20,
              ),
              title: Text(
                'From Gallery',
                style: logic.isDarkTheme
                    ? eDarkMediumTextStyleSTL
                    : eLightMediumTextStyleSTL,
              ),
              onTap: () {
                Navigator.of(context).pop();
                pickCustomImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  void pickCustomImage(ImageSource imageSource) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        CroppedFile? croppedFile = await cropPhoto(pickedFile);
        if (croppedFile != null) {
          String fileName = '';
          String filePath = '';
          File image = File(croppedFile.path);
          if (image.path.contains('/')) {
            fileName = croppedFile.path.split("/").last;
          }
          if ((image.lengthSync() / 1024) >= 500) {
            var compressedImage = await eCompressPhoto(image: image);
            filePath = compressedImage.path;
          } else {
            filePath = image.path;
          }

          await postProfileAPhotoAPI(fileName, filePath);
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      EasyLoading.dismiss();
      update();
    }
  }

  Future<CroppedFile?> cropPhoto(XFile pickedFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Ekhon Charge',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
          title: 'Ekhon Charge',
        ),
      ],
    );

    return croppedFile;
  }

  Future<void> postProfileAPhotoAPI(String fileName, String path) async {
    try {
      var response = await userRepository.postPhotoAPI(
          fileName, path, PreferenceUtils.getInt(eUsedId) ?? 0);
      if (response != null) {
        if (response['success'] != null && response['success']) {
          var authCtl = Get.find<AuthController>();
          eCustomToast(message: 'Profile photo updated successfully');
          authCtl.userModel.user!.imagePath = response['image_path'];
          authCtl.update();
        }
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    }
  }

  Widget genderSection()   {
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
          update();
          print(genderString);
        },
        selectedGender: Gender.Male,
        //By Default
        selectedGenderTextStyle:
            const TextStyle(color: eWhiteCLR, fontWeight: FontWeight.bold),
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



  Future<void> postProfileUpdateAPI() async {
    eProgressLoader();
    try {
      var updateResponse = await userRepository.postProfileUpdate(
        first_name: firstNameTxtController.text??"",
        last_name: lastNameTxtController.text??"",
        full_name: firstNameTxtController.text + lastNameTxtController.text??"",
        dob: dateOfBirth ?? "",
        gender: PreferenceUtils.getString(eSelectedGenderTitle) ?? "",
        userId: PreferenceUtils.getInt(eUsedId) ?? 0,
        profession_id: PreferenceUtils.getInt(eProfessionId) ?? 0,
        profession_uuid: PreferenceUtils.getString(eProfessionUuid) ?? "",
        profession_title: PreferenceUtils.getString(eProfessionTitle) ?? "",
      );
      PreferenceUtils.setString("firstName", firstNameTxtController.text ?? "");
      PreferenceUtils.setString("lastName", lastNameTxtController.text??"");
      if (updateResponse['success'] == true) {
        eCustomToast(message: updateResponse['message']);
        firstNameTxtController.text = PreferenceUtils.getString("firstName") ??  updateResponse['customer']['individual']['full_name'];
        lastNameTxtController.text = PreferenceUtils.getString("lastName") ?? "";


        PreferenceUtils.setString(eTitle, updateResponse['customer']['individual']['full_name']?? '');
        update();



      } else {
        Get.snackbar('Validation Error', updateResponse['error'] ?? '',
            backgroundColor: Colors.redAccent, colorText: eWhiteCLR);
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
    }
  }
}
