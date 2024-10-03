import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/controller/app_utils_controller.dart';
import 'package:ekhoncharge/controller/auth_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/pamas.dart';
import 'package:ekhoncharge/settings/styles.dart';
import 'package:ekhoncharge/widgets/appBar.dart';
import 'package:ekhoncharge/widgets/app_padding.dart';
import 'package:ekhoncharge/widgets/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ChargingFaqPage extends StatefulWidget {
  const ChargingFaqPage({Key? key}) : super(key: key);

  @override
  State<ChargingFaqPage> createState() => _ChargingFaqPageState();
}

class _ChargingFaqPageState extends State<ChargingFaqPage> {
  final AuthController authController = Get.find();

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<AppUtilsController>().fetchFaq();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return GetBuilder<AppUtilsController>(builder: (controller) {
        return Scaffold(
          backgroundColor: logic.isDarkTheme ? eDarkThemeBGCLR : eLightThemeBGCLR,
          resizeToAvoidBottomInset: false,
          appBar: eHomeAppBarWithoutBalance(logic, authController),
          body: SafeArea(
            child: eAppPadding(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: GetBuilder<AppUtilsController>(
                    builder: (controller) {
                      if (controller.faqData.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        // Show the FAQ data
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var faqCategory in controller.faqData) ...[
                              // Display Category
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Category: ${faqCategory['category']}',
                                  style: logic.isDarkTheme
                                      ? eDarkSmallTitleStyleSTL
                                      : eLightSmallTitleStyleSTL,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              // Display Questions and Answers
                              Column(
                                children:
                                    (faqCategory['questionsAndAnswers'] as List)
                                        .map<Widget>((qa) {
                                  var question = qa['question'];
                                  var answer = qa['answers'];

                                  return Column(
                                    children: [
                                      Text('Q: $question',
                                          style: logic.isDarkTheme
                                              ? eDarkSmallTitleStyleSTL
                                              : eLightSmallTitleStyleSTL,
                                          textAlign: TextAlign.justify),
                                      eCSmallSizedBox(),
                                      Text(
                                        'A: $answer',
                                        style: logic.isDarkTheme
                                            ? eDarkSmallTextStyleSTL
                                            : eLightSmallTextStyleSTL,
                                        textAlign: TextAlign.justify,
                                      ),
                                      eCSmallSizedBox(),
                                      eCSmallSizedBox(),
                                    ],
                                  );
                                }).toList(),
                              ),
                              const Divider(),
                            ],
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            focusElevation: 2,
            elevation: 4,
            label: Row(
              children: [
                FaIcon(
                  Icons.arrow_back_ios,
                  color: logic.isDarkTheme ? eWhiteCLR : eBlackCLR,
                  size: eESmallIcon,
                ),
                // SizedBox(width: 5,),
                Text(
                  "  Back",
                  style: logic.isDarkTheme
                      ? eDarkSmallTitleStyleSTL
                      : eLightSmallTitleStyleSTL,
                ),
              ],
            ),
            onPressed: () {
              Get.back();
            },
            backgroundColor: logic.isDarkTheme ? eCardColor : eWhiteCLR,
          ),
        );
      });
    });
  }
}

