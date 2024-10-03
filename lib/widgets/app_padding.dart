import 'package:ekhoncharge/settings/pamas.dart';
import 'package:flutter/material.dart';

Widget eAppPadding({Widget? child}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: eELPaMa,
      right: eELPaMa,
      bottom: eELPaMa,
    ),
    child: child,
  );
}
