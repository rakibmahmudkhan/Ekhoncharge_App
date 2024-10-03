import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/helper/app/app_helper.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/models/my_custom_slot.dart';
import 'package:ekhoncharge/models/user_booked_slots.dart';
import 'package:ekhoncharge/repository/book_slot_repository.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/utils/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../settings/colors.dart';
import '../settings/styles.dart';

class BookingController extends GetxController {
  final _bookSlotRepo = BookSlotRepository();
  RxString selectedDate = ''.obs;
  RxString formattedDate = "".obs;

  RxString currentMonthName = ''.obs;
  RxList<MyCustomSlot> timeSlots = <MyCustomSlot>[].obs;
  RxList<UserBookedSlots> myUserBookedSlots = <UserBookedSlots>[].obs;
  RxList<FutureRecords> futureTimeSlots = <FutureRecords>[].obs;
  RxList<String> isWantSelectSlotsList = <String>[].obs;
  RxList<String> isWantSelectSlotsTimesList = <String>[].obs;

  RxSet<String> selectedSlots = <String>{}.obs;
  final _selectedSlotIndex = minusOne.obs;
  final _prevSelectedIndex = minusOne.obs;

  get selectedSlotIndex => _selectedSlotIndex.value;

  set selectedSlotIndex(value) {
    _selectedSlotIndex.value = value;
  }

  get prevSelectedIndex => _prevSelectedIndex.value;

  set prevSelectedIndex(value) {
    _prevSelectedIndex.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    updateCurrentMonthName();
    // generateTimeSlots(selectedDateTime);
  }

  bool isDateSelected(String date) {
    return selectedDate.value == date;
  }

  isWantSelecteSlots(int index) {
    String selectedId = timeSlots[index].timeslotId.toString();

    if (isWantSelectSlotsList.contains(selectedId)) {
      isWantSelectSlotsList.remove(selectedId);
    } else {
      isWantSelectSlotsList.add(selectedId);
    }

    print(selectedId);

    update();
  }

  isWantSelectedSlotsTimes(int index) {
    String selectedTimes =
        ("${timeSlots[index].startTime.toString()}-${timeSlots[index].endTime.toString()}");

    if (isWantSelectSlotsTimesList.contains(selectedTimes)) {
      isWantSelectSlotsTimesList.remove(selectedTimes);
    } else {
      isWantSelectSlotsTimesList.add(selectedTimes);
    }

    print(selectedTimes);

    update();
  }

  void isSlotSelected(int index) {
    if (timeSlots[index].status != "occupied") {
      if (timeSlots[index].status == "selected") {
        timeSlots[index].status = "unSelected";
      } else {
        timeSlots[index].status = "selected";
      }

      update();
    }
  }

  void onDateButtonTap(
    String date,
  ) async {
    selectedDate.value = date;
    print("Selected Date 222: ${selectedDate.value}");

    // Convert the selected date string to DateTime
    DateTime selectedDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      int.parse(date.substring(8, 10)),
    );

