import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';

Widget eDropdownBox(String selected, List<String> items,
    Function(String?) onChanged, String hint) {
  return Container(
    height: eDropDownCustomSize,
    decoration: const BoxDecoration(
      // color: eWhiteCLR,
      color: eELSecondaryCLR,
      borderRadius: BorderRadius.all(
        Radius.circular(eSPaMa),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: eMPaMa),
      child: DropdownButton<String>(
        value: selected == '' ? null : selected,
        underline: const SizedBox.shrink(),
        isExpanded: true,
        hint: Text(
          hint,
          style: eLightMediumHintSTL,
        ),
        items: items.map((title) {
          return DropdownMenuItem<String>(
            value: title,
            child: Text(
              title,
              style: eLightMediumTextStyleSTL,
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}

// Widget eCountriesDropdownBox(
//     String hint, ELocationData selected, List<ELocationData> mList,
//     {Function(ELocationData?)? onChanged}) {
//   return Container(
//     height: eDropDownCustomSize,
//     decoration: const BoxDecoration(
//       // color: eWhiteCLR,
//       color: eELSecondaryCLR,
//       borderRadius: BorderRadius.all(
//         Radius.circular(eSPaMa),
//       ),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: eMPaMa),
//       child: DropdownButton<ELocationData>(
//         value: selected.name == null ? null : selected,
//         underline: const SizedBox.shrink(),
//         isExpanded: true,
//         hint: Text(
//           hint,
//           style: eLightMediumHintSTL,
//         ),
//         items: mList.map((location) {
//           return DropdownMenuItem<ELocationData>(
//             value: location,
//             child: Text(
//               location.name ?? '',
//               style: eLightMediumTextStyleSTL,
//             ),
//           );
//         }).toList(),
//         onChanged: onChanged,
//       ),
//     ),
//   );
// }
