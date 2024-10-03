import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';


Widget reusableActionButton(AppSystemController logic,{
  VoidCallback? onPress,String? name
}){
  return GestureDetector(
    onTap: onPress!,
    child: Card(
      elevation: 3.0,

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(width: 1, color: eCardColor)),
      color: const Color.fromRGBO(116, 134, 134, 100),
      child: SizedBox(
        height: 35,
        width: 110,
        child: Center(
            child: Text(
              name!,
              style: logic.isDarkTheme
                  ? eDarkSmallTextStyleSTL
                  : eLightSmallTextStyleSTL ,
            )),
      ),
    ),
  );
}