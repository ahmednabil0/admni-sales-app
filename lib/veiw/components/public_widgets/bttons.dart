import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/consts/colors.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.9,
        height: Get.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.02,
          ),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor.withOpacity(0.85),
            AppColors.primaryColor.withOpacity(0.58)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.05,
          fw: FontWeight.w700,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton4 extends StatelessWidget {
  CustomButton4({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.85,
        height: Get.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.02,
          ),
          gradient: LinearGradient(
              colors: [Colors.grey.shade600, Colors.grey.shade400],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.055,
          fw: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton2 extends StatelessWidget {
  CustomButton2({
    required this.color,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.width * 0.22,
      height: Get.width * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.02,
          ),
          color: color),
      child: AppText(
        txt: txt,
        size: Get.width * 0.05,
        fw: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton3 extends StatelessWidget {
  CustomButton3({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.5,
        height: Get.width * 0.135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.09,
          ),
          gradient: LinearGradient(colors: [
            Colors.white,
            Colors.white54.withOpacity(0.8),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.046,
          fw: FontWeight.w800,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton5 extends StatelessWidget {
  CustomButton5({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.15,
        height: Get.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Get.width * 0.02,
          ),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor.withOpacity(0.35),
            AppColors.primaryColor.withOpacity(0.28)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.035,
          fw: FontWeight.w700,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton6 extends StatelessWidget {
  CustomButton6({
    required this.icon,
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          width: Get.width * 0.6,
          height: Get.width * 0.112,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Get.width * 0.02,
              ),
              color: AppColors.backgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText(
                  txt: txt,
                  size: Get.width * 0.045,
                  fw: FontWeight.bold,
                  color: AppColors.seconrayColor),
              Icon(
                icon,
                color: Colors.green,
              ),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class CustomButtonIcon extends StatelessWidget {
  CustomButtonIcon({
    required this.icon,
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          width: Get.width * 0.2,
          height: Get.width * 0.112,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Get.width * 0.02,
              ),
              color: AppColors.backgroundColor),
          child: Icon(
            icon,
            color: Colors.green,
          )),
    );
  }
}

// ignore: must_be_immutable
class CustomButtonIcon2 extends StatelessWidget {
  CustomButtonIcon2({
    required this.icon,
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          width: Get.width * 0.1,
          height: Get.width * 0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Get.width * 0.01,
              ),
              color: AppColors.backgroundColor),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
          )),
    );
  }
}

// ignore: must_be_immutable
class CustomButton16 extends StatelessWidget {
  CustomButton16({
    required this.icon,
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          width: Get.width * 0.25,
          height: Get.width * 0.113,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Get.width * 0.02,
            ),
            gradient: const LinearGradient(colors: [
              AppColors.primaryColor,
              AppColors.primaryColor,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
          )),
    );
  }
}

// ignore: must_be_immutable
class CustomButton7 extends StatelessWidget {
  CustomButton7({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.912,
        height: Get.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Get.width * 0.07),
            bottomRight: Radius.circular(Get.width * 0.07),
          ),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor,
            AppColors.seconrayColor.withOpacity(0.5)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.05,
          fw: FontWeight.bold,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton8 extends StatelessWidget {
  CustomButton8({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.16,
        height: Get.width * 0.09,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.78)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.04,
          fw: FontWeight.w900,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton9 extends StatelessWidget {
  CustomButton9({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.9,
        height: Get.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Get.width * 0.05),
            bottomRight: Radius.circular(Get.width * 0.05),
          ),
          gradient: LinearGradient(colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.78)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.05,
          fw: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton22 extends StatelessWidget {
  CustomButton22({
    required this.ontap,
    required this.txt,
    Key? key,
  }) : super(key: key);
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width * 0.9,
        height: Get.width * 0.1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red, Colors.red.withOpacity(0.5)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: AppText(
          txt: txt,
          size: Get.width * 0.05,
          fw: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
