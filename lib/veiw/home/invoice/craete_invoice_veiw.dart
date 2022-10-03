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

import '../../components/txt_frm_feilds/txt_forms.dart';
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
                            Get.bottomSheet(
                              Container(
                                  height: Get.width * 2,
                                  decoration: BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(Get.width * 0.1),
                                      topRight:
                                          Radius.circular(Get.width * 0.1),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Divider(
                                        thickness: 4,
                                        height: Get.width * 0.05,
                                        color: AppColors.fontColor
                                            .withOpacity(0.3),
                                        endIndent: Get.width * 0.4,
                                        indent: Get.width * 0.4,
                                      ),
                                      buildHeightSpace(0.02),
                                      GetBuilder<CreateInvoiceVeiwModel>(
                                          builder: (controller) =>
                                              buildSarchCustomersC(
                                                  controller.txtCCont)),
                                      Expanded(
                                          child: Stack(
                                        children: [
                                          GetBuilder<CreateInvoiceVeiwModel>(
                                            builder: (controller) => controller
                                                    .custData.isEmpty
                                                ? const SizedBox()
                                                : ListView.builder(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: Get
                                                                    .width *
                                                                0.08,
                                                            vertical:
                                                                Get.width *
                                                                    0.01),
                                                    itemCount: controller
                                                        .custData.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    Get.width *
                                                                        0.02,
                                                                vertical:
                                                                    Get.width *
                                                                        0.005),
                                                        child: ListTile(
                                                            onTap: () async {
                                                              await AudioPlayer()
                                                                  .play(
                                                                AssetSource(
                                                                  'audio/beeb.mp3',
                                                                ),
                                                              );
                                                              // await AudioPlayer().stop();
                                                              controller.addToCL(
                                                                  controller
                                                                          .custData[
                                                                      index]);
                                                              controller
                                                                  .custData
                                                                  .clear();
                                                            },
                                                            selectedTileColor:
                                                                AppColors
                                                                    .seconrayColor,
                                                            hoverColor: AppColors
                                                                .primaryColor,
                                                            title: AppText(
                                                              txt:
                                                                  '${controller.custData[index].custName}       ${controller.custData[index].phone}',
                                                              size: Get.width *
                                                                  0.03,
                                                              fw: FontWeight
                                                                  .w800,
                                                              color: AppColors
                                                                  .fontColor,
                                                            ),
                                                            leading: const Icon(
                                                                Icons.person)),
                                                      );
                                                    },
                                                  ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: Get.width * 0.04),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                TxtFrmFeild.buildPayedTxtForm(
                                                    cont: controller.payedCont,
                                                    controller: controller),
                                                TxtFrmFeild.buildrentTxtForm(
                                                    controller:
                                                        controller.rentCont)
                                              ],
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  )),
                              barrierColor: Colors.black.withOpacity(0.2),
                              isDismissible: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              backgroundColor: Colors.transparent,
                              enableDrag: true,
                            );
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
