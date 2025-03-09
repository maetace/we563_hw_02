import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_up_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        key: controller.signUpFormKey,
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
            children: [
              Image.asset(
                'assets/images/twitter_logo.png',
                width: 48,
                height: 48,
                color: Colors.white,
              ),
              // Full Name TextFormField
              TextFormField(
                key: controller.fullNameKey,
                validator: controller.fullNameValidator,
                controller: controller.fullNameController,
                onChanged: controller.onFullNameChanged,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              // Email TextFormField
              TextFormField(
                key: controller.emailKey,
                validator: controller.emailValidator,
                controller: controller.emailController,
                onChanged: controller.onEmailChanged,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              // Username TextFormField
              TextFormField(
                key: controller.usernameKey,
                validator: controller.usernameValidator,
                controller: controller.usernameController,
                onChanged: controller.onUsernameChanged,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              // Password TextFormField + Visibility Toggle
              Obx(() => TextFormField(
                    key: controller.passwordKey,
                    validator: controller.passwordValidator,
                    onChanged: controller.onPasswordChanged,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: !controller.isPasswordVisible.value,
                  )),
              // SizedBox(
              //   height: 24,
              // ),
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  // Sign Up Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.onSignUpPressed,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        elevation: 0,
                        side: BorderSide(color: Colors.blue.shade200),
                      ),
                      child: Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: controller.onBackPressed, icon: Icon(Icons.arrow_back)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
