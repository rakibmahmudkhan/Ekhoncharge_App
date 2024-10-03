import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:flutter/material.dart';

Widget eRoundIcon(
  AppSystemController logic,
  Color color, {
  IconData? icon,
  Function()? onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: eLSecondaryCLR,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(
        icon,
        size: eSmallIcon,
        color: color,
      ),
    ),
  );
}
