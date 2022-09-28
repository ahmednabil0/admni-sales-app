import 'dart:io';

import 'package:admin_new_app/veiw/components/public_widgets/app_bar.dart';
import 'package:admin_new_app/veiw/components/public_widgets/back_ground.dart';
import 'package:admin_new_app/veiw/components/public_widgets/bttons.dart';
import 'package:admin_new_app/veiw/components/public_widgets/custom_text.dart';
import 'package:admin_new_app/veiw/components/public_widgets/spaces.dart';
import 'package:admin_new_app/veiw/helper/consts/colors.dart';
import 'package:admin_new_app/veiw/home/home_veiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class EmpDataVeiw extends StatelessWidget {
  EmpDataVeiw(
      {required this.number,
      required this.user,
      required this.pass,
      super.key});
  TextEditingController userCont = TextEditingController();
  String user;
  String pass;
  String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
          child: SafeArea(
        child: Column(
          children: [
            buildAppBar(txt: '89'.tr),
            buildHeightSpace(0.4),
            Container(
              height: Get.width * 0.7,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.centerLeft,
                  begin: Alignment.bottomRight,
                  colors: [AppColors.primaryColor, AppColors.seconrayColor],
                ),
                borderRadius: BorderRadius.circular(Get.width * 0.055),
              ),
              child: Column(
                children: [
                  buildHeightSpace(0.2),
                  Container(
                    height: Get.width * 0.1,
                    width: Get.width * 0.6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: AppColors.fontColor),
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                    child: AppText(
                      txt: user,
                      size: Get.width * 0.045,
                      fw: FontWeight.bold,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  buildHeightSpace(0.02),
                  Container(
                    height: Get.width * 0.1,
                    width: Get.width * 0.6,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: AppColors.fontColor),
                      borderRadius: BorderRadius.circular(Get.width * 0.02),
                    ),
                    child: AppText(
                      txt: pass,
                      size: Get.width * 0.045,
                      fw: FontWeight.bold,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  buildHeightSpace(0.04),
                  CustomButton6(
                    icon: Icons.whatsapp_rounded,
                    ontap: () async {
                      await openwhatsapp(context);
                      Get.off(() => const HomePageVeiw());
                    },
                    txt: 'send to whats App',
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  openwhatsapp(context) async {
    var whatsapp = number;
    var whatsappurlAndroid = "whatsapp://send?phone=$whatsapp&text=$user:$pass";
    var whatappurlIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrlString(whatappurlIos)) {
        await launchUrlString(
          whatappurlIos,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColors.seconrayColor,
            content: const Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrlString(whatsappurlAndroid)) {
        await launchUrlString(whatsappurlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp no installed")));
      }
    }
  }
}
