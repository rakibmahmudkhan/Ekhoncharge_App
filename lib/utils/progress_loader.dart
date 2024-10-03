import 'package:ekhoncharge/custom_views/spinner.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void eProgressLoader() {
  Get.defaultDialog(
    title: '',
    backgroundColor: Colors.transparent,
    barrierDismissible: false,
    content: SizedBox(
      height: 100,
      width: 100,
      child: ESpinner(
        color: eLSuccessCLR,
        size: 55,
        waveColor: Colors.green.shade200,
      ),
    ),
  );
}
