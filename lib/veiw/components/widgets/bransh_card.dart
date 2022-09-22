import 'package:admin_new_app/veiw_model/controller/branshes/bransh_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/consts/colors.dart';
import '../public_widgets/custom_text.dart';

GetBuilder<BranshVeiwModel> buildBranshCard() {
  return GetBuilder<BranshVeiwModel>(
    builder: (controller) => Expanded(
      child: controller.branshList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              padding: EdgeInsets.all(Get.width * 0.03),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Get.width * 0.05,
                  mainAxisSpacing: Get.width * 0.05,
                  childAspectRatio: Get.width * 0.36 / Get.width * 3.4),
              itemCount: controller.branshList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_balance_rounded,
                        color: AppColors.seconrayColor,
                        size: Get.width * 0.15,
                      ),
                      AppText(
                        txt: controller.branshList[index].bransh,
                        size: Get.width * 0.035,
                        fw: FontWeight.w800,
                        color: AppColors.fontColor,
                      ),
                    ],
                  ),
                );
              },
            ),
    ),
  );
}
