import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
 import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class MyEchargeBottomModelWidget extends StatelessWidget {
    MyEchargeBottomModelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder:(logic){
      return Container(
        height: 400,
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My E charge',
                    style: logic.isDarkTheme
                        ? eDarkMediumTitleStyleSTL
                        : eLightMediumTitleStyleSTL,
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Container(
                  color: Colors.white,
                  height: 190,
                  child: GridView.builder(
                    physics:
                    const NeverScrollableScrollPhysics(), //cannot scroll the gridview section
                    itemBuilder: (context, index) {
                      return Container(
                        child: myEchargeWallet[index],
                      );
                    },
                    itemCount: 5,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
  var myEchargeWallet = [
    InkWell(
      onTap: (){
        Get.toNamed(RoutesName.myOfferPage);
      },
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            //width: 60,
            child: FaIcon(
              FontAwesomeIcons.gift,
              size: eSemiMediumIcon,
            ),


          ),
          Text(eMyOffer.tr)
        ],
      ),
    ),
    InkWell(
      onTap: (){
        Get.toNamed(RoutesName.mySendMoneyPage);
      },
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            //width: 60,
            child: FaIcon(
              FontAwesomeIcons.moneyBillTransfer,
              size: eSemiMediumIcon,
            ),

          ),
          Text(eSendMoney.tr)
        ],
      ),
    ),
    InkWell(
      onTap: (){
        Get.toNamed(RoutesName.gpOfferPage);
      },
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 45,
            // width: 300,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/icons/telenor.png"),
            ),
          ),
          Text(eGpOffer.tr)
        ],
      ),
    ),
    InkWell(
      onTap: (){
        Get.toNamed(RoutesName.orderFoodPage);
      },
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
            height: 45,
            // width: 300,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/icons/foodpanda.png"),
            ),
          ),
          Text(eOrderFood.tr),

        ],
      ),
    ),
  ];
}