import 'dart:io';

import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/controller/booking_controller.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/models/ekhon_charge_station.dart';
import 'package:ekhoncharge/models/my_custom_slot.dart';
import 'package:ekhoncharge/models/user_booked_slots.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SlotBookedDetailsPage extends StatefulWidget {
  const SlotBookedDetailsPage({super.key});

  @override
  State<SlotBookedDetailsPage> createState() => _SlotBookedDetailsPageState();
}

class _SlotBookedDetailsPageState extends State<SlotBookedDetailsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<BookingController>().fetchSlotBookedAPI();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<AuthController>(builder: (authController) {
          return GetBuilder<BookingController>(builder: (bookingController) {
            List<String> dateList = bookingController.generateDateList();
            List<MyCustomSlot> timeSlots = bookingController.timeSlots;

            return Scaffold(
              appBar: eHomeAppBarWithoutBalance(logic, authController),
              resizeToAvoidBottomInset: false,
              backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
              body: eAppPadding(
                  child: Background(
                isActive: false,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                        width: Get.width * 1,
                        child: ListView(
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 80),
                                child: Center(
                                    child: Text(
                                  "Slots Booked Details",
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTitleStyleSTL
                                      : eLightMediumTitleStyleSTL,
                                )),
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color:
                                      logic.isDarkTheme ? eCardColor : eHintCLR,
                                  borderRadius: BorderRadius.circular(8.0)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.00, horizontal: 8.00),
                        child: Text(
                          "Past Booked Slots",
                          style: logic.isDarkTheme
                              ? eDarkSmallTitleStyleSTL
                              : eLightSmallTitleStyleSTL,
                        ),
                      ),
                      Container(
                          height: Get.height * 0.18,
                          width: Get.width * 1,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: logic.isDarkTheme ? eCardColor : eHintCLR,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: eHintCLR, width: 1)),
                          child: ListView.builder(
                            itemCount: bookingController.pastRecords.length,
                            itemBuilder: (context, index) {
                              var pastRecord =
                              bookingController.pastRecords[index];

                              var pastDate = pastRecord['timeslot_id']
                                  .toString()
                                  .substring(0, 10) ??
                                  'No Date';
                              var pastTimes = pastRecord['times'] ?? 'No Times';

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: logic.isDarkTheme
                                          ? eDPrimaryCLR3
                                          : eHintCLR,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text(pastDate),
                                          Spacer(),
                                          Text(
                                            pastTimes,
                                            style: logic.isDarkTheme
                                                ? eDarkExtraSmallTextStyleSTL
                                                : eLightExtraSmallTextStyleSTL,
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          )


                      ),
                      eCMediumSizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.00, horizontal: 8.00),
                        child: Text(
                          "Today Booked Slots",
                          style: logic.isDarkTheme
                              ? eDarkSmallTitleStyleSTL
                              : eLightSmallTitleStyleSTL,
                        ),
                      ),
                      Container(
                          height: Get.height * 0.18,
                          width: Get.width * 1,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: logic.isDarkTheme ? eCardColor : eHintCLR,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: eHintCLR, width: 1)),
                          child: ListView.builder(
                            itemCount: bookingController.todayRecords.length,
                            itemBuilder: (context, index) {
                              var todaysRecord =
                              bookingController.todayRecords[index];

                              var todaysDate = todaysRecord['timeslot_id']
                                  .toString()
                                  .substring(0, 10) ??
                                  'No Date';
                              var todaysTimes = todaysRecord['times'] ?? 'No Times';

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: logic.isDarkTheme
                                          ? eDPrimaryCLR3
                                          : eHintCLR,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text(todaysDate),
                                          Spacer(),
                                          Text(
                                            todaysTimes,
                                            style: logic.isDarkTheme
                                                ? eDarkExtraSmallTextStyleSTL
                                                : eLightExtraSmallTextStyleSTL,
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          )


                      ),
                      eCMediumSizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.00, horizontal: 8.00),
                        child: Text(
                          "Future Booked Slots",
                          style: logic.isDarkTheme
                              ? eDarkSmallTitleStyleSTL
                              : eLightSmallTitleStyleSTL,
                        ),
                      ),
                      Container(
                          height: Get.height * 0.18,
                          width: Get.width * 1,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: logic.isDarkTheme ? eCardColor : eHintCLR,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: eHintCLR, width: 1)),
                          child: ListView.builder(
                            itemCount: bookingController.futureRecords.length,
                            itemBuilder: (context, index) {
                              var futureRecord =
                                  bookingController.futureRecords[index];
                              var futureTimes = futureRecord['times'] ?? 'No Times';
                              var futureDate = futureRecord['timeslot_id']
                                      .toString()
                                      .substring(0, 10) ??
                                  'No Date';

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: logic.isDarkTheme
                                          ? eDPrimaryCLR3
                                          : eHintCLR,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text(futureDate),
                                          Spacer(),
                                          Text(
                                            futureTimes,
                                            style: logic.isDarkTheme
                                                ? eDarkExtraSmallTextStyleSTL
                                                : eLightExtraSmallTextStyleSTL,
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          )

                          /*ListView.builder(itemCount:bookingController.myUserBookedSlots.length,
                            itemBuilder: (context, index){
                          String times= bookingController.myUserBookedSlots[index] .futureRecords![index].times??"Not available";

                          return     Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: logic.isDarkTheme
                                    ? eDPrimaryCLR3
                                    : eHintCLR,
                                borderRadius: BorderRadius.circular(8.0),),
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text("27-1-2024"),

                                    Text(times,style: logic.isDarkTheme?eDarkExtraSmallTextStyleSTL:eLightExtraSmallTextStyleSTL,),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          );
                            }
                        )*/
                          ),
                      eCMediumSizedBox(),
                    ],
                  ),
                ),
              )),
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
                )
            );
          });
        });
      },
    );
  }
}
