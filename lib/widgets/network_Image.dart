import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:flutter/material.dart';

Widget eNetworkImage(AppSystemController logic, String url) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: eSPaMa,
      horizontal: eSPaMa,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: logic.isDarkTheme ? eDarkThemeBorderCLR : eLightThemeBorderCLR,
      ),
      borderRadius: BorderRadius.circular(
        eSPaMa,
      ),
    ),
    child: Image.network(
      url,
      fit: BoxFit.fill,
      height: eExtraLargeIcon,
      width: eExtraLargeIcon,
      errorBuilder: (BuildContext context, Object exception, ___) {
        return const SizedBox(
          height: eExtraLargeIcon,
          width: eExtraLargeIcon,
        );
      },
      loadingBuilder: (BuildContext context, Widget childWidget,
          ImageChunkEvent? loadingProgress) {
        return loadingProgress == null
            ? childWidget
            : SizedBox(
                width: eExtraLargeIcon,
                height: eExtraLargeIcon,
                child: Center(
                  child: SizedBox(
                    height: eSmallIcon,
                    width: eSmallIcon,
                    child: Center(
                      child: SizedBox(
                        height: eSmallIcon,
                        width: eSmallIcon,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    ),
  );
}

Widget eExpandedNetworkImage(AppSystemController logic, String url) {
  return Image.network(
    url,
    errorBuilder: (BuildContext context, Object exception, ___) {
      return const SizedBox();
    },
    loadingBuilder: (BuildContext context, Widget childWidget,
        ImageChunkEvent? loadingProgress) {
      return loadingProgress == null
          ? childWidget
          : SizedBox(
              width: eExtraLargeIcon,
              height: eExtraLargeIcon,
              child: Center(
                child: SizedBox(
                  height: eSmallIcon,
                  width: eSmallIcon,
                  child: Center(
                    child: SizedBox(
                      height: eSmallIcon,
                      width: eSmallIcon,
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            );
    },
  );
}
