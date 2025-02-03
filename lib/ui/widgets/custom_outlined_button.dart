import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'text_widget.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double width;

  const CustomOutlinedButton(
      {super.key,
      required this.text,
      this.icon,
      this.width = double.infinity,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.buttonMD,
        width: width,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(AppSizes.radiusMD),
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: icon != null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: AppSizes.spacingSM),
                    child: Icon(
                      icon,
                      color: AppColors.scaffoldColor,
                    ),
                  ),
                ),
                TextWidget(
                  text: text,
                  style: TextStyle(
                      fontSize: AppSizes.fontsBodyLarge,
                      color: AppColors.primaryColor),
                ),
              ],
            )));
  }
}
