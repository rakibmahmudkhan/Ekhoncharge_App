import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/controller/payment_controller.dart';
import 'package:ekhoncharge/controller/wallet_controller.dart';
import 'package:ekhoncharge/models/wallet.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/my_payment.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<PaymentController>(builder: (paymentCtl) {
        return GetBuilder<WalletController>(builder: (walletController) {
          return Scaffold(
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            resizeToAvoidBottomInset: false,
            appBar:
                eHomeAppBarWithoutBalance(logic, Get.find<AuthController>()),
            body: SafeArea(
                child: eAppPadding(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    eCMediumSizedBox(),
                    Container(
                      //height: 200,
                      width: Get.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF309279),
                              Color(0xFF25785E),
                              Color(0xFF1C5147)
                            ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(eBalance.tr,
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTitleStyleSTL
                                        : eDarkMediumTitleStyleSTL),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                    '${walletController.wallet.wallet?.balance ?? ''}',
                                    style: eDarkELTextStyleSTL.copyWith(
                                        fontSize: eEELFontSize)),
                                Text(eTk.tr,
                                    style: eDarkELTextStyleSTL.copyWith()),
                                const Spacer(),
                              ],
                            ),
                            eCMediumSizedBox(),
                          ],
                        ),
                      ),
                    ),
                    eCSmallSizedBox(),
                    eCSmallSizedBox(),
                    eCSmallSizedBox(),
                    const MyPamentWidget(),
                    eCSmallSizedBox(),
                    eCSmallSizedBox(),
                    eCSmallSizedBox(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Text(
                        eTransactionHistory.tr,
                        style: logic.isDarkTheme
                            ? eDarkMediumTitleStyleSTL
                            : eLightMediumTitleStyleSTL,
                      ),
                    ),
                    //Not working

                    eCSmallSizedBox(),
                    eCSmallSizedBox(),
                    eCSmallSizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: SizedBox(
                        height: Get.height * 0.40,
                        width: Get.width * 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: logic.isDarkTheme ? eCardColor : eWhiteCLR,
                            border: Border.all(
                                width: 1,
                                color: logic.isDarkTheme
                                    ? eCardColor
                                    : eLightThemeBorderCLR),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Obx(
                            () {
                              if (walletController.wallet.walletTransactions ==
                                      null ||
                                  walletController
                                      .wallet.walletTransactions!.isEmpty) {
                                return Center(
                                  child: Text(eNoTransactionHistory.tr),
                                );
                              } else {
                                return ListView(
                                  children: [
                                    for (WalletTransactions transaction
                                        in walletController
                                                .wallet.walletTransactions ??
                                            [])
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            top: 5,
                                            bottom: 0),
                                        child: Container(
                                          height: Get.height * 0.11,
                                          decoration: BoxDecoration(
                                            color: logic.isDarkTheme
                                                ? eDarkThemeBGCLR
                                                : eWhiteCLR,
                                            border: Border.all(
                                                width: 1,
                                                color: logic.isDarkTheme
                                                    ? eCardColor
                                                    : eLightThemeBorderCLR),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(4),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6.0,
                                                right: 6.0,
                                                top: 8.0,
                                                bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      transaction.type!
                                                                  .trim() ==
                                                              'Deposit'
                                                          ? Icons
                                                              .download_for_offline_sharp
                                                          : Icons
                                                              .payment_outlined,
                                                      size: eMediumIcon,
                                                      color: transaction.type!
                                                                  .trim() ==
                                                              'Deposit'
                                                          ? eMSuccessCLR
                                                          : eMInfoCLR,
                                                    ),
                                                    Text(
                                                      "${transaction.transactionCode}",
                                                      style: logic.isDarkTheme
                                                          ? eDarkSmallTextStyleSTL
                                                          : eLightSmallTextStyleSTL,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${transaction.type}",
                                                      style: logic.isDarkTheme
                                                          ? eDarkSmallTitleStyleSTL
                                                          : eLightSmallTitleStyleSTL,
                                                    ),
                                                    Text(
                                                      DateFormat(
                                                              'h:mm a', 'en_US')
                                                          .format(
                                                        DateFormat(
                                                                'yyyy-MM-ddTHH:mm:ss.SSSSSSZ')
                                                            .parse(
                                                              transaction
                                                                  .createdAt!,
                                                            )
                                                            .toUtc()
                                                            .add(const Duration(
                                                                hours:
                                                                    12)), // Convert to Bangladesh time zone
                                                      ),
                                                      style: logic.isDarkTheme
                                                          ? eDarkSmallTextStyleSTL
                                                          : eLightSmallTextStyleSTL,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '${transaction.type != null && transaction.type!.trim() == 'Deposit' ? transaction.debitAmount ?? '' : transaction.creditAmount ?? ''} ${eTk.tr}',
                                                      style: logic.isDarkTheme
                                                          ? eDarkSmallTitleStyleSTL
                                                          : eLightSmallTitleStyleSTL,
                                                    ),
                                                    Text(
                                                      transaction.createdAt!
                                                          .substring(0, 10),
                                                      style: logic.isDarkTheme
                                                          ? eDarkSmallTextStyleSTL
                                                          : eLightSmallTextStyleSTL,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    eCSmallSizedBox(),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          );
        });
      });
    });
  }
}