    // Update time slots based on the selected date
    List<MyCustomSlot> newTimeSlots = createTimeSlots(selectedDateTime,
        hourRange: PreferenceUtils.getString(eStationOperatingHours));
    timeSlots.assignAll(newTimeSlots);
    generateTimeSlots(selectedDateTime);
    print("Selected Date 222: ${selectedDate.value}");
    await fetchSlotAPI();
  }

  List<String> generateDateList() {
    List<String> dateList = [];
    DateTime today = DateTime.now();
    for (int i = 0; i < 6; i++) {
      DateTime nextDay = today.add(Duration(days: i));
      // String formattedDate = "${nextDay.day}/${nextDay.month}/${nextDay.year}";
      String formattedDate = nextDay.toString().substring(0, 10);
      //  String formattedDate = "${nextDay.year.toString()}-${nextDay.month.toString()}-${nextDay.day.toString()}";
      dateList.add(formattedDate);
      //2024-01-10
    }
    return dateList;
  }

  void generateTimeSlots(DateTime selectedDateTime) {
    if (selectedDateTime != null) {
      timeSlots.assignAll(createTimeSlots(selectedDateTime,
          hourRange: PreferenceUtils.getString(eStationOperatingHours)));
    }
  }

  void updateCurrentMonthName() {
    DateTime currentDate = DateTime.now();
    currentMonthName.value = DateFormat('MMMM').format(currentDate).toString();
  }

  List<MyCustomSlot> createTimeSlots(DateTime selectedDateTime,
      {String? hourRange}) {
    List<MyCustomSlot> slots = [];
    if (hourRange != null && hourRange.contains(" - ")) {
      List<String> hours = hourRange.split(" - ");
      if (hours[0].contains(".") && hours[1].contains(".")) {
        DateTime startTime = DateTime(
          selectedDateTime.year,
          selectedDateTime.month,
          selectedDateTime.day,
          int.parse(hours[0].split('.')[0].trim()),
          int.parse(hours[0].split('.')[1].trim()),
        );

        DateTime endTime = DateTime(
          selectedDateTime.year,
          selectedDateTime.month,
          selectedDateTime.day,
          int.parse(hours[1].split('.')[0].trim()),
          int.parse(hours[1].split('.')[1].trim()),
        );

        while (startTime.isBefore(endTime)) {
          String formattedStartTime = DateFormat('hh:mm a').format(startTime);
          String formattedEndTime = DateFormat('hh:mm a')
              .format(startTime.add(Duration(minutes: 30)));

          int index = slots.length + 1;
          String dateIndex = '';
          if (selectedDateTime.month < 9) {
            dateIndex =
                "${selectedDateTime.day}/0${selectedDateTime.month}/${selectedDateTime.year}_$index";
          } else {
            dateIndex =
                "${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year}_$index";
          }

          //slots.add('$formattedStartTime - $formattedEndTime [$dateIndex]');
          slots.add(
            MyCustomSlot(
                startTime: formattedStartTime,
                endTime: formattedEndTime,
                timeslotId: dateIndex),
          );
          startTime = startTime.add(Duration(minutes: 30));
        }
      } // Change as needed
    }

    return slots;
  }

  Future<void> fetchSlotAPI() async {
    //reset
    eProgressLoader();
    try {
      var response = await _bookSlotRepo.fetchBookingSlotAPIRepo(
        date: selectedDate.value,
        chargerPoint: PreferenceUtils.getInt(eSelectedChargerId),
        connector: PreferenceUtils.getInt(eSelectedConnectorId),
      );
      if (response != null) {
        MyCustomSlot.fromJson(response['todayIds'], timeSlots);
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }


  List<dynamic> pastRecords = [].obs;
  List<dynamic> todayRecords = [].obs;
  List<dynamic> futureRecords = [].obs;

  Future<void> fetchSlotBookedAPI() async {
    try {
      var response = await _bookSlotRepo.fetchSlotBookedAPIRepo(
        customerId: PreferenceUtils.getInt(eCustomerId),
      );

      if (response['success'] == true) {
        pastRecords = response['data']['pastRecords'];
        todayRecords = response['data']['todayRecords'];
        futureRecords = response['data']['futureRecords'];
        update(); // Notify listeners to update the UI
      } else {
        // Handle error
        print('Error: ${response['message']}');
      }
    } catch (error) {
      // Handle other errors
      print('Error: $error');
    }
    }





  /*Future<List<PastRecords>>  fetchSlotBookedAPI() async {
    //reset
    eProgressLoader();
    try {
      var response = await _bookSlotRepo.fetchSlotBookedAPIRepo(
        customerId: PreferenceUtils.getInt(eCustomerId),
      );

      if (response != null && response["success"] == "true") {
        var data= jsonDecode(response.body.toString());
        for(Map i in data){
          PastRecords pastRecords= PastRecords(times: i["times"]);
          pastRecordsList.add(pastRecords);
        }
        update();
        return pastRecordsList;
        *//*print("Rakib Mahmud khan");
        print(response["success"]);*//*
     *//*   UserBookedSlots userBookedSlots =
            UserBookedSlots.fromJson(response["data"]);
        myUserBookedSlots.add(userBookedSlots);*//*
        update();
        // String times = userBookedSlots.data!.futureRecords![index].times ?? "No times available";

        //  print(times);
        return response["data"];
      }
      else{
        return pastRecordsList;
      }
    } catch (error) {
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }*/

  Future<void> postSlotAPI() async {
    eProgressLoader();
    if (selectedDate.value.isNotEmpty) {
      DateTime inputDate = DateTime.parse(selectedDate.value);

      formattedDate.value =
          "${inputDate.day.toString().padLeft(2, '0')}/${inputDate.month.toString().padLeft(2, '0')}/${inputDate.year}";

      print(formattedDate); // Output: 23/01/2024
    } else {
      print("selectedDate is empty");
    }

    try {
      var response = await _bookSlotRepo.postBookingSlotAPIRepo(
          chargerPoint: PreferenceUtils.getInt(eSelectedChargerId),
          connector: PreferenceUtils.getInt(eSelectedConnectorId),
          timeSlots: isWantSelectSlotsList,
          //timeSlots: ['23/01/2024_2','23/01/2024_3'],
          times: isWantSelectSlotsTimesList,
          day: formattedDate.value,
          customerId: PreferenceUtils.getInt(eCustomerId));

      if (response != null && response['message'] == 'success') {
        Future.delayed(Duration(seconds: 1), () {
          Get.toNamed(RoutesName.addMoneyPage);
          isWantSelectSlotsList.clear();
          isWantSelectSlotsTimesList.clear();
        });

        update();
        Get.snackbar(
          'Success',
          'Slot booking Successfully.',
          snackPosition: SnackPosition.TOP,
          backgroundColor:
          Colors.blue.withOpacity(0.8),
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

      } else {
        Get.snackbar('Error', 'Booking failed. Please try again.');
      }
    } catch (error) {
      // Handle the error
      eLocalLogWriter(error.toString());
    } finally {
      Get.back();
      update();
    }
  }

  RxBool isConnectorSelected = false.obs;

  void toggleSelection() {
    isConnectorSelected.value = !isConnectorSelected.value;
    update();
  }

  Widget roundDateButton(
      BookingController bookingController, AppSystemController logic,
      {Function()? onPressed, String? date}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 6.0,
      ),
      child: InkWell(
        onTap: () {
          bookingController.onDateButtonTap(date ?? '');
          update();
        },
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: date == bookingController.selectedDate.value
                ? Colors.green
                : Colors.grey,
            shape: BoxShape.rectangle,
            border: Border.all(
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              date?.substring(8, 10) ?? '',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
