import 'package:ekhoncharge/api/config.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/account_delete_controller.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/app_utils_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/controller/booking_controller.dart';
import 'package:ekhoncharge/controller/change_password_controller.dart';
import 'package:ekhoncharge/controller/forgot_password_controller.dart';
import 'package:ekhoncharge/controller/charger_box_controller.dart';
import 'package:ekhoncharge/controller/connectivity-controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/controller/my_google_map_controller.dart';
import 'package:ekhoncharge/controller/pusher_controller.dart';
import 'package:ekhoncharge/controller/vehicle_controller.dart';
import 'package:ekhoncharge/controller/payment_controller.dart';
import 'package:ekhoncharge/controller/user_controller.dart';
import 'package:ekhoncharge/controller/wallet_controller.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/network/controller_binding.dart';
import 'package:ekhoncharge/routes/routes.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/views/forgot_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'helper/lan/translations.dart';
import 'views/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await APIConfig.fetchData();
  await PreferenceUtils.init();
  Get.put(AppSystemController()).setIsLanSelected();
  Get.put(AuthController());
  Get.put(HomeController());
  Get.put(ChargerBoxController());
  Get.put(VehicleController());
  Get.put(PaymentController());
  Get.put(UserController());
  Get.put(WalletController());
  Get.put(PusherController());
  Get.put(BookingController());
  Get.put(ConnectivityController());
  Get.put(AppUtilsController());
  Get.put(MyGoogleMapController());
  Get.put(ForgotPasswordController());
  Get.put(ChangePasswordController());
  Get.put(AccountDeleteController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: Locale(
          PreferenceUtils.getString(eLanguage, eEnLanguage) ?? eEnLanguage),
      fallbackLocale: const Locale(eBnLanguage),
      enableLog: true,
      theme: PreferenceUtils.getBoolOnlyTheme(eIsDarkTheme) ?? true
          ? ThemeData.dark().copyWith(scaffoldBackgroundColor: eDPrimaryCLR3)
          : ThemeData.light(),
      // home:   controller.connectionType == MConnectivityResult.wifi || controller.connectionType == MConnectivityResult.mobile?const SplashPage():const ConnectivityCheckPage(),
      //home: const ConnectivityCheckPage(),
      //home:   ChangeForgotPasswordPage(),//For Testing
      //  home:GoogleMapPage(),
      home: const SplashPage(),
      //home: const ForgotPasswordPage(),
      getPages: Routes.appRoutes(),
      builder: EasyLoading.init(),
    );
  }
}
