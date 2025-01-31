import 'package:customer_surfscout/controllers/auth_controller.dart';
import 'package:customer_surfscout/ui/widgets/custom_elevated_button_widget.dart';
import 'package:customer_surfscout/ui/widgets/inputField_widget.dart';
import 'package:customer_surfscout/ui/widgets/text_widget.dart';
import 'package:customer_surfscout/utils/constants/images.dart';
import 'package:customer_surfscout/utils/constants/sizes.dart';
import 'package:customer_surfscout/utils/constants/strings.dart';
import 'package:customer_surfscout/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthController.instance;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingSM, vertical: AppSizes.paddingLG),
            child: Column(
              spacing: AppSizes.spacingMD,
              children: [
                // W E L C O M E    M E S S A G E S
                Column(
                  children: [
                    TextWidget(
                      text: AppStrings.welcome,
                      style: AppStyles.bodyLarge,
                    ),
                    TextWidget(
                      text: AppStrings.enterDetails,
                      style: AppStyles.bodySmall,
                    )
                  ],
                ),

                // A P P   L O G O
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Image.asset(
                    AppImages.logo,
                    fit: BoxFit.cover,
                  ),
                ),

                // T E X T F I E L D S
                Column(
                  spacing: AppSizes.spacingXS,
                  children: [
                    // P H O N E N U M B E R   F I E L D
                    InputfieldWidget(
                      hint: AppStrings.enterPhoneNo,
                      maxLength: 10,
                      icon: Clarity.phone_handset_line,
                      keyboardType: TextInputType.number,
                      controller: controller.phoneNumberController,
                      onChanged: (phone) {
                        if (controller.isOTPSent.value) {
                          controller.isOTPSent.value = false;
                        }
                        controller.phoneNumber.value = phone;
                      },
                    ),
                    Obx(
                      // O P T   F I E L d
                      () => InputfieldWidget(
                        controller: controller.otpController,
                        enabled: controller.isOTPSent.value,
                        hint: AppStrings.enterOTP,
                        icon: Clarity.lock_line,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                      ),
                    )
                  ],
                ),

                // O T P   N O T E
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spacingXS),
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: !controller.isOTPSent.value,
                          child: TextWidget(
                            text: AppStrings.otpMessage,
                            textAlign: TextAlign.center,
                            maxLine: 3,
                            softwrap: true,
                            style: AppStyles.labelSmall,
                          ),
                        ),
                        Column(
                          spacing: AppSizes.spacingXS,
                          children: [
                            Visibility(
                              visible: controller.isOTPSent.value,
                              child: TextWidget(
                                text: AppStrings.notReceiveOtp,
                                textAlign: TextAlign.center,
                                maxLine: 3,
                                softwrap: true,
                                style: AppStyles.labelSmall,
                              ),
                            ),
                            // R E S E N D   O T P
                            Visibility(
                                visible: controller.isOTPSent.value,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    onPressed: () {
                                      controller.isOTPSent;
                                    },
                                    child: TextWidget(
                                      text: AppStrings.resendOTPButton,
                                      textAlign: TextAlign.right,
                                      style: AppStyles.labelSmall,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // G E T   O T P   &   V E R I F Y   O T P   B U T T O N
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.spacingXS),
                  child: Obx(() => CustomElevatedButton(
                        text: controller.isOTPSent.value
                            ? AppStrings.verifyOTPButton
                            : AppStrings.getOTPButton,
                        onPressed: () {
                          controller.isOTPSent.value
                              ? controller.verifyOTP()
                              : controller.getOTP();
                        },
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
