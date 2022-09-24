import '../../../veiw_model/controller/customers/customer_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/consts/colors.dart';
import '../public_widgets/custom_text.dart';
import '../public_widgets/spaces.dart';

GetBuilder<CustomerVeiwModel> buildCustCard() {
  return GetBuilder<CustomerVeiwModel>(
    builder: (controller) => controller.userData.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: controller.userData.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02,
                  vertical: Get.width * 0.045,
                ),
                height: Get.width * 0.332,
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
                    buildHeightSpace(0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: Get.width * .1,
                          width: Get.width * 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.userData[index].rent == 0
                                  ? AppColors.fontColor
                                  : AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(Get.width * 0.04)),
                          child: AppText(
                            txt: controller.userData[index].rent == 0
                                ? '57'.tr
                                : '56'.tr,
                            size: Get.width * 0.045,
                            fw: FontWeight.bold,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                        AppText(
                          txt: controller.userData[index].custName,
                          size: Get.width * 0.05,
                          fw: FontWeight.bold,
                          color: AppColors.fontColor,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      endIndent: Get.width * 0.1,
                      indent: Get.width * 0.1,
                      color: AppColors.primaryColor.withOpacity(0.5),
                    ),
                    buildHeightSpace(0.02),
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
                          txt2: controller.userData[index].custName,
                          txt: '${'42'.tr} : ',
                          size: Get.width * 0.035,
                          size2: Get.width * 0.035,
                          fw: FontWeight.bold,
                          fw2: FontWeight.w600,
                          color: AppColors.fontColor,
                          color2: AppColors.seconrayColor.withOpacity(0.8),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
  );
}
