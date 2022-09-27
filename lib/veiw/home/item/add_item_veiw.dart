import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/items/item_data_veiw_model.dart';
import '../../components/dropdown/drop_down.dart';
import '../../components/public_widgets/app_bar.dart';
import '../../components/public_widgets/back_ground.dart';
import '../../components/public_widgets/bttons.dart';
import '../../components/public_widgets/custom_text.dart';
import '../../components/public_widgets/spaces.dart';
import '../../components/txt_frm_feilds/txt_forms.dart';
import '../../helper/consts/colors.dart';

class AddItemVeiw extends GetWidget<ItemVeiwModel> {
  AddItemVeiw({super.key});
  @override
  final controller = Get.put(ItemVeiwModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  buildAppBar(txt: '92'.tr),
                  Divider(
                    color: AppColors.seconrayColor,
                    thickness: 2,
                    endIndent: Get.width * 0.3,
                    indent: Get.width * 0.3,
                    height: 0,
                  ),
                  Row(
                    children: [
                      buildWirthSpace(0.05),
                      AppText(
                        txt: '24'.tr,
                        size: Get.width * 0.045,
                        fw: FontWeight.bold,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  TxtFrmFeild.buildCompanyNameTxtForm(
                    controller: controller.nameCont,
                    hint: '24'.tr,
                    icon: Icons.pix_rounded,
                  ),
                  Row(
                    children: [
                      buildWirthSpace(0.05),
                      AppText(
                        txt: '25'.tr,
                        size: Get.width * 0.045,
                        fw: FontWeight.bold,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  TxtFrmFeild.buildCompanyNameTxtForm(
                    controller: controller.priceCont,
                    hint: '25'.tr,
                    icon: Icons.price_check_sharp,
                  ),
                  Row(
                    children: [
                      buildWirthSpace(0.05),
                      AppText(
                        txt: '26'.tr,
                        size: Get.width * 0.045,
                        fw: FontWeight.bold,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  TxtFrmFeild.buildCompanyNameTxtForm(
                    controller: controller.vatCont,
                    hint: '26'.tr,
                    icon: Icons.price_check_sharp,
                  ),
                  Row(
                    children: [
                      buildWirthSpace(0.05),
                      AppText(
                        txt: '27'.tr,
                        size: Get.width * 0.045,
                        fw: FontWeight.bold,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                  GetBuilder<ItemVeiwModel>(
                    builder: (controller) =>
                        buildDrobDownUniT(controller: controller),
                  ),
                  buildHeightSpace(0.03),
                  AppText(
                    txt: '94'.tr,
                    size: Get.width * 0.045,
                    fw: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  Divider(
                    color: AppColors.seconrayColor,
                    thickness: 2,
                    endIndent: Get.width * 0.25,
                    indent: Get.width * 0.25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonIcon(
                          icon: Icons.add_a_photo_rounded,
                          ontap: () {
                            controller.uploadImage();
                          },
                          txt: ''),
                      TxtFrmFeild.buildQuntityTxtForm(
                        controller: controller.imageCont,
                      ),
                    ],
                  ),
                  buildHeightSpace(0.125),
                  CustomButton(
                      ontap: () async {
                        if (_key.currentState!.validate()) {
                          await controller.uploadItem();
                        }
                      },
                      txt: '92'.tr)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
