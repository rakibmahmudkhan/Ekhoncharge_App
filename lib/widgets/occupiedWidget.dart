import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';

Widget occupiedWidget(
    {bool? isSelected, String? no, String? name, String? status,Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(right: 5.0),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: isSelected == true ?eDPrimaryCLR2 : eCardColor, 
        child: SizedBox(
          height: 50.0,
          width: 160,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
                  margin: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(128, 131, 120, 100),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Text(
                    no!,
                    style: eDarkSmallTextStyleSTL,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      name!,
                      style: eDarkSmallTitleStyleSTL.copyWith(color: eHintCLR),
                    ),
                    Flexible(
                      child: Text(status!,
                          style: eDarkSmallTitleStyleSTL.copyWith(
                              color: Colors.lightGreenAccent)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
