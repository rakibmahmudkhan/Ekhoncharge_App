import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/pusher_controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  void initState() {
    super.initState();
    Get.find<PusherController>().onDisConnectAndUnsubscribeFromPusher(type: 1);
    Get.find<PusherController>().isPressed.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<PusherController>(builder: (pusherCtl) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
              child: Container(
                alignment: Alignment.center,
                child: Image(
                  width:
                      logic.isDarkTheme ? appDarkLogoWidth : appDarkLogoWidth,
                  height: appLogoHeight,
                  fit: BoxFit.contain,
                  image: AssetImage(
                    logic.isDarkTheme ? eDarkAppLogo : eLightAppLogo,
                  ),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    color: logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                          color: logic.isDarkTheme
                              ? Colors.transparent
                              : eDPrimaryCLR2,
                          width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          eCMediumSizedBox(),
                          Center(
                            child: Text(
                              "Transaction Summary",
                              style: logic.isDarkTheme
                                  ? eDarkMediumTitleStyleSTL
                                  : eLightMediumTitleStyleSTL,
                            ),
                          ),
                          eCEELargeSizedBox(),
                          eCMediumSizedBox(),
                          _buildInfoRow(
                              "Date:",
                              pusherCtl.paymentJson['invoice']['sales_invoice_date'].toString() ??
                                  "",
                              logic),
                          _buildInfoRow(
                              "Station:",
                              '${pusherCtl.paymentJson['chargerId'] ?? ""}',
                              logic),
                          _buildInfoRow(
                              "Charging Type:",
                              '${pusherCtl.paymentJson['connector_title'] ?? ""}',
                              logic),
                          _buildInfoRow(
                              "Unit:",
                              '${pusherCtl.paymentJson['unit_price'] ?? ""}',
                              logic),
                          _buildInfoRow(
                              "Charging Time:",
                              '${pusherCtl.paymentJson['charging_time'] ?? ""}',
                              logic),
                          _buildInfoRow(
                              "Energy Delivered:",
                              '${pusherCtl.paymentJson['total_value_kwt'] ?? ""}',
                              logic),
                          _buildInfoRow(
                              "Per unit cost:",
                              '${pusherCtl.paymentJson['unit_price'] ?? ""}',
                              logic),
                          _buildInfoRow(
                              "Total cost:",
                              '${pusherCtl.paymentJson['total_price'] ?? ""}',
                              logic),
                          eCEELargeSizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () async {
                          if (!pusherCtl.isPressed.value)
                           { await pusherCtl.fetchWalletPayment();
                           pusherCtl.isPressed.value = true;}

                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: eELPaMaButton, vertical: eLPaMa),
                              decoration: BoxDecoration(
                                color: pusherCtl.isPressed.value
                                    ? Colors.grey
                                    : eDPrimaryCLR2,
                                borderRadius: BorderRadius.circular(eMPaMa),
                              ),
                              child: Text(
                                "Proceed to Payment",
                                style: eLightBtnTextStyleSTL,
                                textAlign: TextAlign.center,
                              )

                              // eButton(logic, title: "Proceed to Payment")

                              ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }

  Widget _buildInfoRow(String title, String value, AppSystemController logic) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: logic.isDarkTheme
                ? eDarkSmallTextStyleSTL
                : eLightSmallTextStyleSTL,
          ),
          Text(
            value,
            style: logic.isDarkTheme
                ? eDarkSmallTitleStyleSTL
                : eLightSmallTitleStyleSTL,
          ),
        ],
      ),
    );
  }
}
