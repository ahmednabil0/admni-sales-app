import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCircular() {
  Get.defaultDialog(
      barrierDismissible: false,
      title: '',
      content: const LinearProgressIndicator());
}
