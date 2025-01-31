import 'dart:io';
import 'package:customer_surfscout/controllers/auth_controller.dart';
import 'package:customer_surfscout/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/strings.dart';
import '../../utils/constants/styles.dart';
import '../widgets/custom_elevated_button_widget.dart';
import '../widgets/inputField_widget.dart';
import '../widgets/text_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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

                // S E L E C T   I M  A G E   C O N  T A I N E R
                Column(
                  spacing: AppSizes.spacingXS,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: controller.showImageSourceDialog,
                        child: Container(
                          height: AppSizes.imageSM,
                          width: AppSizes.imageSM,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.borderColor),
                            image: controller.imagePath.value.isNotEmpty
                                ? DecorationImage(
                                    image: FileImage(
                                        File(controller.imagePath.value)),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: controller.imagePath.value.isEmpty
                              ? Center(
                                  child: Icon(
                                    Bootstrap.camera,
                                    size: AppSizes.iconSM,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    Text(
                      AppStrings.setProfile,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),

                // U S E R   D E T A I L S    F I E L d S
                Column(
                  spacing: AppSizes.spacingXS,
                  children: [
                    InputfieldWidget(
                      hint: AppStrings.enterName,
                      icon: Clarity.user_line,
                      controller: controller.nameController,
                    ),
                    InputfieldWidget(
                      hint: AppStrings.enterMail,
                      icon: Clarity.email_line,
                      controller: controller.emailController,
                    ),
                    InputfieldWidget(
                      hint: AppStrings.enterPhoneNo,
                      maxLength: 10,
                      icon: Clarity.phone_handset_line,
                      keyboardType: TextInputType.number,
                      controller: controller.phoneNumberController,
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

                // N O T E   A N D    R E S E N D    O T P    B U T T O N
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
                              ),
                            ),
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
                              : controller.signUP();
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
