import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/items/item_data_veiw_model.dart';
import '../../helper/consts/colors.dart';
import '../public_widgets/custom_text.dart';
import '../public_widgets/spaces.dart';

GetBuilder<ItemVeiwModel> buildItemCard() {
  return GetBuilder<ItemVeiwModel>(
    builder: (controller) => Expanded(
      child: controller.itemData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.itemData.length,
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
                        txt: controller.itemData[index].name,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  buildWirthSpace(0.02),
                                  AppText2(
                                    txt2: controller.itemData[index].name,
                                    txt: '${'24'.tr} : ',
                                    size: Get.width * 0.035,
                                    size2: Get.width * 0.035,
                                    fw: FontWeight.bold,
                                    fw2: FontWeight.w600,
                                    color: AppColors.fontColor,
                                    color2: AppColors.seconrayColor
                                        .withOpacity(0.8),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  buildWirthSpace(0.02),
                                  AppText2(
                                    txt2: controller.itemData[index].unit,
                                    txt: '${'27'.tr} : ',
                                    size: Get.width * 0.035,
                                    size2: Get.width * 0.035,
                                    fw: FontWeight.bold,
                                    fw2: FontWeight.w600,
                                    color: AppColors.fontColor,
                                    color2: AppColors.seconrayColor
                                        .withOpacity(0.8),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  buildWirthSpace(0.02),
                                  AppText2(
                                    txt2: controller.itemData[index].price
                                        .toStringAsFixed(2),
                                    txt: '${'25'.tr} : ',
                                    size: Get.width * 0.035,
                                    size2: Get.width * 0.035,
                                    fw: FontWeight.bold,
                                    fw2: FontWeight.w600,
                                    color: AppColors.fontColor,
                                    color2: AppColors.seconrayColor
                                        .withOpacity(0.8),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  buildWirthSpace(0.02),
                                  AppText2(
                                    txt2: controller.itemData[index].vat
                                        .toString(),
                                    txt: '${'26'.tr} : ',
                                    size: Get.width * 0.035,
                                    size2: Get.width * 0.035,
                                    fw: FontWeight.bold,
                                    fw2: FontWeight.w600,
                                    color: AppColors.fontColor,
                                    color2: AppColors.seconrayColor
                                        .withOpacity(0.8),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          buildWirthSpace(0.09),
                          Image.network(
                            controller.itemData[index].url,
                            height: Get.width * 0.25,
                            width: Get.width * 0.4,
                            fit: BoxFit.cover,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    ),
  );
}
