import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/payment_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/views/home.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BkashSuccessPage extends StatelessWidget {
  const BkashSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(

        canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          Get.offAll(() => const Home());
        },
        child: GetBuilder<AppSystemController>(
          builder: (systemController) {
            return GetBuilder<PaymentController>(
              builder: (paymentController) {
                return Scaffold(
                  backgroundColor: systemController.isDarkTheme
                      ? eDarkThemeBGCLR
                      : eDarkThemeBGCLR,
                  resizeToAvoidBottomInset: false,
                  body: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitleRow(),
                              const SizedBox(height: 8),
                              _buildUserInfo(paymentController),
                              const SizedBox(height: 16),
                              Container(
                                decoration: BoxDecoration(
                                  color: systemController.isDarkTheme
                                      ? eCardColor
                                      : eWhiteCLR,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    width: 2,
                                    color: systemController.isDarkTheme
                                        ? eCardColor
                                        : eLightThemeBorderCLR,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: eLightThemeBorderCLR,
                                      spreadRadius: 0.3,
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                      blurStyle: BlurStyle.normal,
                                    ),
                                  ],
                                ),
                                margin: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 12),
                                      child: _buildTransactionDetails(
                                          paymentController),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        _buildBackToHomeButton(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
    //);
  }

  Widget _buildTitleRow() {
    return const Row(
      children: [
        Text(
          'Your ',
          style: TextStyle(
            color: eBkashColor,
            fontSize: eLFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Add Money ',
          style: TextStyle(
            color: eBkashColor,
            fontSize: eELFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'is ',
          style: TextStyle(
            color: eBkashColor,
            fontSize: eLFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Successful',
          style: TextStyle(
            color: eLSuccessCLR,
            fontSize: eLFontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo(PaymentController paymentController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[200],
            backgroundImage:
                const AssetImage('assets/images/placeholder-profile.jpg'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paymentController.depositResponse['customer_name'] ?? '',
                style: const TextStyle(
                  fontSize: eMFontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                paymentController.depositResponse['mobile'] ?? '',
                style: const TextStyle(
                  fontSize: eMFontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionDetails(PaymentController paymentController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
          title: 'Time',
          value:
              "${paymentController.depositResponse['date_time']?.toString().substring(11, 16) ?? ''} ${paymentController.depositResponse['date_time']?.toString().substring(0, 10) ?? ''}",
        ),
        eCELargeSizedBox(),
        _buildDetailRow(
          title: 'Transaction ID',
          value: paymentController.depositResponse['trxID'] ?? '',
        ),
        eCELargeSizedBox(),
        _buildDetailRow(
          title: 'Total',
          value: '৳ ${paymentController.depositResponse['total'] ?? ''}',
        ),
        eCELargeSizedBox(),
        _buildDetailRow(
          title: 'New Balance',
          value: '৳ ${paymentController.depositResponse['new_balance'] ?? ''}',
        ),
      ],
    );
  }

  Widget _buildDetailRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildBackToHomeButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => Get.offAll(() => const Home()),
        child: Container(
          height: 54,
          color: ePinkColor,
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Back to Home',
                  style: TextStyle(
                    color: eWhiteCLR,
                    fontSize: eLFontSize,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: eWhiteCLR,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
