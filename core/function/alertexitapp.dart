import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alerExitApp() {
  Get.defaultDialog(
      title: "Warning".tr,
      middleText: "Do You Want To Close The App".tr,
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("Confirm".tr)),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel".tr)),
      ]);
  return Future.value(true);
}
