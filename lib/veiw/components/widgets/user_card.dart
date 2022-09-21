import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/employee/employee_veiw_model.dart';
import '../../helper/consts/colors.dart';
import '../public_widgets/custom_text.dart';
import '../public_widgets/spaces.dart';

GetBuilder<EmployeeVeiwModel> buildUserCard() {
  return GetBuilder<EmployeeVeiwModel>(
    builder: (controller) => Expanded(
      child: controller.userData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.userData.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.02,
                    vertical: Get.width * 0.03,
                  ),
                  height: Get.width * 0.4,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.fontColor.withOpacity(0.35),
                        blurRadius: 6,
                        offset: const Offset(3, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                      Get.width * 0.035,
                    ),
                  ),
                  child: Column(
                    children: [
                      AppText(
                        txt: controller.userData[index].name,
                        size: Get.width * 0.05,
                        fw: FontWeight.bold,
                        color: AppColors.fontColor,
                      ),
                      Divider(
                        thickness: 2,
                        height: 8,
                        endIndent: Get.width * 0.1,
                        indent: Get.width * 0.1,
                        color: AppColors.primaryColor.withOpacity(0.5),
                      ),
                      Row(
                        children: [
                          buildWirthSpace(0.02),
                          AppText2(
                            txt2: controller.userData[index].phone,
                            txt: '${'77'.tr} : ',
                            size: Get.width * 0.035,
                            size2: Get.width * 0.035,
                            fw: FontWeight.bold,
                            fw2: FontWeight.w600,
                            color: AppColors.fontColor,
                            color2: AppColors.seconrayColor.withOpacity(0.8),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          buildWirthSpace(0.02),
                          AppText2(
                            txt2: controller.userData[index].permision,
                            txt: '${'78'.tr} : ',
                            size: Get.width * 0.035,
                            size2: Get.width * 0.035,
                            fw: FontWeight.bold,
                            fw2: FontWeight.w600,
                            color: AppColors.fontColor,
                            color2: AppColors.seconrayColor.withOpacity(0.8),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          buildWirthSpace(0.02),
                          AppText2(
                            txt2: controller.userData[index].personalSales
                                .toStringAsFixed(1),
                            txt: '${'79'.tr} : ',
                            size: Get.width * 0.035,
                            size2: Get.width * 0.035,
                            fw: FontWeight.bold,
                            fw2: FontWeight.w600,
                            color: AppColors.fontColor,
                            color2: AppColors.seconrayColor.withOpacity(0.8),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          buildWirthSpace(0.02),
                          AppText2(
                            txt2:
                                controller.userData[index].permision == 'sales'
                                    ? '81'.tr
                                    : '82'.tr,
                            txt: '${'80'.tr} : ',
                            size: Get.width * 0.035,
                            size2: Get.width * 0.035,
                            fw: FontWeight.bold,
                            fw2: FontWeight.w600,
                            color: AppColors.fontColor,
                            color2: AppColors.seconrayColor.withOpacity(0.8),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    ),
  );
}
