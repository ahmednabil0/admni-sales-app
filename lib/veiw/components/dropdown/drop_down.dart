import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/employee/create_user_veiw_model.dart';
import '../../helper/consts/colors.dart';
import '../public_widgets/custom_text.dart';

SizedBox buildDrobDownBranshes2({required CreateUserVeiwModel controller}) {
  return SizedBox(
    width: Get.width * 0.75,
    child: DropdownSearch<String>(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }

          return null;
        },
        clearButtonProps: const ClearButtonProps(
            color: AppColors.primaryColor,
            isVisible: true,
            icon: Icon(Icons.clear_rounded)),
        popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
              child: AppText(
                txt: 'اختار الفرع',
                size: Get.width * 0.042,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            menuProps: const MenuProps(elevation: 25)),
        items: controller.dataList.isEmpty ? [] : controller.dataList,
        onChanged: (value) {
          controller.oncganged(value);
        },
        enabled: true,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: Get.width * 0.035,
              fontWeight: FontWeight.w800,
            ),
            prefixIcon: const Icon(
              Icons.add_business_outlined,
              color: AppColors.primaryColor,
            ),
            hintStyle:
                TextStyle(color: Colors.grey, fontSize: Get.width * 0.04),
            hintText: '69'.tr,
          ),
        ),
        selectedItem: controller.intailData),
  );
}

SizedBox buildDrobDown({required CreateUserVeiwModel controller}) {
  return SizedBox(
    width: Get.width * 0.75,
    child: DropdownSearch<String>(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '5'.tr;
          }

          return null;
        },
        clearButtonProps: const ClearButtonProps(
            color: AppColors.primaryColor,
            isVisible: true,
            icon: Icon(Icons.clear_rounded)),
        popupProps: PopupProps.menu(
            showSearchBox: true,
            showSelectedItems: true,
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
              child: AppText(
                txt: 'اختار الفرع',
                size: Get.width * 0.042,
                fw: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            menuProps: const MenuProps(elevation: 25)),
        items: controller.dataList2.isEmpty ? [] : controller.dataList2,
        onChanged: (value) {
          controller.oncganged2(value);
        },
        enabled: true,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: Get.width * 0.035,
              fontWeight: FontWeight.w800,
            ),
            prefixIcon: const Icon(
              Icons.perm_contact_cal_outlined,
              color: AppColors.primaryColor,
            ),
            hintStyle:
                TextStyle(color: Colors.grey, fontSize: Get.width * 0.04),
            hintText: '88'.tr,
          ),
        ),
        selectedItem: controller.intailData2),
  );
}
