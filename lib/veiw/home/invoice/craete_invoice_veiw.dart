import 'package:admin_new_app/veiw/components/public_widgets/app_bar.dart';
import 'package:admin_new_app/veiw/components/public_widgets/back_ground.dart';
import 'package:admin_new_app/veiw/components/public_widgets/bttons.dart';
import 'package:admin_new_app/veiw/components/public_widgets/custom_text.dart';
import 'package:admin_new_app/veiw/components/public_widgets/spaces.dart';
import 'package:admin_new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:admin_new_app/veiw/components/widgets/search_cust.dart';
import 'package:admin_new_app/veiw/helper/consts/colors.dart';
import 'package:admin_new_app/veiw_model/controller/invoice/create_invoice_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          : GetBuilder<CreateInvoiceVeiwModel>(
                              builder: (controller) => ListView.builder(
                                itemCount: controller.selectedList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  TextEditingController quCont =
                                      TextEditingController();
                                  quCont.text = controller
                                      .selectedList[index].quntity
                                      .toString();
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Get.width * 0.025,
                                        vertical: Get.width * 0.005),
                                    child: Container(
                                      height: Get.width * 0.3,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
                                            offset: const Offset(2, 2),
                                            color:
                                                AppColors.fontColor.withOpacity(
                                              0.5,
                                            ),
                                          )
                                        ],
                                        color: AppColors.backgroundColor,
                                        borderRadius: BorderRadius.circular(
                                          Get.width * 0.045,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: Get.width * 0.3,
                                            height: Get.width * 0.3,
                                            decoration: BoxDecoration(
                                              color: AppColors.backgroundColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    controller
                                                        .selectedList[index]
                                                        .url,
                                                  ),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Get.width * 0.045,
                                              ),
                                            ),
                                            // child: Image.network(
                                            //   controller
                                            //       .selectedList[index].url,
                                            //   height: Get.width * 0.3,
                                            //   width: Get.width * 0.28,
                                            //   fit: BoxFit.cover,
                                            // ),
                                          ),
                                          buildWirthSpace(0.07),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  AppText(
                                                    txt: controller
                                                        .selectedList[index]
                                                        .name,
                                                    size: Get.width * 0.04,
                                                    fw: FontWeight.w800,
                                                    color: AppColors.fontColor,
                                                  ),
                                                ],
                                              ),
                                              AppText(
                                                txt: controller
                                                    .selectedList[index].price
                                                    .toString(),
                                                size: Get.width * 0.04,
                                                fw: FontWeight.w800,
                                                color: AppColors.seconrayColor,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomButtonIcon2(
                                                    icon: Icons.add,
                                                    ontap: () {
                                                      controller.add(index);
                                                    },
                                                    txt: 'add',
                                                  ),
                                                  buildWirthSpace(0.01),
                                                  TxtFrmFeild
                                                      .buildQntityTxtForm(
                                                          i: index,
                                                          controll: quCont),
                                                  buildWirthSpace(0.01),
                                                  CustomButtonIcon2(
                                                    icon: Icons.remove,
                                                    ontap: () {
                                                      controller.sub(index);
                                                    },
                                                    txt: 'add',
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      controller.itemData.isEmpty
                          ? const SizedBox()
                          : ListView.builder(
                              itemCount: controller.itemData.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.02,
                                      vertical: Get.width * 0.01),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.backgroundColor,
                                        borderRadius: BorderRadius.circular(
                                            Get.width * 0.04)),
                                    child: ListTile(
                                      onTap: () {
                                        controller.addToSL(
                                            controller.itemData[index]);
                                        controller.itemData.clear();
                                        controller.txtCont.text = '';
                                      },
                                      selectedTileColor:
                                          AppColors.seconrayColor,
                                      hoverColor: AppColors.primaryColor,
                                      title: AppText(
                                        txt: controller.itemData[index].name,
                                        size: Get.width * 0.04,
                                        fw: FontWeight.w800,
                                        color: AppColors.fontColor,
                                      ),
                                      leading: Image.network(
                                        controller.itemData[index].url,
                                        height: Get.width * 0.1,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
