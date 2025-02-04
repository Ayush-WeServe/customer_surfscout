import 'package:customer_surfscout/ui/widgets/custom_elevated_button_widget.dart';
import 'package:customer_surfscout/ui/widgets/custom_outlined_button.dart';
import 'package:customer_surfscout/utils/constants/colors.dart';
import 'package:customer_surfscout/utils/constants/images.dart';
import 'package:customer_surfscout/utils/constants/routes.dart';
import 'package:customer_surfscout/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/onBoarding_controller.dart';
import '../../utils/constants/strings.dart';
import '../../utils/constants/styles.dart';
import '../widgets/text_widget.dart';

class Authscreen extends StatelessWidget {
  const Authscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcomePage,
            height: double.infinity,
            width: double.infinity,
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
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.paddingXL),
                child: Column(
                  spacing: AppSizes.spacingXS,
                  children: [
                    // B A C K    B U T T O N
                    Align(
                      alignment: Alignment.topRight,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  AppColors.tertiaryColor.withOpacity(0.2)),
                          onPressed: () {
                            controller.back();
                          },
                          child: TextWidget(
                            text: AppStrings.backBtn,
                            style: AppStyles.onBoardingSkip,
                          )),
                    ),

                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                      ),
                    ),

                    Expanded(
                      child: Column(
                        spacing: AppSizes.spacingXS,
                        children: [
                          TextWidget(
                            text: AppStrings.onBoarding4Heading,
                            style: AppStyles.onBoardingHeading,
                            textAlign: TextAlign.justify,
                          ),
                          TextWidget(
                            text: AppStrings.onBoarding4Text,
                            style: AppStyles.labelSmall,
                            softwrap: true,
                            maxLine: 4,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      spacing: AppSizes.spacingSM,
                      children: [
                        CustomOutlinedButton(
                          text: AppStrings.signIn,
                          onPressed: () {
                            Get.toNamed(AppRouteNames.loginScreen);
                          },
                          width: MediaQuery.of(context).size.width * 0.38,
                        ),
                        CustomElevatedButton(
                          text: AppStrings.signUp,
                          onPressed: () {
                            Get.toNamed(AppRouteNames.signupScreen);
                          },
                          width: MediaQuery.of(context).size.width * 0.38,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
