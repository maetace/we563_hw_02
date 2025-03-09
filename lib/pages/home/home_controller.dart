import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void onLogoutPressed() {
    // Get.defaultDialog(
    //     title: 'Confirm Log Out',
    //     middleText: 'Are you sure you want to log out?',
    //     textConfirm: 'Log Out',
    //     textCancel: 'Cancel',
    //     onCancel: () => Get.back(),
    //     onConfirm: () {
    //       Get.snackbar('Log Out Successful',
    //           'You\'ve been logged out. See you again soon, Demo User! 👀',
    //           colorText: Colors.white);
    //       Get.offAllNamed('/');
    //     });
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(32),
        color: Colors.white,
        child: Wrap(
          children: [
            Center(
              child: Text('Are you sure you want to log out?',
                  style: Theme.of(Get.context!).textTheme.titleMedium),
            ),
            SizedBox(height: 32),
            ListTile(
                leading: Icon(Icons.close),
                title: Text('No'),
                onTap: () {
                  Get.back();
                }),
            ListTile(
                leading: Icon(Icons.check),
                title: Text('Yes'),
                onTap: () {
                  Get.snackbar('Log Out Successful',
                      'You\'ve been logged out. See you again soon, Demo User! 👀',
                      colorText: Colors.white);
                  Get.offAllNamed('/');
                }),
          ],
        ),
      ),
    );
  }
}
