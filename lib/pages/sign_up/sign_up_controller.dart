import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();

  void onBackPressed() {
    Get.back();
  }

  void onSignUpPressed() {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }

    Get.snackbar(
        'Sign Up Successful', 'Welcome! We\'re excited to have you join us. 🎉',
        colorText: Colors.white);
    Get.offAllNamed('/home');
  }

  // Full Name Section
  final fullNameKey = GlobalKey<FormFieldState>();
  final fullNameController = TextEditingController();
  String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length > 250) {
      return 'Full name cannot exceed 250 characters';
    }
    return null;
  }

  void onFullNameChanged(String value) {
    fullNameKey.currentState?.validate();
  }

  // Email Section
  final emailKey = GlobalKey<FormFieldState>();
  final emailController = TextEditingController();
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return !regex.hasMatch(value) ? 'Enter a valid email address' : null;
  }

  void onEmailChanged(String value) {
    emailKey.currentState?.validate();
  }

  // Username Section
  final usernameKey = GlobalKey<FormFieldState>();
  final usernameController = TextEditingController();

  String? usernameValidator(String? value) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9]{3,100}$');

    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    if (!usernameRegex.hasMatch(value)) {
      return 'Username must be 3-100 characters long and contain only letters and numbers';
    }
    return null;
  }

  void onUsernameChanged(String value) {
    usernameKey.currentState?.validate();
  }

  // Password Section
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
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!passwordRegex.hasMatch(value)) {
      return 'Password must be include at least one letter, \none number, and one special character';
    }
    return null;
  }
}
