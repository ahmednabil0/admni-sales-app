import 'package:admin_new_app/veiw/components/public_widgets/app_bar.dart';
import 'package:admin_new_app/veiw/components/public_widgets/back_ground.dart';
import 'package:admin_new_app/veiw/components/public_widgets/bttons.dart';
import 'package:admin_new_app/veiw/components/public_widgets/custom_text.dart';
import 'package:admin_new_app/veiw/components/public_widgets/spaces.dart';
import 'package:admin_new_app/veiw/components/widgets/search_cust.dart';
import 'package:admin_new_app/veiw/helper/consts/colors.dart';
import 'package:admin_new_app/veiw_model/controller/invoice/create_invoice_veiw_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/widgets/items_card.dart';
import '../../components/widgets/items_search.dart';

class CreateInvoiceVeiw extends GetWidget<CreateInvoiceVeiwModel> {
  CreateInvoiceVeiw({super.key});
  @override
  final controller = Get.put(CreateInvoiceVeiwModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: Column(
            children: [
              buildAppBar(txt: '99'.tr),
              buildHeightSpace(0.02),
              buildSarchItems(controller.txtCont),
              buildHeightSpace(0.03),
              Expanded(
                child: GetBuilder<CreateInvoiceVeiwModel>(
                  builder: (controller) => Stack(
                    children: [
                      controller.selectedList.isEmpty
                          ? Center(
                              child: AppText(
                                txt: 'no data selected',
                                size: Get.width * 0.035,
                                fw: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            )
                          : const ItemsCard(),
                      controller.itemData.isEmpty
                          ? const SizedBox()
                          : const ListVeiwItems(),
                    ],
                  ),
                ),
              ),
              Container(
                height: Get.width * 0.25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: AppColors.fontColor.withOpacity(0.1),
                        offset: const Offset(0, -2))
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.width * 0.09),
                    topRight: Radius.circular(Get.width * 0.09),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton5(
                        ontap: () async {
                          if (controller.selectedList.isNotEmpty) {
                            await AudioPlayer().play(
                              AssetSource(
                                'audio/beeb.mp3',
                              ),
                            );
                            controller.shoeBottomSheet();
                          } else {
                            Get.snackbar('', 'اختار احد الاصناف علي الاقل');
                          }
                        },
                        txt: '55'.tr),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          txt: '44'.tr,
                          size: Get.width * 0.057,
                          fw: FontWeight.w700,
                          color: AppColors.fontColor,
                        ),
                        GetBuilder<CreateInvoiceVeiwModel>(
                          builder: (controller) => AppText(
                            txt: '${controller.total.toStringAsFixed(2)}💲',
                            size: Get.width * 0.045,
                            fw: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
