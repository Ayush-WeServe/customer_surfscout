import 'package:customer_surfscout/utils/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.toNamed(AppRouteNames.auth);
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  void previousPage() {
    if (currentPageIndex.value == 0) {
    } else {
      int page = currentPageIndex.value - 1;
      pageController.animateToPage(page,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  void skippage() {
    Get.toNamed(AppRouteNames.auth);
  }

  void back() {
    Get.offAllNamed(AppRouteNames.onBoarding);
  }
}
