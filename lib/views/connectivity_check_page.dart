import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ekhoncharge/controller/connectivity-controller.dart';
import 'package:ekhoncharge/routes/routes_name.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:ekhoncharge/settings/font-sizes.dart';
import 'package:ekhoncharge/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ConnectivityCheckPage extends StatefulWidget {
  const ConnectivityCheckPage({Key? key}) : super(key: key);

  @override
  State<ConnectivityCheckPage> createState() => _ConnectivityCheckPageState();
}

class _ConnectivityCheckPageState extends State<ConnectivityCheckPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3900));
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ConnectivityController>();
    return Scaffold(
      body: Center(
        child: Obx(() {
          return controller.connectionType == MConnectivityResult.wifi ||
                  controller.connectionType == MConnectivityResult.mobile
              ? const SplashPage()
              : noInternet(context, controller);
        }),
      ),
    );
  }

  Widget noInternet(BuildContext context, ConnectivityController controller) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Column(
        children: [
          Lottie.asset(
            "assets/animations/no_internet.json",
            controller: _controller,
          ),
          const SizedBox(height: 10),
          const Text(
            "No Internet Connection",
            style: TextStyle(
              fontSize: eLFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black87
            ),
          ),
        ],
      ),
      content: const Text(
        "Please check your connection and try again.",
        textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black87,fontSize: eMFontSize),
      ),
      actions: [
        TextButton(
          onPressed: () async {

            if (!controller.isShowingSnackbar.value) {
              controller.isLoading(
                  true);
              final result = await Connectivity().checkConnectivity();
              controller.isLoading(
                  false);
              if (result != ConnectivityResult.none) {

                Get.toNamed(RoutesName.splashPage);

              } else {
                 controller.isShowingSnackbar.value =
                    true;
                Get.snackbar(
                  "No Internet",
                  "Looks like you're lost in the digital wilderness. Let's find a signal!",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 3),
                  backgroundColor: eCardColor,
                  colorText: Colors.white,
                  snackStyle: SnackStyle.FLOATING,
                  borderRadius: 16,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  isDismissible: true,
                  forwardAnimationCurve: Curves.easeOut,
                 reverseAnimationCurve: Curves.easeIn,
                  animationDuration: const Duration(milliseconds: 1000),
                );

                 Future.delayed(const Duration(seconds: 3), () {
                  setState(() {
                    controller.isShowingSnackbar.value = false;
                  });
                });

              }
            }
          },
          child: Obx(() {
            return controller.isLoading.value
                ? const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Refreshing",style: TextStyle(color: eDPrimaryCLR2,fontSize: eMFontSize),),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ],
                  )
                : const Text(
                    "Refresh",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: eDPrimaryCLR2,
                    ),
                  );
          }),
        ),
      ],
    );
  }

/*
  Widget noInternet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Lottie.asset(
          "assets/animations/no_internet.json",
          controller: _controller,
          onLoaded: (composition) {
            _controller.duration = composition.duration;
            _controller.forward();
          },
        ),
      */ /*  Image.asset(
          'assets/icons/no_internet.png',
          color: Colors.red,
          height: 100,
        ),*/ /*
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text(
            "No Internet connection",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text("Check your connection, then refresh the page."),
        ),
      ],
    );
  }*/
}
