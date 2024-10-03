 import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWalletBottomModelWidget extends StatelessWidget {
    MyWalletBottomModelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[

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
                      child: myWallet[index],
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
  }
  var myWallet = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //width: 60,
          child: const Icon(
            Icons.download_outlined,
            size: eMediumIcon,
          ),
        ),
        Text(eReceive.tr)
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
        Text(ePayment.tr)
      ],
    ),
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
        Text(eAddMoney.tr)
      ],
    ),
  ];
}
