import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/utils/curved_navbar_utils.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../controller/app_system_controller.dart';
import '../../controller/auth_controller.dart';

class OrderFoodPage extends StatefulWidget {
  const OrderFoodPage({super.key});

  @override
  State<OrderFoodPage> createState() => _OrderFoodPageState();
}

class _OrderFoodPageState extends State<OrderFoodPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authLogic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Container(),
            shape: CurvedAppBarShape(),
            toolbarHeight: 70,
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 12.0, bottom: 4.0),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: const AssetImage(
                            'assets/images/placeholder-profile.jpg'),
                      ),
                    ),
                    Obx(() {
                      final userModel = authLogic.userModel;
                      final userName = userModel.user!.name ?? "User Name";
                      return Text(
                        userName.toString(),
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.notification_important,
                        color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                        size: eMediumIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: eAppPadding(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        eCMediumSizedBox(),
                        Container(
                          decoration: BoxDecoration(
                            color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: logic.isDarkTheme
                                  ? eCardColor
                                  : eLightThemeBorderCLR,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: eLightThemeBorderCLR,
                                spreadRadius: 0.3,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                                blurStyle: BlurStyle.normal,
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // eCMediumSizedBox(),
                              eCMediumSizedBox(),
                              Center(
                                child: Text(
                                  "Order Food  ",
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTitleStyleSTL
                                      : eLightMediumTitleStyleSTL,
                                ),
                              ),
                              eCMediumSizedBox(),
                              eCMediumSizedBox(),
                              ListTile(
                                title: Text(
                                  'Coming Soon.....',
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTitleStyleSTL.copyWith(
                                      fontWeight: FontWeight.w400)
                                      : eLightMediumTitleStyleSTL.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                                subtitle: Text(
                                  ' ',
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTextStyleSTL
                                      : eLightSmallTextStyleSTL.copyWith(color: eDblackTextColor),
                                ),
                              ),

                              eCELargeSizedBox(),

                              eCELargeSizedBox(),
                              eCELargeSizedBox(),
                              // eCELargeSizedBox(),
                              // eCELargeSizedBox(),
                              // eCELargeSizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            focusElevation: 2,
            elevation: 4,
            label: Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.backward,
                  color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                  size: eESmallIcon,
                ),
                // SizedBox(width: 5,),
                Text(
                  "  Back",
                  style: logic.isDarkTheme
                      ? eDarkSmallTitleStyleSTL
                      : eLightSmallTitleStyleSTL,
                ),
              ],
            ),
            onPressed: () {
              Get.back();
            },
            backgroundColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
          ),
        );
      });
    });
  }
}
