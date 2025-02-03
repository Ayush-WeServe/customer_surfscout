import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final bool authScreen;

  const OnboardingWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.authScreen = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            // B A C K G R O U N D    I M A G E
            Image.asset(
              image,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
            ),
          ],
        ),
      ],
    );
  }
}
