import 'package:admin_new_app/veiw/home/home_veiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/consts/colors.dart';
import 'custom_text.dart';

Row buildAppBar({
  required String txt,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
          size: Get.width * 0.08,
        ),
      ),
      AppText(
        txt: txt,
        size: Get.width * 0.05,
        fw: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      IconButton(
          onPressed: () {
            Get.off(() => const HomePageVeiw());
          },
          icon: Icon(
            Icons.home_rounded,
            color: AppColors.primaryColor,
            size: Get.width * 0.08,
          )),
    ],
  );
}
