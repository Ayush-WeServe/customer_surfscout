import 'package:customer_surfscout/bindings/auth_binding.dart';
import 'package:customer_surfscout/ui/screens/login_screen.dart';
import 'package:customer_surfscout/ui/screens/onboarding_screen.dart';
import 'package:customer_surfscout/ui/screens/sign_up_screen.dart';
import 'package:get/get.dart';
import '../../ui/screens/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: AppRouteNames.home, page: () => HomeScreen()),
    GetPage(name: AppRouteNames.onBoarding, page: () => OnboardingScreen()),
    GetPage(
      name: AppRouteNames.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRouteNames.signupScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class AppRouteNames {
  AppRouteNames._();

  static const String home = '/home';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signup_Screen';
  static const String onBoarding = '/onBoarding_srceen';
}
