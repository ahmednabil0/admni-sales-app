import 'package:admin_new_app/veiw_model/controller/invoice/invoices_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../helper/consts/colors.dart';
import '../public_widgets/custom_text.dart';
import '../public_widgets/spaces.dart';

GetBuilder<InvoicesVeiwModel> buildInvoiceCard() {
  return GetBuilder<InvoicesVeiwModel>(
    builder: (controller) => controller.invoiceData.isEmpty
        ? Center(
            child: AppText(
                txt: '54'.tr,
                size: Get.width * 0.04,
                fw: FontWeight.bold,
                color: AppColors.seconrayColor),
          )
        : ListView.builder(
            itemCount: controller.invoiceData.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03,
                  vertical: Get.width * 0.015,
                ),
                height: Get.width * 0.785,
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
                    QrImage(
                      data:
                          '${controller.invoiceData[index].id}${controller.invoiceData[index]}',
                      version: QrVersions.auto,
                      size: Get.width * 0.13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: Get.width * .1,
                          width: Get.width * 0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.invoiceData[index].rent == 0
                                  ? AppColors.fontColor
                                  : AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(Get.width * 0.04)),
                          child: AppText(
                            txt: controller.invoiceData[index].rent == 0
                                ? '57'.tr
                                : '56'.tr,
                            size: Get.width * 0.045,
                            fw: FontWeight.bold,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                        AppText2(
                          txt2: controller.invoiceData[index].date,
                          txt: '${'43'.tr}   :   ',
                          size: Get.width * 0.035,
                          size2: Get.width * 0.035,
                          fw: FontWeight.bold,
                          fw2: FontWeight.w600,
                          color: AppColors.fontColor,
                          color2: AppColors.seconrayColor.withOpacity(0.8),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      endIndent: Get.width * 0.1,
                      indent: Get.width * 0.1,
                      color: AppColors.primaryColor.withOpacity(0.5),
                      height: 10,
                    ),
                    buildHeightSpace(0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppText2(
                          txt2: controller.invoiceData[index].customerName,
                          txt: '${'20'.tr} : ',
                          size: Get.width * 0.035,
                          size2: Get.width * 0.035,
                          fw: FontWeight.bold,
                          fw2: FontWeight.w600,
                          color: AppColors.fontColor,
                          color2: AppColors.seconrayColor.withOpacity(0.8),
                        ),
                        AppText2(
                          txt2: controller.invoiceData[index].total
                              .toStringAsFixed(3),
                          txt: '${'44'.tr} : ',
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppText2(
                          txt2: controller.invoiceData[index].payed
                              .toStringAsFixed(3),
                          txt: '${'46'.tr} : ',
                          size: Get.width * 0.035,
                          size2: Get.width * 0.035,
                          fw: FontWeight.bold,
                          fw2: FontWeight.w600,
                          color: AppColors.fontColor,
                          color2: AppColors.seconrayColor.withOpacity(0.8),
                        ),
                        AppText2(
                          txt2: controller.invoiceData[index].rent
                              .toStringAsFixed(3),
                          txt: '${'47'.tr} : ',
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppText2(
                          txt2: controller.invoiceData[index].delivery
                              .toStringAsFixed(3),
                          txt: '${'35'.tr} : ',
                          size: Get.width * 0.035,
                          size2: Get.width * 0.035,
                          fw: FontWeight.bold,
                          fw2: FontWeight.w600,
                          color: AppColors.fontColor,
                          color2: AppColors.seconrayColor.withOpacity(0.8),
                        ),
                        AppText2(
                          txt2: controller.invoiceData[index].vat
                              .toStringAsFixed(3),
                          txt: '${'33'.tr} : ',
                          size: Get.width * 0.035,
                          size2: Get.width * 0.035,
                          fw: FontWeight.bold,
                          fw2: FontWeight.w600,
                          color: AppColors.fontColor,
                          color2: AppColors.seconrayColor.withOpacity(0.8),
                        ),
                      ],
                    ),
                    buildHeightSpace(0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppText(
                          txt: '24'.tr,
                          size: Get.width * 0.03,
                          fw: FontWeight.bold,
                          color: AppColors.fontColor.withOpacity(0.8),
                        ),
                        AppText(
                          txt: '27'.tr,
                          size: Get.width * 0.03,
                          fw: FontWeight.bold,
                          color: AppColors.fontColor.withOpacity(0.8),
                        ),
                        AppText(
                          txt: '25'.tr,
                          size: Get.width * 0.03,
                          fw: FontWeight.bold,
                          color: AppColors.fontColor.withOpacity(0.8),
                        ),
                        AppText(
                          txt: '23'.tr,
                          size: Get.width * 0.03,
                          fw: FontWeight.bold,
                          color: AppColors.fontColor.withOpacity(0.8),
                        ),
                        AppText(
                          txt: '34'.tr,
                          size: Get.width * 0.03,
                          fw: FontWeight.bold,
                          color: AppColors.fontColor.withOpacity(0.8),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                      endIndent: Get.width * 0.06,
                      indent: Get.width * 0.06,
                      color: AppColors.primaryColor.withOpacity(0.5),
                      height: 3,
                    ),
                    SizedBox(
                      height: Get.width * 0.21,
                      child: controller.invoiceData[index].items.isEmpty
                          ? Center(
                              child: AppText(
                                  txt: '98'.tr,
                                  size: Get.width * 0.04,
                                  fw: FontWeight.bold,
                                  color: AppColors.seconrayColor),
                            )
                          : ListView.builder(
                              itemCount:
                                  controller.invoiceData[index].items.length,
                              itemBuilder: (BuildContext context, int i) {
                                List<dynamic> item =
                                    controller.invoiceData[index].items;
                                double multi(double i, int y) {
                                  return i * y;
                                }

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AppText(
                                      txt: item[i]['name'],
                                      size: Get.width * 0.028,
                                      fw: FontWeight.bold,
                                      color:
                                          AppColors.fontColor.withOpacity(0.5),
                                    ),
                                    AppText(
                                      txt: item[i]['unit'],
                                      size: Get.width * 0.028,
                                      fw: FontWeight.bold,
                                      color:
                                          AppColors.fontColor.withOpacity(0.5),
                                    ),
                                    AppText(
                                      txt: item[i]['price'].toString(),
                                      size: Get.width * 0.028,
                                      fw: FontWeight.bold,
                                      color:
                                          AppColors.fontColor.withOpacity(0.5),
                                    ),
                                    AppText(
                                      txt: '* ${item[i]['quntity'].toString()}',
                                      size: Get.width * 0.028,
                                      fw: FontWeight.bold,
                                      color:
                                          AppColors.fontColor.withOpacity(0.5),
                                    ),
                                    AppText(
                                      txt: multi(item[i]['price'],
                                              item[i]['quntity'])
                                          .toStringAsFixed(2),
                                      size: Get.width * 0.028,
                                      fw: FontWeight.bold,
                                      color:
                                          AppColors.fontColor.withOpacity(0.5),
                                    )
                                  ],
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
  );
}
