import 'package:customer_surfscout/controllers/onBoarding_controller.dart';
import 'package:customer_surfscout/ui/widgets/onBoarding_widget.dart';
import 'package:customer_surfscout/utils/constants/images.dart';
import 'package:customer_surfscout/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/styles.dart';
import '../widgets/text_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final List<Map<String, String>> onBoardingTexts = [
      {
        "title": AppStrings.onBoarding1Heading,
        "subtitle": AppStrings.onBoarding1Text
      },
      {
        "title": AppStrings.onBoarding2Heading,
        "subtitle": AppStrings.onBoarding2Text
      },
      {
        "title": AppStrings.onBoarding3Heading,
        "subtitle": AppStrings.onBoarding3Text
      },
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnboardingWidget(
                  image: AppImages.onBoarding1,
                  title: AppStrings.onBoarding1Heading,
                  subTitle: AppStrings.onBoarding1Text),
              OnboardingWidget(
                  image: AppImages.onBoarding2,
                  title: AppStrings.onBoarding2Heading,
                  subTitle: AppStrings.onBoarding2Text),
              OnboardingWidget(
                  image: AppImages.onBoarding3,
                  title: AppStrings.onBoarding3Heading,
                  subTitle: AppStrings.onBoarding3Text),
            ],
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMD, vertical: AppSizes.paddingLG),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor:
                              AppColors.tertiaryColor.withOpacity(0.2)),
                      onPressed: () {
                        controller.skippage();
                      },
                      child: TextWidget(
                        text: AppStrings.skipBtn,
                        style: AppStyles.onBoardingSkip,
                      )),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                Expanded(
                  // flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.spacingXS,
                        vertical: AppSizes.spacingMD),
                    child: Obx(() {
                      final currentIndex = controller.currentPageIndex.value;
                      return Column(
                        spacing: AppSizes.spacingXS,
                        children: [
                          TextWidget(
                            text: onBoardingTexts[currentIndex]["title"]!,
                            style: AppStyles.onBoardingHeading,
                            textAlign: TextAlign.justify,
                          ),
                          TextWidget(
                            text: onBoardingTexts[currentIndex]["subtitle"]!,
                            style: AppStyles.labelSmall,
                            softwrap: true,
                            maxLine: 4,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                // I N D I C A T O R
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: controller.pageController,
                      onDotClicked: controller.dotNavigationClick,
                      count: 3,
                      effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.primaryColor,
                          dotHeight: 6,
                          dotWidth: 10),
                    ),
                    // P A G E   B T N
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.previousPage();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_left_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.nextPage();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
