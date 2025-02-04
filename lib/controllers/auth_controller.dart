import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:customer_surfscout/utils/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user_model.dart';
import '../ui/widgets/snackbar_widget.dart';
import '../utils/constants/exceptions.dart';
import '../utils/constants/keys.dart';
import '../utils/constants/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  final TextEditingController otpController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  RxBool isOTPSent = false.obs;
  RxString phoneNumber = ''.obs;
  RxBool isLoading = false.obs;
  String verificationId = '';
  RxString imagePath = ''.obs;

  //  V A L I D    N U M B E R
  bool isOnlyNumbers(String input) {
    final regex = RegExp(r'^\d+$');
    return regex.hasMatch(input);
  }

  //  C H E C K    V A L I D    E M A I L
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return emailRegExp.hasMatch(email);
  }

  Future<void> signUP() async {
    final email = emailController.text.trim();
    final name = nameController.text.trim();
    final phone = phoneNumberController.text.trim();
    String profile = imagePath.value;

    if (name.isEmpty) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.nameEmpty,
          context: Get.context!);
      return;
    }
    if (name.length < 3) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.validName,
          context: Get.context!);
      return;
    }
    if (email.isEmpty) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.emailEmpty,
          context: Get.context!);
      return;
    }
    if (!isValidEmail(email)) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.validEmail,
          context: Get.context!);
      return;
    }
    if (phone.isEmpty) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.phoneNumberEmpty,
          context: Get.context!);
      return;
    }
    if (phone.length < 10) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.validPhoneNumber,
          context: Get.context!);
      return;
    }
    if (isOnlyNumbers(phone) == false) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.validPhoneNumber,
          context: Get.context!);
      return;
    }

    if (profile.isNotEmpty) {
      try {
        final cloudinary = CloudinaryPublic('dt73y1ihf', 'ml_default');
        final response = await cloudinary.uploadFile(CloudinaryFile.fromFile(
          profile,
          resourceType: CloudinaryResourceType.Auto,
          folder: FirebaseAuth.instance.currentUser?.uid,
        ));
        profile = response.secureUrl;
        print('profile' + profile);
      } on PlatformException catch (e) {
        print('Error has occured =============$e');
        SnackbarWidget().show(
            title: AppStrings.error,
            message: AppPlatformExceptions(e.code).message,
            context: Get.context!);
      } catch (e) {
        print('Error has occured in this =============$e');
        SnackbarWidget().show(
            title: AppStrings.error,
            message: AppStrings.somethingWrong.tr,
            context: Get.context!);
      }
    } else {
      profile =
          'https://res.cloudinary.com/dt73y1ihf/image/upload/v1736417289/user_profile_image_qybfnz.png';
    }

    // S T O R E   D E T A I L S   I N   F I R E B A S E
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        SnackbarWidget().show(
            title: AppStrings.error,
            message: AppStrings.userNotLoggedIn,
            context: Get.context!);
        return;
      }
      await FirebaseFirestore.instance
          .collection(Appkeys.user)
          .doc(user.uid)
          .set(UserModel(name, phone, email, profile).toJson());
      await sendOTP();
    } on FirebaseException catch (e) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppFirebaseExceptions(e.code).message,
          context: Get.context!);
    } on PlatformException catch (e) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppPlatformExceptions(e.code).message,
          context: Get.context!);
    } catch (e) {
      print(e);
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.somethingWrong,
          context: Get.context!);
    }
  }

  Future<void> getOTP() async {
    final phoneNumber = phoneNumberController.text.trim();
    if (phoneNumber.isEmpty) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.phoneNumberEmpty,
          context: Get.context!);
      return;
    }
    if (phoneNumber.length < 10) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.validPhoneNumber,
          context: Get.context!);
      return;
    }
    if (isOnlyNumbers(phoneNumber) == false) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.validPhoneNumber,
          context: Get.context!);
      return;
    }
    sendOTP();
  }

  Future<void> sendOTP() async {
    final String countryCode = '+91';
    final phoneNumber = phoneNumberController.text.trim();
    final String completePhoneNumber = '$countryCode$phoneNumber';
    isLoading.value = true;

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: completePhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          SnackbarWidget().show(
              title: AppStrings.success,
              message: AppStrings.verified,
              context: Get.context!);
        },
        verificationFailed: (FirebaseAuthException e) {
          isLoading.value = false;
          SnackbarWidget().show(
              title: AppStrings.error,
              message: e.message ?? AppStrings.notVerified,
              context: Get.context!);
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          isOTPSent.value = true;
          isLoading.value = false;
          SnackbarWidget().show(
              title: AppStrings.codeSent,
              message: AppStrings.otpMsg,
              context: Get.context!);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
    } on FirebaseException catch (e) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppFirebaseExceptions(e.code).message,
          context: Get.context!);
    } on PlatformException catch (e) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppPlatformExceptions(e.code).message,
          context: Get.context!);
    } catch (e) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.somethingWrong,
          context: Get.context!);
    }
  }

  Future<void> verifyOTP() async {
    final String countryCode = '+91';
    final String completePhoneNumber = '$countryCode$phoneNumber';
    final otp = otpController.text.trim();
    if (otp.isEmpty) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.enterOTP,
          context: Get.context!);
      return;
    }
    if (isOnlyNumbers(otp) == false) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.isEmpty,
          context: Get.context!);
      return;
    }
    if (otp.length < 6) {
      SnackbarWidget().show(
          title: AppStrings.error,
          message: AppStrings.shortOtp,
          context: Get.context!);
      return;
    }
    isLoading.value = true;
    User? user = FirebaseAuth.instance.currentUser;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await FirebaseAuth.instance.signInWithCredential(credential);

      final doc = await FirebaseFirestore.instance
          .collection(Appkeys.user)
          .doc(user?.uid)
          .get();
      if (!doc.exists) {
        Get.toNamed(AppRouteNames.signupScreen, arguments: completePhoneNumber);
        return;
      } else {
        Get.offAllNamed(AppRouteNames.home);
      }
    } on FirebaseException catch (e) {
      SnackbarWidget().show(
          title: AppStrings.error.tr,
          message: AppFirebaseExceptions(e.code).message,
          context: Get.context!);
    } on PlatformException catch (e) {
      SnackbarWidget().show(
          title: AppStrings.error.tr,
          message: AppPlatformExceptions(e.code).message,
          context: Get.context!);
    } catch (e) {
      SnackbarWidget().show(
          title: AppStrings.error.tr,
          message: AppStrings.somethingWrong.tr,
          context: Get.context!);
    } finally {
      isLoading.value = false;
    }
  }

  //     I M A G E     P I C K E R
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setImagePath(pickedFile.path);
    }
  }

  //   S E T   I M A G E    P A T H
  void setImagePath(String path) {
    imagePath.value = path;
  }

  Future<void> showImageSourceDialog() async {
    await showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text(
          AppStrings.imgSource,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text(
                AppStrings.camera,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              onTap: () {
                Navigator.of(context).pop();
                pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(
                AppStrings.galary,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                Navigator.of(context).pop();
                pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
