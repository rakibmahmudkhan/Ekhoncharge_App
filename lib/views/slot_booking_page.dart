import 'dart:io';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/models/ekhon_charge_station.dart';
import 'package:ekhoncharge/models/my_custom_slot.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/booking_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/button.dart';
import 'package:ekhoncharge/widgets/rating_widget.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlotBookingPage extends StatefulWidget {
  const SlotBookingPage({super.key});

  @override
  State<SlotBookingPage> createState() => _SlotBookingPageState();
}

class _SlotBookingPageState extends State<SlotBookingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<BookingController>().onDateButtonTap(
        (DateTime.now().toString().substring(0, 10)), // Format the current date
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(
      builder: (logic) {
        return GetBuilder<HomeController>(builder: (homeController) {
          EkhonChargeStationData record =
              homeController.stationData[homeController.selectedStationIndex];
          return GetBuilder<BookingController>(builder: (bookingController) {
            List<String> dateList = bookingController.generateDateList();
            List<MyCustomSlot> timeSlots = bookingController.timeSlots;

            return Scaffold(
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
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      eCELargeSizedBox(),
                      SizedBox(
                        height: Get.height * 0.235,
                        width: Get.width * 1,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  record
                                          .chargerpoints![homeController
                                              .selectedChargerIndex]
                                          .title ??
                                      "",
                                  style: logic.isDarkTheme
                                      ? eDarkELTextStyleSTL
                                      : eLightELTextStyleSTL,
                                ),
                                Icon(
                                  Icons.menu_rounded,
                                  color:
                                      logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                                )
                              ],
                            ),
                            eCSmallSizedBox(),
                            eCSmallSizedBox(),
                            Row(
                              children: [
                                Text(
                                  record.dataAddress!.city ?? "",
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTextStyleSTL
                                      : eLightSmallTextStyleSTL,
                                ),
                                eCSmallSizedBox(),
                                eCSmallSizedBox(),
                                Icon(
                                  Icons.location_on,
                                  color: logic.isDarkTheme
                                      ? eDarkThemeIconCLR
                                      : eLightThemeIconCLR,
                                  size: eSmallIcon,
                                )
                              ],
                            ),
                            eCSmallSizedBox(),
                            eCSmallSizedBox(),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  size: eSmallIcon,
                                  color: eWhiteCLR,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                "${record.operatingStartHours.toString().substring(0,5) ?? ''}-${  record.operatingEndHours.toString().substring(0,5) ?? ''}",
                                  style: logic.isDarkTheme
                                      ? eDarkExtraSmallTextStyleSTL
                                      : eDarkExtraSmallTextStyleSTL,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: eSmallIcon,
                                  color: eWhiteCLR,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '2.5 km',
                                  style: logic.isDarkTheme
                                      ? eDarkExtraSmallTextStyleSTL
                                      : eDarkExtraSmallTextStyleSTL,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Icon(
                                  Icons.star_border_outlined,
                                  size: eSmallIcon,
                                  color: eWhiteCLR,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '4.5',
                                  style: logic.isDarkTheme
                                      ? eDarkExtraSmallTextStyleSTL
                                      : eDarkExtraSmallTextStyleSTL,
                                ),
                              ],
                            ),
                            eCMediumSizedBox(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eWhiteCLR,
                                      border: Border.all(
                                          width: 1,
                                          color: logic.isDarkTheme
                                              ? eCardColor
                                              : eLightThemeBorderCLR),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 6),
                                        child: Text(
                                          "Open",
                                          style: logic.isDarkTheme
                                              ? eDarkExtraSmallTextStyleSTL
                                              : eLightExtraSmallTextStyleSTL,
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 4,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: logic.isDarkTheme
                                          ? eCardColor
                                          : eWhiteCLR,
                                      border: Border.all(
                                          width: 1,
                                          color: logic.isDarkTheme
                                              ? eCardColor
                                              : eLightThemeBorderCLR),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 6),
                                        child: Text(
                                          "For All Vehicle",
                                          style: logic.isDarkTheme
                                              ? eDarkExtraSmallTextStyleSTL
                                              : eLightExtraSmallTextStyleSTL,
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: logic.isDarkTheme
                                        ? eCardColor
                                        : eWhiteCLR,
                                    border: Border.all(
                                        width: 1,
                                        color: logic.isDarkTheme
                                            ? eCardColor
                                            : eLightThemeBorderCLR),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 6),
                                      child: Text(
                                        "${timeSlots.length}" + " Left",
                                        style: logic.isDarkTheme
                                            ? eDarkExtraSmallTextStyleSTL
                                            : eLightExtraSmallTextStyleSTL,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: logic.isDarkTheme
                                        ? eCardColor
                                        : eWhiteCLR,
                                    border: Border.all(
                                        width: 1,
                                        color: logic.isDarkTheme
                                            ? eCardColor
                                            : eLightThemeBorderCLR),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 6),
                                      child: Text(
                                        "⚡ ${record.chargerpoints![homeController.selectedChargerIndex].chargingType}" ??
                                            "",
                                        // "⚡Fast",
                                        style: logic.isDarkTheme
                                            ? eDarkExtraSmallTextStyleSTL
                                            : eLightExtraSmallTextStyleSTL,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            eCSmallSizedBox(),
                            eCSmallSizedBox(),
                            Row(
                              children: [
                                RatingWidget(rating: 4.5),
                                const SizedBox(width: 4),
                                Text(
                                  "4.5",
                                  style: logic.isDarkTheme
                                      ? eDarkMediumTextStyleSTL
                                      : eLightMediumTextStyleSTL,
                                ),
                              ],
                            ),
                            eCSmallSizedBox(),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    "12km",
                                    style: logic.isDarkTheme
                                        ? eDarkExtraSmallTextStyleSTL
                                        : eLightExtraSmallTextStyleSTL,
                                  ),
                                ),
                                SizedBox(
                                  width: 0,
                                  child: Text(
                                    " .  ",
                                    style: logic.isDarkTheme
                                        ? eDarkExtraSmallTextStyleSTL
                                        : eLightExtraSmallTextStyleSTL,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    "16 min",
                                    style: logic.isDarkTheme
                                        ? eDarkExtraSmallTextStyleSTL
                                        : eLightExtraSmallTextStyleSTL,
                                  ),
                                ),
                              ],
                            ),
                            eCSmallSizedBox(),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: logic.isDarkTheme
                                        ? eCardColor
                                        : eWhiteCLR,
                                    border: Border.all(
                                        width: 1,
                                        color: logic.isDarkTheme
                                            ? eCardColor
                                            : eLightThemeBorderCLR),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0, vertical: 4.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.directions,
                                            color: logic.isDarkTheme
                                                ? eDarkThemeIconCLR
                                                : eBlackCLR,
                                            size: eSmallIcon,
                                          ),
                                          Text(
                                            "Directions",
                                            style: logic.isDarkTheme
                                                ? eDarkExtraSmallTextStyleSTL
                                                : eLightExtraSmallTextStyleSTL,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                roundIconButton(logic,
                                    onPressed: () {},
                                    icon: Icons.star_border_outlined),
                                SizedBox(
                                  width: 4,
                                ),
                                roundIconButton(logic,
                                    onPressed: () {}, icon: Icons.call),
                                SizedBox(
                                  width: 4,
                                ),
                                roundIconButton(logic,
                                    onPressed: () {},
                                    icon: Icons.chat_bubble_outline_outlined),
                              ],
                            ),
                            eCSmallSizedBox(),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        color: logic.isDarkTheme
                            ? eCardColor
                            : eLightThemeBorderCLR,
                      ),
                      eCMediumSizedBox(),
                      eCSmallSizedBox(),
                      Text(
                        "Date",
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL
                            : eLightMediumTextStyleSTL,
                      ),
                      eCSmallSizedBox(),
                      eCSmallSizedBox(),
                      SizedBox(
                        height: Get.height * 0.060,
                        width: Get.width * 1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dateList.length,
                          itemBuilder: (context, index) {
                            String date = dateList[index];

                            return bookingController.roundDateButton(
                                bookingController, logic,
                                date: date);
                          },
                        ),
                      ),
                      Text(
                        bookingController.currentMonthName.toString(),
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL
                            : eLightMediumTextStyleSTL,
                      ),
                      eCSmallSizedBox(),
                      eCSmallSizedBox(),
                      eCSmallSizedBox(),
                      eCSmallSizedBox(),
                      eCELargeSizedBox(),
                      Text(
                        "Available Slots:",
                        style: logic.isDarkTheme
                            ? eDarkMediumTextStyleSTL
                            : eLightMediumTextStyleSTL,
                      ),
                      eCSmallSizedBox(),
                      eCSmallSizedBox(),
                      eCSmallSizedBox(),
                      SizedBox(
                        height: Get.height * 0.33,
                        width: Get.width * 1,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.25,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: timeSlots.length,
                          itemBuilder: (context, index) {
                            MyCustomSlot item = timeSlots[index];

                            return TimeSlotButton(
                              timeSlot: Text(
                                '${item.startTime} - ${item.endTime} ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              isSelected: item.status ?? " ",
                              onPressed: () {
                                bookingController.isSlotSelected(index);
                                bookingController.isWantSelecteSlots(index);
                                bookingController
                                    .isWantSelectedSlotsTimes(index);

                                print(bookingController.isWantSelectSlotsList);
                                print(
                                    bookingController.isWantSelectedSlotsTimes);
                              },
                              logic: logic,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              /*floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                       // homeController.selectedChargerIndex = 0;
                      //  homeController.selectedConnectorIndex = 0;

                        bookingController.isWantSelectSlotsList.clear();
                        bookingController.isWantSelectSlotsTimesList.clear();
                        */
              /*PreferenceUtils.setInt(
                            eSelectedConnectorId,0 );
                        PreferenceUtils.setInt(
                            eSelectedChargerId, 0);*/
              /*
                        Get.back();
                      },
                      child: Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.grey.withOpacity(.90),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            color: logic.isDarkTheme ? eWhiteCLR : eWhiteCLR,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                            child: eStationDetailsButton(logic,
                                title: "Book Now",
                                onPressed: bookingController
                                            .isWantSelectSlotsList.length !=
                                        0
                                    ? () {
                                        bookingController.postSlotAPI();
                                        */
              /*homeController.selectedChargerIndex = null;
                                        homeController.selectedConnectorIndex =
                                            null;*/
              /*
                                        //Get.toNamed(RoutesName.addMoneyPage);

                                        print(
                                            "Selected charger:${PreferenceUtils.getInt(eSelectedChargerId).toString()}");
                                        print(
                                            "Selected connector:${PreferenceUtils.getInt(eSelectedConnectorId).toString()}");

                                        print(bookingController.timeSlots
                                            .toString());
                                      }
                                    : () {
                                        Get.snackbar(
                                          'Oopsie!',
                                          'Please select a time slot before booking.',
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor:
                                              Colors.red.withOpacity(0.8),
                                          colorText: Colors.white,
                                          duration: Duration(seconds: 3),
                                          borderRadius: 10.0,
                                          margin: EdgeInsets.all(10.0),
                                          padding: EdgeInsets.all(15.0),
                                          isDismissible: true,
                                          forwardAnimationCurve:
                                              Curves.easeOutBack,
                                          reverseAnimationCurve:
                                              Curves.easeInBack,
                                        );
                                        // Get.toNamed(RoutesName.slotBookedPage);
                                      })),
                      ),
                    ),
                  ],
                ),
              ),*/
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        bookingController.isWantSelectSlotsList.clear();
                        bookingController.isWantSelectSlotsTimesList.clear();
                        Get.back();
                      },
                      child: Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey.withOpacity(.90),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Icon(
                            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                            color: logic.isDarkTheme ? eWhiteCLR : eWhiteCLR,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0), // Added SizedBox for spacing
                    Expanded(
                      child: eStationDetailsButton(logic,
                          title: "Book Now",
                          onPressed: bookingController.isWantSelectSlotsList.length != 0
                              ? () {
                            bookingController.postSlotAPI();
                            print("Selected charger: ${PreferenceUtils.getInt(eSelectedChargerId)}");
                            print("Selected connector: ${PreferenceUtils.getInt(eSelectedConnectorId)}");
                            print(bookingController.timeSlots.toString());
                          }
                              : () {
                            Get.snackbar(
                              'Oopsie!',
                              'Please select a time slot before booking.',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red.withOpacity(0.8),
                              colorText: Colors.white,
                              duration: Duration(seconds: 3),
                              borderRadius: 10.0,
                              margin: EdgeInsets.all(10.0),
                              padding: EdgeInsets.all(15.0),
                              isDismissible: true,
                              forwardAnimationCurve: Curves.easeOutBack,
                              reverseAnimationCurve: Curves.easeInBack,
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),

            );
          });
        });
      },
    );
  }
}

class TimeSlotButton extends StatelessWidget {
  final Widget timeSlot;
  final String isSelected;
  final VoidCallback onPressed;
  AppSystemController logic;

  TimeSlotButton(
      {required this.timeSlot,
      required this.isSelected,
      required this.onPressed,
      required this.logic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.all(4.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: logic.isDarkTheme
                ? isSelected == "selected"
                    ? Colors.green.withOpacity(0.5)
                    : isSelected == "occupied"
                        ? eHintCLR
                        : eCardColor
                : isSelected == "selected"
                    ? Colors.green.withOpacity(0.2)
                    : isSelected == "occupied"
                        ? eHintCLR
                        : eLightThemeBorderCLR,
            borderRadius:
                BorderRadius.circular(12.0), // Adjust the radius as needed
          ),
          child: Center(child: timeSlot),
        ));
  }
}
