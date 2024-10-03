import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';

Widget eMyCustomerButton(String title, {Function()? onTap, Color? color}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: eMPaMa,
        horizontal: eMPaMa,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(eSPaMa),
      ),
      child: Text(
        title,
        style: eDarkSmallTextStyleSTL,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
