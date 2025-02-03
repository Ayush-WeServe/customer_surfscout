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
    if (currentPageIndex.value == 3) {
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
    currentPageIndex.value = 3;
    pageController.animateToPage(3,
        duration: Duration(milliseconds: 500), curve: Curves.linear);
  }
}
