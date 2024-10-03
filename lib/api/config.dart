import 'package:ekhoncharge/api/apis.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class APIConfig {
  static String baseURL = '';
  static String imageURL = '';
  static String bKashBaseURL = '';
  static String bkashUsername = '';
  static String bkashPassword = '';
  static String bkashAppKey = '';
  static String bkashAppSecret = '';

  static void setBaseURL(bool isReleaseBranch) {
    baseURL = isReleaseBranch ? APIs.liveBaseURL : APIs.devBaseURL;
    bKashBaseURL =
        isReleaseBranch ? APIs.liveBkashBaseUrl : APIs.devBkashBaseURL;
    bkashUsername =
        isReleaseBranch ? APIs.liveBkashUsername : APIs.devBkashUsername;
    bkashPassword =
        isReleaseBranch ? APIs.liveBkashPassword : APIs.devBkashPassword;
    bkashAppKey = isReleaseBranch ? APIs.liveBkashAppKey : APIs.liveBkashAppKey;
    bkashAppSecret =
        isReleaseBranch ? APIs.liveBkashAppSecret : APIs.devBkashAppSecret;
    imageURL = isReleaseBranch ? APIs.liveImageUrl : APIs.devImageUrl;
  }

  static Future<void> fetchData() async {
    if (kDebugMode) {
      APIConfig.setBaseURL(true);
      // if (baseURL.isEmpty ||
      //     bKashBaseURL.isEmpty ||
      //     bkashUsername.isEmpty ||
      //     bkashPassword.isEmpty ||
      //     bkashAppKey.isEmpty ||
      //     bkashAppSecret.isEmpty ||
      //     imageURL.isEmpty) {
      //   bool isRelease = await isReleaseBranch();
      //   APIConfig.setBaseURL(isRelease);
      // }
    } else {
      APIConfig.setBaseURL(true);
    }
  }

  static Future<bool> isReleaseBranch() async {
    try {
      final String head = await rootBundle.loadString('.git/HEAD');
      if (head.contains('/')) {
        if (head.split('/').last.trim() == 'release') {
          return true;
        }
      }
    } catch (e) {
      eLocalLogWriter('Error: $e');
    }
    return false;
  }
}
