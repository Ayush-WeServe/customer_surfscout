import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class InputfieldWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hint;
  final IconData icon;
  final int? maxLength;
  final bool? enabled;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const InputfieldWidget(
      {super.key,
      this.onChanged,
      required this.hint,
      required this.icon,
      this.maxLength,
      this.keyboardType,
      this.controller,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingMD),
      child: TextField(
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLength: maxLength,
        onTapOutside: (value) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.tertiaryColor,
            prefixIcon: Icon(icon),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(AppSizes.radiusSM)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(AppSizes.radiusSM)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(AppSizes.radiusSM)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(AppSizes.radiusSM)),
            hintText: hint,
            hintStyle: TextStyle(fontSize: AppSizes.fontsLabelLarge)),
      ),
    );
  }
}
