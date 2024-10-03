import 'package:ekhoncharge/constants/app_constants.dart';
import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/user_controller.dart';
import 'package:ekhoncharge/helper/app/pref_helper.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfessionSelectionButton extends StatefulWidget {
  final UserController userController = Get.put(UserController());

  ProfessionSelectionButton({super.key});

  @override
  State<ProfessionSelectionButton> createState() =>
      _ProfessionSelectionButtonState();
}

class _ProfessionSelectionButtonState extends State<ProfessionSelectionButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<UserController>(
        builder: (userController) {
          return SizedBox(
            height: Get.height * 0.063,
            width: double.maxFinite,
            child: Card(
              color: logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
              elevation: 5,
              shadowColor: logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
              child: Container(
                decoration: BoxDecoration(
                    color: logic.isDarkTheme ? eDSecondPrimaryCLR : eWhiteCLR,
                    borderRadius: BorderRadius.circular(eSPaMa),
                border: Border.all(width: 1,color: logic.isDarkTheme
                    ? eDSecondPrimaryCLR
                    : eDSecondaryCLR,)
                ),
                child: InkWell(
                  onTap: () async {
                    userController.fetchAllProfessionData();
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: logic.isDarkTheme
                                      ? eDSecondPrimaryCLR
                                      : eWhiteCLR,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search for a profession',
                                        prefixIcon: Icon(Icons.search),
                                      ),
                                      onChanged: (value) {
                                        userController
                                            .searchForProfession(value);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Obx(
                                      () => userController
                                              .professionList.isEmpty
                                          ? Center(child: Text("No data"))
                                          : ListView.builder(
                                              itemCount: userController
                                                  .professionList.length,
                                              itemBuilder: (context, index) {
                                                final profession =
                                                    userController
                                                        .professionList[index];
                                                return ListTile(
                                                  title: Text(
                                                      profession.title ??
                                                          'Profession Name'),
                                                  onTap: () async {
                                                    userController
                                                        .isSelectedProfession
                                                        .value = true;
                                                    userController
                                                        .handleProfessionSelection(
                                                      profession.title
                                                          .toString(),
                                                      profession.id!.toInt(),
                                                      profession.uuid
                                                          .toString(),
                                                    );
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              },
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.cases_outlined,
                          size: eSmallIcon,
                          color: logic.isDarkTheme ? eWhiteCLR : eHintCLR,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                userController.isSelectedProfession == true
                                    ? PreferenceUtils.getString(
                                            eSelectedProfessionTitle)
                                        .toString()
                                    : "Profession",
                                style: logic.isDarkTheme
                                    ? eLightMediumHintWthSTL
                                    : eLightMediumHintSTL,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: userController
                                            .isSelectedProfession.value
                                        ? logic.isDarkTheme?eWhiteCLR:eGreenColor
                                        :logic.isDarkTheme? eBlackCLR:eRedColor,
                                  ),
                                ),
                                child: Icon(
                                  userController.isSelectedProfession.value
                                      ? Icons.check
                                      : Icons.add,
                                  size: eESmallIcon,
                                  color:
                                      userController.isSelectedProfession.value
                                          ? logic.isDarkTheme?eWhiteCLR:eGreenColor
                                          :logic.isDarkTheme? eBlackCLR:eRedColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
