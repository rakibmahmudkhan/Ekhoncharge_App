import 'dart:async';

import 'package:ekhoncharge/controller/app_system_controller.dart';
import 'package:ekhoncharge/settings/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final _pageController = PageController(viewportFraction: 1, initialPage: 1);
  int currentPage = 1;
  // Current page index
  List<String> assetImages = [
    'assets/images/banner_five.jpg',
    'assets/images/CR 1.png',
    'assets/images/banner_three1.jpg',
    'assets/images/CR 2.png',
    'assets/images/banner_one.jpg'
  ];

  @override
  void initState() {
    super.initState();
    // Start the auto sliding animation
    startAutoSlide();
  }

  @override
  void dispose() {
    // Dispose the page controller and cancel the timer
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Timer? _timer;

  void startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage == assetImages.length - 1) {
        currentPage = 0;
      } else {
        currentPage++;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppSystemController>(builder: (logic) {
      return Column(
        children: [
          Container(
            height: 150,
            child: PageView.builder(
                controller: _pageController,
                itemCount: assetImages.length,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 2.0),
                    child: Image.asset(
                      assetImages[pagePosition],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                assetImages.length,
                (index) => Container(
                      margin: EdgeInsets.all(1.0),
                      width: 10.0,
                      child: Icon(
                        Icons.circle_rounded,
                        size: 10,
                        color: currentPage == index ? eDPrimaryCLR2 : logic.isDarkTheme?eWhiteCLR:eHintCLR,
                      ),
                    )),
          ),
        ],
      );
    });
  }
}
