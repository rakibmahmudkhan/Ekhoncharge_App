import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'vehicle_details_page.dart';

// Create a RegistrationNoPage where the user can input the Registration Number
class RegistrationNoPage extends StatefulWidget {
  final String selectedColor;
  final String selectedYear;
  final String selectedBrand;
  final String selectedModel;
  final String vinNumber;

  RegistrationNoPage(this.selectedColor, this.selectedYear,this.selectedBrand,  this.selectedModel,this.vinNumber);

  @override
  _RegistrationNoPageState createState() => _RegistrationNoPageState();
}

class _RegistrationNoPageState extends State<RegistrationNoPage> {
  String registrationNumber = '';

  // Function to handle Registration Number input changes
  void _onRegistrationNoChanged(String value) {
    setState(() {
      registrationNumber = value;
    });
  }

   bool _isRegistrationNoComplete() {
    return registrationNumber.trim().isNotEmpty;
  }

   void _onNextButtonPressed() {
    if (_isRegistrationNoComplete()) {
       String carColor = widget.selectedColor;
      String carModelYear = widget.selectedYear;
      String brandName = widget.selectedBrand;
      String carModel = widget.selectedModel;
      String vinNumber = widget.vinNumber;
      String registrationNo = registrationNumber;


      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VehicleDetailsPage( carColor,carModelYear,brandName, carModel,  vinNumber, registrationNo),
        ),
      );
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: eShaddowColor,
      appBar: AppBar(
        title: Text('Registration Number Page'),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            eCMediumSizedBox(),
            eCMediumSizedBox(),
            eCMediumSizedBox(),

            TextFormField(
              onChanged: _onRegistrationNoChanged,
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
                  labelText: 'Enter Registration Number',
                  labelStyle: eLightBtnTextStyleSTL),
              style: eLightBtnTextStyleSTL,





            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _isRegistrationNoComplete() ? _onNextButtonPressed : null,
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

// Create a VehicleListPage to show the collected data in the list
class VehicleListPage extends StatelessWidget {



  final String carColor;
  final String carModelYear;
  final String brandName;
  final String carModel;
  final String vinNumber;
  final String registrationNo;

  VehicleListPage(this.carColor,this.carModelYear,this.brandName, this.carModel,   this.vinNumber, this.registrationNo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle List'),
      ),
      body: ListView(
        children: [


          ListTile(title: Text('Car Color: $carColor')),
          ListTile(title: Text('Car Model Year: $carModelYear')),
          ListTile(title: Text('Brand Name: $brandName')),
          ListTile(title: Text('Car Model: $carModel')),
          ListTile(title: Text('VIN: $vinNumber')),
          ListTile(title: Text('Registration Number: $registrationNo')),
          // Add more data as needed
        ],
      ),
    );
  }
}
