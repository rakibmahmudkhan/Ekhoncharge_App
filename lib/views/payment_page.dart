// import 'package:ekhoncharge/controller/app_system_controller.dart';
// import 'package:ekhoncharge/controller/payment_controller.dart';
// import 'package:ekhoncharge/settings/colors.dart';
// import 'package:ekhoncharge/settings/styles.dart';
// import 'package:ekhoncharge/widgets/appBar.dart';
// import 'package:ekhoncharge/widgets/app_padding.dart';
// import 'package:ekhoncharge/widgets/button.dart';
// import 'package:ekhoncharge/widgets/sized_boxes.dart';
// import 'package:ekhoncharge/widgets/text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class PaymentPage extends StatefulWidget {
//   const PaymentPage({super.key});
//
//   @override
//   PaymentPageState createState() => PaymentPageState();
// }
//
// class PaymentPageState extends State<PaymentPage> {
//   PaymentController pc = Get.find();
//
//   @override
//   void initState() {
//     super.initState();
//     pc.resetPaymentPage();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AppSystemController>(
//       builder: (logic) {
//         return GetBuilder<PaymentController>(
//           builder: (paymentCtl) {
//             return Scaffold(
//               backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eWhiteCLR,
//
//               appBar: eAppBar(logic, title: 'Wallet Recharge'),
//               body: eAppPadding(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     eCEELargeSizedBox(),
//                     eCEELargeSizedBox(),
//                     eCustomTextFormField(
//                       paymentCtl.amountTxtCtl,
//                       inputType: TextInputType.number,
//                       hint: 'Enter amount',
//                     ),
//                     Text('Minimum amount 10 BDT',
//                         style: logic.isDarkTheme
//                             ? eDarkDoubleExtraSmallTextStyleSTL
//                             : eLightDoubleExtraSmallTextStyleSTL),
//                     eCEELargeSizedBox(),
//                     eCEELargeSizedBox(),
//                     eCEELargeSizedBox(),
//                     SizedBox(
//                       width: double.maxFinite,
//                       child: eButton(
//                         logic,
//                         title: 'Proceed to Pay',
//                         onPressed: () {
//                           paymentCtl.validatePaymentForm();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
