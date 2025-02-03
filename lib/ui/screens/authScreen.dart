import 'package:customer_surfscout/ui/widgets/custom_elevated_button_widget.dart';
import 'package:customer_surfscout/ui/widgets/custom_outlined_button.dart';
import 'package:customer_surfscout/utils/constants/colors.dart';
import 'package:customer_surfscout/utils/constants/images.dart';
import 'package:customer_surfscout/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/strings.dart';
import '../../utils/constants/styles.dart';
import '../widgets/text_widget.dart';

class Authscreen extends StatelessWidget {
  const Authscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Image.asset(
              AppImages.welcomePage,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: AppColors.tertiaryColor.withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingXL),
              child: Column(
                spacing: AppSizes.spacingXS,
                children: [
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
                        ),
                        TextWidget(
                          text: AppStrings.onBoarding4Text,
                          style: AppStyles.labelSmall,
                          softwrap: true,
                          maxLine: 4,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    spacing: AppSizes.spacingSM,
                    children: [
                      CustomOutlinedButton(
                        text: AppStrings.signIn,
                        onPressed: () {},
                        width: MediaQuery.of(context).size.width * 0.38,
                      ),
                      CustomElevatedButton(
                        text: AppStrings.signUp,
                        onPressed: () {},
                        width: MediaQuery.of(context).size.width * 0.38,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
