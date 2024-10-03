import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget eBoxCardItem(AppSystemController logic,
    {String? title, IconData? iconData, Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 78,
      height: 98,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          eSPaMa,
        ),
        border: Border.all(
          color: logic.isDarkTheme ? eDarkThemeBorderCLR : eLightThemeBorderCLR,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(
              eMPaMa,
            ),
            margin: const EdgeInsets.only(
              bottom: eSPaMa,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                eSPaMa,
              ),
              color: eLSecondaryCLR,
            ),
            child: Icon(
              iconData,
              color: eWhiteCxLR,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              title!.tr,
              style: logic.isDarkTheme
                  ? eDarkExtraSmallTextStyleSTL.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                  : eLightExtraSmallTextStyleSTL.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          )
        ],
      ),
    ),
  );
}

Widget eBoxCardNetworkItem(AppSystemController logic,
    {String? title, String? url, Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 78,
      height: 98,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          eSPaMa,
        ),
        border: Border.all(
          color: logic.isDarkTheme ? eDarkThemeBorderCLR : eLightThemeBorderCLR,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(eDoubleExtraSmallPaMa),
            margin: const EdgeInsets.only(
              bottom: eSPaMa,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                eSPaMa,
              ),
              color: eLSecondaryCLR,
            ),
            child: Image.network(
              url ?? '',
              height: 35,
              width: 35,
              errorBuilder: (BuildContext context, Object exception, ___) {
                return const SizedBox(
                  height: 35,
                  width: 35,
                );
              },
              loadingBuilder: (BuildContext context, Widget childWidget,
                  ImageChunkEvent? loadingProgress) {
                return loadingProgress == null
                    ? childWidget
                    : Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              title!.tr,
              style: logic.isDarkTheme
                  ? eDarkExtraSmallTextStyleSTL
                  : eLightExtraSmallTextStyleSTL,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          )
        ],
      ),
    ),
  );
}

Widget eBoxCardAssetItem(AppSystemController logic, String asset,
    {String? title, Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: 78,
      height: 98,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          eSPaMa,
        ),
        border: Border.all(
          color: logic.isDarkTheme ? eDarkThemeBorderCLR : eLightThemeBorderCLR,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(eDoubleExtraSmallPaMa),
            margin: const EdgeInsets.only(
              bottom: eSPaMa,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                eSPaMa,
              ),
              color: eLSecondaryCLR,
            ),
            child: Image.asset(
              asset,
              height: 35,
              width: 35,
              errorBuilder: (BuildContext context, Object exception, ___) {
                return const SizedBox(
                  height: 35,
                  width: 35,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              title!.tr,
              style: logic.isDarkTheme
                  ? eDarkExtraSmallTextStyleSTL
                  : eLightExtraSmallTextStyleSTL,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          )
        ],
      ),
    ),
  );
}
