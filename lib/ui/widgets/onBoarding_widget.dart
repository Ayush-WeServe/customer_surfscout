import 'package:customer_surfscout/controllers/onBoarding_controller.dart';
import 'package:customer_surfscout/utils/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/strings.dart';
import '../../utils/constants/styles.dart';
import 'custom_elevated_button_widget.dart';
import 'custom_outlined_button.dart';
import 'text_widget.dart';

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final bool authScreen;

  const OnboardingWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.authScreen = false});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Column(
      children: [
        Stack(
          children: [
            // B A C K G R O U N D    I M A G E
            Image.asset(
              image,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    AppColors.tertiaryColor.withOpacity(0.1),
                    AppColors.tertiaryColor.withOpacity(0.1),
                    AppColors.tertiaryColor.withOpacity(0.1),
                    AppColors.tertiaryColor.withOpacity(0.5),
                    AppColors.tertiaryColor.withOpacity(0.6),
                    AppColors.tertiaryColor.withOpacity(0.7),
                  ])),
              child: Column(
                children: [
                  // S K I P   B T N
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.spacingXS),
                    child: Align(
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
                  ),

                  Expanded(
                    flex: 3,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.spacingXL),
                      child: Column(
                        spacing: AppSizes.spacingXS,
                        children: [
                          TextWidget(
                            text: title,
                            style: AppStyles.onBoardingHeading,
                          ),
                          TextWidget(
                            text: subTitle,
                            style: AppStyles.labelSmall,
                            softwrap: true,
                            maxLine: 4,
                          ),
                          authScreen
                              ? Row(
                                  spacing: AppSizes.spacingXS,
                                  children: [
                                    Flexible(
                                      child: CustomOutlinedButton(
                                          text: AppStrings.signIn,
                                          onPressed: () {
                                            Get.toNamed(
                                                AppRouteNames.loginScreen);
                                          }),
                                    ),
                                    Flexible(
                                      child: CustomElevatedButton(
                                        text: AppStrings.signUp,
                                        onPressed: () {
                                          Get.toNamed(
                                              AppRouteNames.signupScreen);
                                        },
                                      ),
                                    )
                                  ],
                                )
                              :
                              // I N D I C A T O R
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmoothPageIndicator(
                                      controller: controller.pageController,
                                      onDotClicked:
                                          controller.dotNavigationClick,
                                      count: 4,
                                      effect: ExpandingDotsEffect(
                                          activeDotColor:
                                              AppColors.primaryColor,
                                          dotHeight: 6,
                                          dotWidth: 10),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.previousPage();
                                            },
                                            icon: Icon(
                                              Icons
                                                  .keyboard_arrow_left_outlined,
                                              color: AppColors.primaryColor,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              controller.nextPage();
                                            },
                                            icon: Icon(
                                              Icons
                                                  .keyboard_arrow_right_outlined,
                                              color: AppColors.primaryColor,
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
