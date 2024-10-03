import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool isActive;
  final bool? opacity;

  const Background(
      {Key? key, required this.child, required this.isActive, this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return isActive
    //     ? SizedBox(
    //         child: child,
    //       )
    //     : Container(
    //         height: MediaQuery.of(context).size.height,
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //             colors: opacity == false
    //                 ? [eELSecondaryCLR, eELPrimaryCLR]
    //                 : [eDSecondaryCLR, eDPrimaryCLR],
    //             begin: Alignment.bottomRight,
    //             end: Alignment.topRight,
    //             tileMode: TileMode.clamp,
    //           ),
    //         ),
    //         child: child,
    //       );

    return SizedBox(
      child: child,
    );
  }
}
