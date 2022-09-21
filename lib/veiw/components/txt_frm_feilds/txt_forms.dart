import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../helper/consts/colors.dart';
import '../public_widgets/custom_text.dart';

class TxtFrmFeild {
  static SizedBox buildUserTxtForm(
      {required TextEditingController controller}) {
    return SizedBox(
      width: Get.width * 0.9,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: '2'.tr,
            hintStyle: TextStyle(
              fontSize: Get.width * 0.04,
              fontWeight: FontWeight.w700,
            ),
            prefixIcon: const Icon(Icons.person),
            prefixIconColor: AppColors.backgroundColor),
      ),
    );
  }

  static SizedBox buildCompanyNameTxtForm(
      {required TextEditingController controller,
      required String hint,
      required IconData icon}) {
    return SizedBox(
      width: Get.width * 0.9,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }
          return null;
        },
        decoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: Get.width * 0.03,
              fontWeight: FontWeight.w500,
              color: AppColors.fontColor,
              fontFamily: 'Cairo',
            ),
            fillColor: AppColors.backgroundColor.withOpacity(0.7),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: Get.width * 0.04,
              fontWeight: FontWeight.w700,
              color: AppColors.fontColor.withOpacity(0.5),
            ),
            prefixIcon: Icon(icon),
            prefixIconColor: AppColors.backgroundColor),
      ),
    );
  }

  static SizedBox buildQuntityTxtForm(
      {required TextEditingController controller}) {
    return SizedBox(
      width: Get.width * 0.6,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        readOnly: true,
        onChanged: (value) {
          controller.text = value;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          hintText: 'image url',
          hintStyle: TextStyle(
            fontSize: Get.width * 0.04,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  static SizedBox buildDeliveryTxtForm(
      {required TextEditingController controller}) {
    return SizedBox(
      width: Get.width * 0.35,
      child: Column(
        children: [
          AppText(
            txt: '29'.tr,
            size: Get.width * 0.04,
            fw: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: Get.width * 0.3,
            height: Get.width * 0.08,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
              ],
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                hintText: '30'.tr,
                hintStyle: TextStyle(
                  fontSize: Get.width * 0.04,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static SizedBox buildQVatTxtForm(
      {required TextEditingController controller}) {
    return SizedBox(
      width: Get.width * 0.35,
      child: Column(
        children: [
          AppText(
            txt: '31'.tr,
            size: Get.width * 0.04,
            fw: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: Get.width * 0.3,
            height: Get.width * 0.08,
            child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(
                    r'(^\d*\.?\d*)',
                  ),
                )
              ],
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                hintText: '30'.tr,
                hintStyle: TextStyle(
                  fontSize: Get.width * 0.04,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static SizedBox buildRentTxtForm(
      {required TextEditingController controller}) {
    return SizedBox(
      width: Get.width * 0.35,
      child: SizedBox(
        width: Get.width * 0.3,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'required*';
            }
            return null;
          },
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            hintText: '30'.tr,
            hintStyle: TextStyle(
              fontSize: Get.width * 0.04,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  static SizedBox buildpasswordTxtForm(
      {required TextEditingController controller,
      required bool obs,
      required void Function()? onPressed}) {
    return SizedBox(
      width: Get.width * 0.9,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }
          return null;
        },
        obscureText: obs,
        decoration: InputDecoration(
          hintText: '3'.tr,
          hintStyle: TextStyle(
            fontSize: Get.width * 0.04,
            fontWeight: FontWeight.w700,
          ),
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: obs == false
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.remove_red_eye)),
          prefixIcon: const Icon(Icons.lock_outline_rounded),
          suffixIconColor: AppColors.backgroundColor,
          prefixIconColor: AppColors.backgroundColor,
        ),
      ),
    );
  }

  static SizedBox buildDateTxtForm(
      {required TextEditingController controller}) {
    return SizedBox(
      width: Get.width * 0.9,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }
          return null;
        },
        readOnly: true,
        style: const TextStyle(
            color: AppColors.primaryColor, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: '39'.tr,
          hintStyle: TextStyle(
            fontSize: Get.width * 0.04,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor.withOpacity(0.5),
          ),
          prefixIcon: const Icon(
            Icons.date_range_outlined,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
