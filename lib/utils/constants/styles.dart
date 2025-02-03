import 'package:customer_surfscout/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'sizes.dart';

class AppStyles {
  AppStyles._();

  static final TextStyle? headlineLarge = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: AppSizes.fontsHeadlineLarge,
      overflow: TextOverflow.ellipsis); // w900 (Black)
  static final TextStyle? headlineMedium = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: AppSizes.fontsHeadlineMedium,
      overflow: TextOverflow.ellipsis); // w800 (ExtraBold)
  static final TextStyle? headlineSmall = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppSizes.fontsHeadlineSmall,
      overflow: TextOverflow.ellipsis); // w700 (Bold)

  static final TextStyle? titleLarge = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: AppSizes.fontsTitleLarge,
      overflow: TextOverflow.ellipsis); // w700 (Bold)
  static final TextStyle? titleMedium = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: AppSizes.fontsTitleMedium,
      overflow: TextOverflow.ellipsis); // w600 (SemiBold)
  static final TextStyle? titleSmall = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: AppSizes.fontsTitleSmall,
      overflow: TextOverflow.ellipsis); // w500 (Medium)

  static final TextStyle? bodyLarge = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: AppSizes.fontsBodyLarge,
      overflow: TextOverflow.ellipsis); // w400 (Regular)
  static final TextStyle? bodyMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: AppSizes.fontsBodyMedium,
      overflow: TextOverflow.ellipsis); // w400 (Regular)
  static final TextStyle? bodySmall = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: AppSizes.fontsBodySmall,
      overflow: TextOverflow.ellipsis); // w300 (Light)

  static final TextStyle? labelLarge = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: AppSizes.fontsLabelLarge,
      overflow: TextOverflow.ellipsis); // w300 (Light)
  static final TextStyle? labelMedium = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: AppSizes.fontsLabelMedium,
      overflow: TextOverflow.ellipsis); // w200 (ExtraLight)
  static final TextStyle? labelSmall = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: AppSizes.fontsLabelSmall,
      overflow: TextOverflow.ellipsis); // w100 (Thin)

  static final TextStyle? onBoardingHeading = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: AppSizes.fontsBodyMedium,
      color: AppColors.primaryColor,
      overflow: TextOverflow.ellipsis);

  static final TextStyle? onBoardingSkip = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: AppSizes.fontsBodySmall,
      color: AppColors.primaryColor,
      overflow: TextOverflow.ellipsis);
}
