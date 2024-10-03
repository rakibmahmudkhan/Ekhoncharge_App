import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/widgets/dol_durma_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class CouponWidget extends StatefulWidget {
   List<Widget>? widgets;
     CouponWidget({this.widgets});

   @override
   State<CouponWidget> createState() => _CouponWidgetState();
 }

 class _CouponWidgetState extends State<CouponWidget> {
   @override
   Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic){
      return Container(
        //height: Get.height*0.13 , //Add height as per requirement
        width: Get.width*1, //Add width as per requirement,
        margin: const EdgeInsets.only(left: 0, right: 0, top: 10,bottom: 10),
        child: ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: DolDurmaClipper(holeRadius: 20),
          child: Container(
            decoration: BoxDecoration(
                color: logic.isDarkTheme?eDSecondPrimaryCLR
                    : eLightCouponCLR.withOpacity(0.2), borderRadius: BorderRadius.circular(12),
            border: Border.all(color: logic.isDarkTheme
              ? Colors.transparent
              : eLightThemeBorderCLR,width: 0.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: widget.widgets??[],
            ),
          ),
        ),
      );
    });
   }
 }

