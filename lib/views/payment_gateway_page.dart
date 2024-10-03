// import 'package:ekhoncharge/controller/app_system_controller.dart';
// import 'package:ekhoncharge/controller/payment_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class PaymentGatewayPage extends StatefulWidget {
//   const PaymentGatewayPage({super.key});
//
//   @override
//   State<PaymentGatewayPage> createState() => _PaymentGatewayPageState();
// }
//
// class _PaymentGatewayPageState extends State<PaymentGatewayPage> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AppSystemController>(
//       builder: (logic) {
//         return GetBuilder<PaymentController>(
//           builder: (paymentCtl) {
//             return WebViewWidget(
//                 controller: paymentCtl.controller ?? WebViewController());
//           },
//         );
//       },
//     );
//   }
// }
