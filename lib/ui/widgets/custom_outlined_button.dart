import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import 'text_widget.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;

  const CustomOutlinedButton(
      {super.key,
      required this.text,
      this.width = double.infinity,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSizes.buttonMD,
        width: width,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1, color: AppColors.primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusMD),
            ),
          ),
          onPressed: onPressed,
          child: TextWidget(
            text: text,
            style: TextStyle(
                fontSize: AppSizes.fontsBodyLarge,
                color: AppColors.primaryColor),
          ),
        ));
  }
}
