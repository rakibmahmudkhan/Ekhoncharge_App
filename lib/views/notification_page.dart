import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/background.dart';
import 'package:ekhoncharge/widgets/divider.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: GetBuilder<AppSystemController>(
        builder: (logic) {
          return Scaffold(
            appBar: eAppBar(logic,title: eNotificationTxt.tr),
            backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
            body: Background(
              isActive: logic.isDarkTheme,
              opacity: false,
              child: SafeArea(
                child: eAppPadding(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      eCELargeSizedBox(),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return eDivider(logic);
                          },
                          // controller: notificationLogic.scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Subject',
                                    style: logic.isDarkTheme
                                        ? eDarkMediumTitleStyleSTL.copyWith(
                                            fontWeight: FontWeight.normal,
                                          )
                                        : eLightMediumTitleStyleSTL.copyWith(
                                            fontWeight: FontWeight.normal,
                                          ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Date',
                                    style: logic.isDarkTheme
                                        ? eDarkSmallTextStyleSTL.copyWith(
                                            fontWeight: FontWeight.normal,
                                          )
                                        : eLightSmallTextStyleSTL.copyWith(
                                            fontWeight: FontWeight.normal,
                                          ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // const Visibility(
                      //   // visible: notificationLogic.isLoadMoreRunning == true,
                      //   child: CircularProgressIndicator(),
                      // ),
                      eCELargeSizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
