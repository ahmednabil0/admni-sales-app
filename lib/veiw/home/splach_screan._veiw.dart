import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../auth/create_company_veiw.dart';
import '../helper/consts/colors.dart';
import 'home_veiw.dart';

class SplashScraenVeiw extends StatelessWidget {
  const SplashScraenVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          backgroundColor: AppColors.seconrayColor,
          splashIconSize: 2000,
          splash: Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: Get.height * 0.5,
              width: Get.width * 1,
              fit: BoxFit.cover,
            ),
          ),
          nextScreen: choosePage()),
    );
  }

  // first route
  // start
  Widget choosePage() {
    if (sharedpref!.getInt('id') != null &&
        sharedpref!.getString('company') != null) {
      return const HomePageVeiw();
    } else {
      return CreateCompanyVeiw();
    }
    // end
  }
}