/*Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Center(
                        child: Text(
                          "Charging FAQ",
                          style: logic.isDarkTheme
                              ? eDarkMediumTitleStyleSTL
                              : eLightMediumTitleStyleSTL,
                        ),
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),



                      Text(
                        "1.	What is Ekhon Charge and what does the mobile app offer?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Ekhon Charge is an EV charging company in Bangladesh. Our mobile app helps users find nearby Ekhon Charge EV DC and AC chargers. You can pay bills, control charging, and access detailed info about chargers and your EV.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "2.	How can I locate the nearest Ekhon Charge EV charger using the app?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "The app uses your location to show the nearest Ekhon Charge EV chargers on the map. Just open the app and explore the map to find the closest charger.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "3. Can I pay my EV charging bill through the app?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Yes, you can! The app allows you to conveniently pay your Ekhon Charge EV charging bills using different payment methods. Payments are accepted through Bkash, Visa Mastercard, and other mobile banking services as well.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "4.	Can I control the charging of my EV through the app?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Absolutely! You can start or stop the charging of your EV using the app. It's that simple and convenient.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "5.	How does the app provide information about the chargers and my EV?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "The app fetches data from our servers to display charger availability, distance, cost, and time calculations for each charger. It also fetches your EV specifications for accurate statistics and information.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "6.	Will the app track the history and performance of my EV?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Yes, the app helps you keep track of your charging history and provides performance insights for your EV.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "7.	How does the app calculate the distance, range, cost, and time for charging my EV?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Based on your location and the charger's information, the app calculates the distance to the charger, estimates the range of your EV, and provides cost and time estimates for charging.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "8.	How does the app ensure communication between the EV and the charger?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "The app connects to our servers, which are linked to the chargers. This allows the app to communicate with the charger and your EV for operations like starting or stopping charging.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "9.	What kind of user information is required to access the app?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Basic user information like name, email, phone number, date of birthday and EV details is required to use the app effectively. This helps personalize the experience and provide accurate EV-related data.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Center(
                        child: Text(
                          "AC vs DC Charging",
                          style: logic.isDarkTheme
                              ? eDarkMediumTitleStyleSTL
                              : eLightMediumTitleStyleSTL,
                        ),
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "1.	What is the difference between AC and DC charging, and what charging options does Ekhon Charge provide?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "AC (Alternating Current) charging and DC (Direct Current) charging refer to different methods of supplying power to your EV. Ekhon Charge offers DC charging up to 180kW and AC charging up to 22kW.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "2. How does the charging speed vary between DC and AC chargers at Ekhon Charge?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "DC chargers, especially at higher capacities like 120kW or 180kW, can charge an EV from 20% to 80% in approximately 20-30 minutes and 15-20 minutes respectively, depending on the EV model's battery capacity. DC chargers operate at higher power capacities, enabling faster charging speeds. This difference in power output is why DC chargers can charge an EV significantly faster than AC chargers.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "3. What about AC charging times at Ekhon Charge?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Using a 22kW AC charger, an EV that supports this charging speed might take around 4 hours to charge from 20% to 80%, based on the EV's battery capacity. If the EV supports only 11kW AC charging, the time might extend to approximately 6 hours.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "4. How does the EV's model or battery capacity affect the charging time on both DC and AC chargers?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "The charging time greatly depends on the specific model and battery capacity of the EV. Different EV models have varying battery sizes, affecting the charging time, whether using DC or AC chargers. ",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "5. How can I identify if my EV is compatible with Ekhon Charge's AC or DC chargers?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Your EV's manual or specifications usually indicate its charging capabilities. If you're unsure, our app can help you identify which chargers are suitable for your specific EV model.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "6. What factors might influence the time taken to charge an EV, besides charger capacity?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Apart from the charger's capacity, factors such as the current charge level of the EV, battery temperature, and the presence of fast-charging technology in the EV affect the charging time.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "7. Can I monitor the charging progress of my EV using the Ekhon Charge mobile app?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Yes, the app allows you to track the charging progress of your EV, including the time taken and the current charge level, making it convenient to manage your charging needs.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                      Text(
                        "8. Are there plans to introduce higher capacity AC or DC chargers in the future at Ekhon Charge stations?",
                        style: logic.isDarkTheme
                            ? eDarkSmallTitleStyleSTL
                            : eLightSmallTitleStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      Text(
                        "Ekhon Charge is always exploring new technologies and advancements in charging infrastructure. Stay tuned for updates on any new charger capacities or offerings in the future.",
                        style: logic.isDarkTheme
                            ? eDarkSmallTextStyleSTL
                            : eLightSmallTextStyleSTL,
                        textAlign: TextAlign.justify,
                      ),
                      eCMediumSizedBox(),
                      eCMediumSizedBox(),
                    ],
                  ),*/
