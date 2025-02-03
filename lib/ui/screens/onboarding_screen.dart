import 'package:customer_surfscout/controllers/onBoarding_controller.dart';
import 'package:customer_surfscout/ui/widgets/onBoarding_widget.dart';
import 'package:customer_surfscout/utils/constants/images.dart';
import 'package:customer_surfscout/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
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
              OnboardingWidget(
                image: AppImages.welcomePage,
                title: AppStrings.onBoarding4Heading,
                subTitle: AppStrings.onBoarding4Text,
                authScreen: true,
              ),
            ],
          ),
        ],
      ),
    );
    //   return Scaffold(
    //     body: SafeArea(
    //       child: OnBoardingSlider(
    //         headerBackgroundColor: Colors.transparent,
    //         finishButtonText: AppStrings.nextBtn,
    //         finishButtonStyle: FinishButtonStyle(
    //           backgroundColor: AppColors.primaryColor,
    //         ),
    //         onFinish: () {
    //           Get.toNamed(AppRouteNames.auth);
    //         },
    //         background: [
    //           Image.asset(
    //             AppImages.onBoarding1,
    //           ),
    //           Image.asset(AppImages.onBoarding2),
    //           Image.asset(AppImages.onBoarding3),
    //         ],
    //         totalPage: 3,
    //         speed: 1.8,
    //         pageBodies: [
    //           Container(
    //             color: AppColors.tertiaryColor.withOpacity(0.7),
    //             padding: EdgeInsets.symmetric(horizontal: 40),
    //             child: Column(
    //               spacing: AppSizes.spacingXS,
    //               children: <Widget>[
    //                 SizedBox(
    //                   height: 450,
    //                 ),
    //                 TextWidget(
    //                   text: AppStrings.onBoarding1Heading,
    //                   style: AppStyles.onBoardingHeading,
    //                 ),
    //                 TextWidget(
    //                   text: AppStrings.onBoarding1Text,
    //                   style: AppStyles.labelSmall,
    //                   softwrap: true,
    //                   maxLine: 4,
    //                 )
    //               ],
    //             ),
    //           ),
    //           Container(
    //             color: AppColors.tertiaryColor.withOpacity(0.7),
    //             padding: EdgeInsets.symmetric(horizontal: 40),
    //             child: Column(
    //               spacing: AppSizes.spacingXS,
    //               children: <Widget>[
    //                 SizedBox(
    //                   height: 450,
    //                 ),
    //                 TextWidget(
    //                   text: AppStrings.onBoarding2Heading,
    //                   style: AppStyles.onBoardingHeading,
    //                 ),
    //                 TextWidget(
    //                   text: AppStrings.onBoarding2Text,
    //                   style: AppStyles.labelSmall,
    //                   softwrap: true,
    //                   maxLine: 4,
    //                 )
    //               ],
    //             ),
    //           ),
    //           Container(
    //             color: AppColors.tertiaryColor.withOpacity(0.7),
    //             padding: EdgeInsets.symmetric(horizontal: 40),
    //             child: Column(
    //               spacing: AppSizes.spacingXS,
    //               children: <Widget>[
    //                 SizedBox(
    //                   height: 450,
    //                 ),
    //                 TextWidget(
    //                   text: AppStrings.onBoarding3Heading,
    //                   style: AppStyles.onBoardingHeading,
    //                 ),
    //                 TextWidget(
    //                   text: AppStrings.onBoarding3Text,
    //                   style: AppStyles.labelSmall,
    //                   softwrap: true,
    //                   maxLine: 4,
    //                 )
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
  }
}
