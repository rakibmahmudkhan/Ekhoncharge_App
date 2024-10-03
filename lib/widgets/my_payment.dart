import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
 import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_wallet_bottom_model_widget.dart';

class MyPamentWidget extends StatefulWidget {
  const MyPamentWidget({Key? key}) : super(key: key);

  @override
  State<MyPamentWidget> createState() => _MyPamentWidgetState();
}

class _MyPamentWidgetState extends State<MyPamentWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width:1, color:

                     logic.isDarkTheme
                        ? eDSecondPrimaryCLR
                        : eLightThemeBorderCLR,  ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    eMyWallet.tr,
                    style: logic.isDarkTheme
                        ? eDarkMediumTitleStyleSTL
                        : eLightMediumTitleStyleSTL,
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(width:1, color:

                logic.isDarkTheme
                    ? eDSecondPrimaryCLR
                    : eLightThemeBorderCLR, ),
              ),
              height: 95,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: myWallet[index],
                  );
                },
                itemCount: myWallet.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
  var myWallet = [
 /*   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //width: 60,
          child: const Icon(
            Icons.download_outlined,
            size: eMediumIcon,
          ),
        ),
        Text(eReceive.tr, overflow: TextOverflow.ellipsis,)
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // width: 60,
          child: const Icon(
            Icons.credit_card,
            size: eMediumIcon,
          ),

          //Image.asset('assets/icons/credit-card.png'),
        ),
        Text(ePayment.tr, overflow: TextOverflow.ellipsis,)
      ],
    ),*/
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(RoutesName.addMoneyPage);
          },
          child: const Icon(
            Icons.account_balance_wallet_outlined,
            size: eMediumIcon,
          ),
        ),
        Text(eAddMoney.tr, overflow: TextOverflow.ellipsis,)
      ],
    ),
  ];

}
