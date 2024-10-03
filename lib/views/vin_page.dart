import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/views/ragistration_no_page.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VINPage extends StatefulWidget {
  final String selectedColor;
  final String selectedYear;
  final String selectedBrand;
  final String selectedModel;

  VINPage(
    this.selectedColor,
    this.selectedYear,
    this.selectedBrand,
    this.selectedModel,
  );

  @override
  _VINPageState createState() => _VINPageState();
}

class _VINPageState extends State<VINPage> {
  String vinNumber = '';

  // Function to handle VIN input changes
  void _onVINChanged(String value) {
    setState(() {
      vinNumber = value;
    });
  }

  // Function to check if the VIN is completely input and enable the Next button
  bool _isVINComplete() {
    return vinNumber.trim().isNotEmpty;
  }

  // Function to handle the Next button press and navigate to the RegistrationNoPage
  void _onNextButtonPressed() {
    if (_isVINComplete()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegistrationNoPage(
              widget.selectedColor,
              widget.selectedYear,
              widget.selectedBrand,
              widget.selectedModel,
              vinNumber),
        ),
      );
    } else {
      // Show an error or prompt the user to input the VIN completely
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: eShaddowColor,
      appBar: AppBar(
        title: Text('VIN Page'),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        titleTextStyle: eLightBtnTextStyleSTL,
        centerTitle: true,
        backgroundColor: eDarkThemeBGCLR,
        elevation: 0.0,
        toolbarHeight: 40,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            eCMediumSizedBox(),
            eCMediumSizedBox(),
            eCMediumSizedBox(),
            TextFormField(
              onChanged: _onVINChanged,
              //controller: _firstNameController,
              cursorColor: eDPrimaryCLR2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  filled: true,
                  fillColor: eDSecondPrimaryCLR,
                  enabledBorder: OutlineInputBorder(

                      borderSide:
                          BorderSide(width: 1, color: eDSecondPrimaryCLR),
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Enter VIN',
                  labelStyle: eLightBtnTextStyleSTL),
              style: eLightBtnTextStyleSTL,
            ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: _isVINComplete() ? _onNextButtonPressed : null,
                child: Container(
                    decoration: BoxDecoration(
                        color: eLSuccessCLR,
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    width: 350,
                    child: Center(child: Text("Next"),),),),
          ],
        ),
      ),
    );
  }
}
