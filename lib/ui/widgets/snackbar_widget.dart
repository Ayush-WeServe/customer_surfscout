import 'package:customer_surfscout/ui/widgets/text_widget.dart';
import 'package:customer_surfscout/utils/constants/colors.dart';
import 'package:customer_surfscout/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/sizes.dart';

class SnackbarWidget {
  void show(
      {required String title,
      required String message,
      required BuildContext context}) {
    Get.snackbar(title, message,
        titleText: TextWidget(text: title, style: AppStyles.bodyMedium),
        messageText: TextWidget(
          text: message,
          style: AppStyles.bodySmall,
          maxLine: 3,
        ),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
            vertical: AppSizes.paddingMD, horizontal: AppSizes.paddingLG),
        backgroundColor: AppColors.tertiaryColor,
        borderWidth: 1,
        borderColor: AppColors.borderColor);
  }
}
