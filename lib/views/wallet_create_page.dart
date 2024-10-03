import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletCreatePage extends StatefulWidget {
  const WalletCreatePage({Key? key}) : super(key: key);

  @override
  State<WalletCreatePage> createState() => _WalletCreatePageState();
}

class _WalletCreatePageState extends State<WalletCreatePage> {
  AuthController authController = AuthController();
  @override
  void initState() {
    super.initState();
    _initializePage();
  }

  Future<void> _initializePage() async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulating a delay
      await authController.postWalletCreateController();
    } catch (error) {
      print("Error: $error");
    }
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Scaffold(
        backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
        body: SafeArea(
          child: eAppPadding(
              child: Center(child: Text(eWalletCreatingTxt.tr,style: logic.isDarkTheme?eDarkSmallTitleStyleSTL:eLightSmallTitleStyleSTL,))),
        ),
      );
    });
  }
}
