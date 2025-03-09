import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'log_in_controller.dart';

class LogInPage extends GetView<LogInController> {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        key: controller.logInFormKey,
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
              TextFormField(
                key: controller.usernameKey,
                validator: controller.usernameVlaidator,
                onChanged: controller.onUsernameChanged,
                controller: controller.usernameController,
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
                    obscureText: !controller
                        .isPasswordVisible.value, // ควบคุมการแสดงรหัสผ่าน
                  )),
              // SizedBox(
              //   height: 24,
              // ),
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.onLogInPressed,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        elevation: 0,
                        side: BorderSide(color: Colors.blue.shade200),
                      ),
                      child: Text('Log In'),
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
