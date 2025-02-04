class AppStrings {
  AppStrings._();

  static const String homeScreen = 'HomeScreen';

  // C O M M O N   S T R I N G S
  static const String welcome = 'Welcome!';

  // B U T T O N    S T R I N G S
  static const String getOTPButton = 'Get OTP';
  static const String verifyOTPButton = 'Verify OTP';
  static const String resendOTPButton = 'resend OTP';
  static const String nextBtn = 'Next';
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String skipBtn = 'SKIP';
  static const String backBtn = 'back';

  // I N P U T F I E L D    H I N T S
  static const String enterDetails = 'Please enter your details';
  static const String enterPhoneNo = 'Enter your phone number';
  static const String enterName = 'Enter your Full Name';
  static const String enterMail = 'Enter your email address';
  static const String enterOTP = 'Enter your 6 digit OTP';

  // C U S T O M    M E S S A G E S
  static const String otpMessage =
      'Please make sure your phone number is correct. We will send you a one time pasword (OTP) to your phone number.';
  static const String notReceiveOtp =
      'Please make sure you have entered your phone number Correctly';
  static const String success = "Success";
  static const String verified = "Verification Failed";
  static const String notVerified = "Verification Failed";
  static const String codeSent = "Code Sent";
  static const String otpMsg = "OTP has been sent to you";
  static const String phoneVerified = "Your Phone Number Is Verified";
  static const String correctOtp = "Please Enter a correct OTP.";
  static const String validPinCode = 'Please Enter A Valid Pin Code.';

  static const String camera = "Camera";
  static const String galary = "Galary";
  static const String imgSource = "Choose Image Source";
  static const String setProfile = "Tap To Set Profile";
  static const String personal = "Personal";
  static const String address = "Address";

  static const String onBoarding1Heading = "Effortless Ride Sharing";
  static const String onBoarding2Heading = "Smart Ride Management";
  static const String onBoarding3Heading = "More Than Just Rides";
  static const String onBoarding4Heading = "Ready to Ride?";
  static const String onBoarding1Text =
      "Save on costs, reduce traffic, and travel efficiently. with simple ride requests, getting where you need to go has never been earlier.";
  static const String onBoarding2Text =
      "Request, accept or manage rides easily. Track your journey in real time and get instant updates on your ride's status.";
  static const String onBoarding3Text =
      "Carpool, deliver parcels, request towing. rent vehicles and much more! plus, multi-stop errands and round trips are now a breeze";
  static const String onBoarding4Text =
      "Sign in or create your account to begin your journey. join our community and start sharing or requesting rides with just a few taps.";

  // E R R O R    M E S S A G E S
  static const String error = "Error";
  static const String nameEmpty = "Please Enter Your Name";
  static const String validName = "Name Should Be Minimum 3 Characters Long";
  static const String phoneNumberEmpty = 'Phone number can not be empty';
  static const String isEmpty = "One Time Password(otp) can not be empty";
  static const String emailEmpty = "Please Enter Your Email";
  static const String validEmail = "Please Enter A Valid Email";
  static const String validOtp =
      "Please Enter a valid otp. Only digits are allowed";
  static final String shortOtp =
      'Please enter a 6 digit OTP. anything short will not be valid';
  static const String validPhoneNumber = "Please Enter a valid Phone Number.";
  static const String somethingWrong = "Something Went Wrong";
  static const String userNotLoggedIn = "user not logged in";

  // F I R E B A S E    E X C E P T I O N S   M E S S A G E S
  static const String invalidLoginCredentials =
      'Invalid login credentials. Please double-check your information.';
  static const String tooManyRequest =
      'Too many requests. Please try again later.';
  static const String invalidArgument =
      'Invalid argument provided to the authentication method.';
  static const String invalidPassword = 'Incorrect password. Please try again.';
  static const String sessionCookieExpired =
      'The Firebase session cookie has expired. Please sign in again.';
  static const String uidAlreadyExists =
      'The provided user ID is already in use by another user.';
  static const String signInFailed = 'Sign-in failed. Please try again.';
  static const String networkRequestFailed =
      'Network request failed. Please check your internet connection.';
  static const String internalError = 'Internal error. Please try again later.';
  static const String quotaExceeded = 'Quota exceeded. Please try again later.';
  static const String unexpectedError =
      'An unexpected platform error occurred. Please try again.';
  static const String invalidEmail = 'The email address is not valid.';
  static const String userNotFound = 'No user found with this email address.';
  static const String wrongPassword = 'Incorrect password. Please try again.';
  static const String emailAlreadInUse =
      'This email address is already in use by another account.';
  static const String invalidCredentials =
      'The provided credential is invalid or has expired.';
  static const String requiresRecentLogin =
      'You need to log in again to perform this action.';
  static const String invalidActionCode =
      'The action code is invalid or has expired.';
  static const String credentialAlreadyInUse =
      'This credential is already associated with a different user account.';
  static const String invalidRecipientEmail = 'The recipient email is invalid.';
}
