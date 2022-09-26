import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/customers/customer_veiw_model.dart';
import '../../helper/consts/colors.dart';

GetBuilder<CustomerVeiwModel> buildSarchCustomer() {
  return GetBuilder<CustomerVeiwModel>(
    builder: (controller) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width * 0.2),
              color: const Color(0xffF6F6F6)),
          width: Get.width * 0.75,
          child: TextFormField(
            onChanged: (value) {
              controller.fetchUserData(value.trim());
            },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Get.width * 0.1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius:
                        BorderRadius.all(Radius.circular(Get.width * 0.1))),
                prefixIcon: const Icon(Icons.search_rounded),
                prefixIconColor: const Color.fromARGB(218, 196, 196, 196),
                hintText: "76".tr,
                hintStyle: TextStyle(
                    fontSize: Get.width * 0.0332,
                    color: const Color.fromARGB(206, 196, 196, 196),
                    fontWeight: FontWeight.w600,
                    fontFamily: "Neo Sans Arabic Regular")),
          ),
        ),
        Container(
          width: Get.width * 40 / 426,
          height: Get.width * 40 / 426,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Get.width * 0.08),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryColor,
                AppColors.seconrayColor,
              ],
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.manage_search_rounded,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
      ],
    ),
  );
}
