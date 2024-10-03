import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
 import 'package:ekhoncharge/models/charging_history.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

void showTransactionDetails(HomeController homeCtl, AppSystemController logic,
    BuildContext context, int index) {
  ChargingHistoryData record = homeCtl.chargingHistoryDataList[index];
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: logic.isDarkTheme ? eCardColor : eLightThemeBGCLR,
          title: const Center(child: Text("History")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                  "Date:",

                DateFormat('dd-MMM-yyyy').format(DateTime.parse(record.createdAt!.substring(0, 10) )),
                  logic),
              _buildInfoRow(
                  "Station:", record.chargerpointTitle ?? '', logic),
              _buildInfoRow("Charging Type:",
                  record.chargerpoint?.chargingType ?? '', logic),
              _buildInfoRow(
                  "Energy Delivered:", "${record.totalValueKwt?? ""} kW"  , logic),


              _buildInfoRow(
                  "Per unit cost:", "${record.unitPrice ?? ''} ৳", logic),
              _buildInfoRow(
                  "Total cost:",

                  '${record.totalPrice != null ? record.totalPrice.toStringAsFixed(2) : ""} ৳',

                  logic),
              _buildInfoRow(
                  record.invoice?.status==0?" Paid":" Due" ,

                  '${record.totalPrice != null ? record.totalPrice.toStringAsFixed(2) : ""} ৳',

                  logic),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
               Get.back();
              },
              child: Text(
                "Close",
                style: logic.isDarkTheme
                    ? eDarkSmallTextStyleSTL
                    : eLightSmallTextStyleSTL,
              ),
            ),
          ],
        );
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
              ? eDarkMediumTextStyleSTL.copyWith(
                  fontSize: eSFontSize, fontWeight: FontWeight.normal)
              : eLightMediumTextStyleSTL.copyWith(
                  fontSize: eSFontSize, fontWeight: FontWeight.normal),
        ),
        Text(
          value,
          style: logic.isDarkTheme
              ? eDarkMediumTextStyleSTL.copyWith(fontSize: eSFontSize)
              : eLightMediumTextStyleSTL.copyWith(fontSize: eSFontSize),
        ),
      ],
    ),
  );
}
