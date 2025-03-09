import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();
  final usernameKey = GlobalKey<FormFieldState>();
  final usernameController = TextEditingController();

  void onBackPressed() {
    Get.back();
  }

  void onSignUpPressed() {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }

    if (usernameController.text != '@demo') {
      Get.snackbar(
        'SignUp Failed',
        'The username you entered does not exist. Please check and try again.',
        colorText: Colors.white,
      );
      return;
    }
    if (passwordController.text != 'Passwd12@') {
      Get.snackbar(
        'SignUp Failed',
        'Incorrect username or password. Please try again.',
        colorText: Colors.white,
      );
      return;
    }

    Get.snackbar('Sign Up Successful',
        'Great to see you again, Demo User! Let\'s continue where you left off. 👋',
        colorText: Colors.white);
    Get.offAllNamed('/home');
  }

  String? usernameVlaidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }

    if (value.length < 5) {
      return 'Username must be at least 5 characters long';
    }

    if (!value.startsWith('@')) {
      return 'Username must start with @';
    }

    return null;
  }

  void onUsernameChanged(String value) {
    usernameKey.currentState?.validate();
  }

  final passwordKey = GlobalKey<FormFieldState>();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void onPasswordChanged(String value) {
    passwordKey.currentState?.validate();
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return 'Password must contain at least one letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }
}

//   void onBackPressed() {
//     Get.back();
//   }

//   void onSignUpPressed() {
//     Get.snackbar('Sign Up Successful',
//         'Welcome aboard, Demo User! Enjoy your journey with us. 🚀',
//         colorText: Colors.white);
//     Get.offAllNamed('/home');
//   }
// }
