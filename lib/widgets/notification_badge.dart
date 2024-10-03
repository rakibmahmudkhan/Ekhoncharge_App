import 'package:ekhoncharge/controller/home_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:flutter/material.dart';

Widget eNotificationBadge(HomeController controller) {
  return Stack(
    children: [
      const Icon(Icons.notifications),
      Positioned(
        right: 0,
        child: Visibility(
          // visible: controller.vehicleCounts.notification != null &&
          //     controller.vehicleCounts.notification! > 0,

          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text(
              // '${controller.vehicleCounts.notification ?? ''}',
              '0',
              style: const TextStyle(
                color: eWhiteCLR,
                fontSize: eDoubleExtraSmallFontSize,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
    ],
  );
}
