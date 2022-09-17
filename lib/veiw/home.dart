import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/public_widgets/custom_text.dart';
import 'helper/consts/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Get.width * -0.19,
            top: Get.width * -0.7,
            child: ClipOval(
              child: Container(
                height: Get.width * 1.29,
                width: Get.width * 2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryColor, Colors.orange],
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: const SizedBox()),
              ),
            ),
          ),
          Positioned(
              top: Get.width * 0.71,
              left: Get.width * 0.15,
              child: AppText(
                txt: 'احمد نبيل صبحي',
                size: Get.width * 0.09,
                fw: FontWeight.w900,
                color: AppColors.fontColor,
              )),
          Positioned(
            top: Get.width * 1.1,
            left: Get.width * 0.08,
            child: DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(color: Colors.yellow.withOpacity(0.4)),
              child: Text(
                  '.....................................Some text     ..................................'),
            ),
          )
        ],
      ),
    );
  }
}
