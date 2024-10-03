import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
 import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/my_e_charge_bottom_modal_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class MyEchargePaymentWidget extends StatefulWidget {
  const MyEchargePaymentWidget({Key? key}) : super(key: key);

  @override
  State<MyEchargePaymentWidget> createState() => _MyEchargePaymentWidgetState();
}

class _MyEchargePaymentWidgetState extends State<MyEchargePaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic){
      return Container(
        padding: const EdgeInsets.symmetric(horizontal:0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: logic.isDarkTheme?eDarkThemeBGCLR:eWhiteCLR,
                border: Border.all(width: 1, color: logic.isDarkTheme?eDSecondPrimaryCLR:eLightThemeBorderCLR),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    eMyECharge.tr,
                    style: logic.isDarkTheme
                        ? eDarkSmallTitleStyleSTL
                        : eLightSmallTitleStyleSTL,
                  ),
             /*     GestureDetector(
                    onTap: () {
                      showBottomSheet(
                          backgroundColor: Colors.transparent,
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return const MyEchargeBottomModelWidget();
                          });
                    },
                    child: const Text(
                      "",
                      // 'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.w500),
                    ),
                  ),*/
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: logic.isDarkTheme?eDarkThemeBGCLR:eWhiteCLR,
                border: Border.all(width: 1, color:  logic.isDarkTheme?eDSecondPrimaryCLR:eLightThemeBorderCLR),
              ),
              height: 95,
              width: Get.width*1,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: myEchargeWallet[index],
                  );
                },
                itemCount: myEchargeWallet.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
              ),
            ),
          ],
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
           // width: Get.width*0.20,
            child: FaIcon(
              FontAwesomeIcons.gift,
              size: eSemiMediumIcon,
            ),


          ),
          Text(eMyOffer.tr, overflow: TextOverflow.ellipsis,)
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
          Text(eSendMoney.tr, overflow: TextOverflow.ellipsis,)
          //Flexible(child: Text(eSendMoney.tr,maxLines: 1,))
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
            height: 40,
            // width: 300,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/icons/telenor.png"),
            ),
          ),
          Text(eGpOffer.tr,overflow: TextOverflow.ellipsis,)],
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
            height: 40,
            // width: 300,
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/icons/foodpanda.png"),
            ),
          ),

          Text(eOrderFood.tr, overflow: TextOverflow.ellipsis,),

        ],
      ),
    ),
  ];


}
