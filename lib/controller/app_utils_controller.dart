import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/repository/app_utils_repository.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppUtilsController extends GetxController {
  var privacyPolicies = [].obs;


  Future<void> fetchPrivacyPolicy() async {
    eProgressLoader();
    try {
      var response = await AppUtilsRepository().fetchPrivacyPolicyRepo();
      if (response != null) {
        privacyPolicies.assignAll(response['data']);

        print(privacyPolicies.toString());
      } else {
        print("Privacy fetch error");
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }


 var faqData = [].obs;
  Future<void> fetchFaq() async {
    eProgressLoader();
    try {
      var response = await AppUtilsRepository().fetchFAQRepo();
      if (response != null) {
        faqData.assignAll(response['data']);
        print("FAQ success");
        print(faqData.toString());
      } else {
        print("FAQ fetch error");
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  var contactData = [].obs;
  Future<void> fetchContact() async {
    eProgressLoader();
    try {
      var response = await AppUtilsRepository().fetchContactRepo();
      if (response != null) {
        contactData.assignAll(response['data']);
        print("Contact success");
        print(contactData.toString());
      } else {
        print("Contact fetch error");
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }
}
