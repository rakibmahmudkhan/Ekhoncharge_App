import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/views/vin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarColorPage extends StatefulWidget {
  final String selectedYear;
  final String selectedBrand;
  final String selectedModel;

  CarColorPage(this.selectedModel, this.selectedYear, this.selectedBrand);

  @override
  _CarColorPageState createState() => _CarColorPageState();
}

class _CarColorPageState extends State<CarColorPage> {
  // Define the list of car colors for the selected car model year (replace this with your data source)
  List<String> carColors = [
    'Red',
    'Blue',
    'Black',
  ];

  // Function to handle car color selection and navigate to the VINPage
  void _onCarColorSelected(String selectedColor, String selectedYear,
      String selectedBrand, String selectedModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VINPage(
          selectedColor,
          widget.selectedYear,
          widget.selectedBrand,
          widget.selectedModel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
            'Car Colors (${widget.selectedModel} - ${widget.selectedYear})'),
        titleTextStyle: eLightBtnTextStyleSTL,
        centerTitle: true,
        backgroundColor: eDarkThemeBGCLR,
        elevation: 0.0,
        toolbarHeight: 40,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: carColors.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: eCardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(
                        carColors[index],
                        style: eLightBtnTextStyleSTL,
                      ),
                      onTap: () => _onCarColorSelected(
                          carColors[index],
                          widget.selectedYear,
                          widget.selectedBrand,
                          widget.selectedModel),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
