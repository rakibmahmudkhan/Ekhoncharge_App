import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/app_utils_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final AuthController authController = Get.find();

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<AppUtilsController>().fetchContact();
    });
    super.initState();
  }
  final AppUtilsController _utilsController = Get.put(AppUtilsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AuthController>(builder: (authLogic) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          appBar: eHomeAppBarWithoutBalance(logic,authController),
          body: SafeArea(
            child: eAppPadding(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  Center(
                    child: Text(
                      "Contact us",
                      style: logic.isDarkTheme
                          ? eDarkMediumTitleStyleSTL
                          : eLightMediumTitleStyleSTL,
                    ),
                  ),
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: eSPaMa),
                    child: Text(
                      "If you have any inquiries, get in touch with us. We'll be happy to help you.",
                      style: logic.isDarkTheme
                          ? eDarkSmallTextStyleSTL
                          : eLightSmallTextStyleSTL,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  Card(
                    color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: logic.isDarkTheme
                              ? eCardColor
                              : eLightThemeBorderCLR,
                          width: 0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        //mainAxisSize: MainAxisSize.min,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.mobileScreenButton,
                                  size: eMediumIcon,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              //  mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  " Phone Number",
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTitleStyleSTL
                                      : eLightSmallTitleStyleSTL,
                                ),
                                eRSmallSizedBox(),
                                eRSmallSizedBox(),
                                eRSmallSizedBox(),


                                Obx(
                                      () {
                                    if (_utilsController.contactData.isEmpty) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: _utilsController.contactData.length,
                                        itemBuilder: (context, index) {
                                          var contactRecord =
                                          _utilsController.contactData[index];
                                          return

                                            SelectableText(
                                              contactRecord['full_number'],
                                              style: logic.isDarkTheme
                                                  ? eDarkSmallTextStyleSTL
                                                  : eLightSmallTextStyleSTL,
                                            );


                                        },
                                      );

                                    }
                                  },
                                ),



                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  eCMediumSizedBox(),
                  Card(
                    color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: logic.isDarkTheme
                              ?  eCardColor
                              : eLightThemeBorderCLR,
                          width: 0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        //mainAxisSize: MainAxisSize.min,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.envelope,
                                  size: eMediumIcon,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              //  mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  " Email Address",
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTitleStyleSTL
                                      : eLightSmallTitleStyleSTL,
                                ),
                                eRSmallSizedBox(),
                                eRSmallSizedBox(),
                                eRSmallSizedBox(),
                                SelectableText(
                                  " info@ekhoncharge.com",
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTextStyleSTL
                                      : eLightSmallTextStyleSTL,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  eCMediumSizedBox(),
                  eCMediumSizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: eSPaMa),
                    child: Text(
                      "Social Media",
                      style: logic.isDarkTheme
                          ? eDarkSmallTitleStyleSTL
                          : eLightSmallTitleStyleSTL,

                    ),
                  ),
                  eCMediumSizedBox(),
                  Card(
                    color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: logic.isDarkTheme
                              ? eCardColor
                              : eLightThemeBorderCLR,
                          width: 0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            //mainAxisSize: MainAxisSize.min,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.facebook,
                                      size: eMediumIcon,
                                      color: logic.isDarkTheme?eWhiteCLR:Colors.lightBlue,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  //  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      " Facebook",
                                      style: logic.isDarkTheme
                                          ? eDarkSmallTitleStyleSTL
                                          : eLightSmallTitleStyleSTL,
                                    ),
                                    eRSmallSizedBox(),
                                    eRSmallSizedBox(),
                                    eRSmallSizedBox(),
                                    SelectableText(
                                      " facebook.com/ekhoncharge",
                                      style: logic.isDarkTheme
                                          ? eDarkSmallTextStyleSTL
                                          : eLightSmallTextStyleSTL,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //   child: Row(
                        //     //mainAxisSize: MainAxisSize.min,
                        //     mainAxisSize: MainAxisSize.max,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //         Expanded(
                        //         flex: 1,
                        //         child: Column(
                        //           children: [
                        //             FaIcon(
                        //               FontAwesomeIcons.instagram,
                        //               size: eMediumIcon,
                        //               color: logic.isDarkTheme?eWhiteCLR:Colors.redAccent.withOpacity(0.8),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Expanded(
                        //         flex: 3,
                        //         child: Column(
                        //           //  mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: [
                        //             Text(
                        //               " Instragram",
                        //               style: logic.isDarkTheme
                        //                   ? eDarkSmallTitleStyleSTL
                        //                   : eLightSmallTitleStyleSTL,
                        //             ),
                        //             eRSmallSizedBox(),
                        //             eRSmallSizedBox(),
                        //             eRSmallSizedBox(),
                        //             Text(
                        //               " @ekhoncharge",
                        //               style: logic.isDarkTheme
                        //                   ? eDarkSmallTextStyleSTL
                        //                   : eLightSmallTextStyleSTL,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //   child: Row(
                        //     //mainAxisSize: MainAxisSize.min,
                        //     mainAxisSize: MainAxisSize.max,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //         Expanded(
                        //         flex: 1,
                        //         child: Column(
                        //           children: [
                        //             FaIcon(
                        //               FontAwesomeIcons.linkedin,
                        //               size: eMediumIcon,
                        //               color: logic.isDarkTheme?eWhiteCLR:Colors.blueAccent.withOpacity(1),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Expanded(
                        //         flex: 3,
                        //         child: Column(
                        //           //  mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.start,
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: [
                        //             Text(
                        //               " Linkedin",
                        //               style: logic.isDarkTheme
                        //                   ? eDarkSmallTitleStyleSTL
                        //                   : eLightSmallTitleStyleSTL,
                        //             ),
                        //             eRSmallSizedBox(),
                        //             eRSmallSizedBox(),
                        //             eRSmallSizedBox(),
                        //             Text(
                        //               " linkedin.com/in/ekhoncharge",
                        //               style: logic.isDarkTheme
                        //                   ? eDarkSmallTextStyleSTL
                        //                   : eLightSmallTextStyleSTL,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
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
                    Icons.arrow_back_ios,
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
