import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/invoice/create_invoice_veiw_model.dart';
import '../../helper/consts/colors.dart';
import '../public_widgets/bttons.dart';
import '../public_widgets/custom_text.dart';
import '../public_widgets/spaces.dart';
import '../txt_frm_feilds/txt_forms.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateInvoiceVeiwModel>(
      builder: (controller) => ListView.builder(
        itemCount: controller.selectedList.length,
        itemBuilder: (BuildContext context, int index) {
          TextEditingController quCont = TextEditingController();
          quCont.text = controller.selectedList[index].quntity.toString();
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.025, vertical: Get.width * 0.009),
            child: Container(
              height: Get.width * 0.3,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: const Offset(2, 2),
                    color: AppColors.fontColor.withOpacity(
                      0.25,
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
                            controller.selectedList[index].url,
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppText(
                            txt: controller.selectedList[index].name,
                            size: Get.width * 0.04,
                            fw: FontWeight.w800,
                            color: AppColors.fontColor,
                          ),
                        ],
                      ),
                      AppText(
                        txt: controller.selectedList[index].price.toString(),
                        size: Get.width * 0.04,
                        fw: FontWeight.w800,
                        color: AppColors.seconrayColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButtonIcon2(
                            icon: Icons.add,
                            ontap: () async {
                              await AudioPlayer().play(
                                AssetSource(
                                  'audio/click.mp3',
                                ),
                              );
                              // await AudioPlayer()
                              //     .stop();
                              controller.add(index);
                            },
                            txt: 'add',
                          ),
                          buildWirthSpace(0.01),
                          TxtFrmFeild.buildQntityTxtForm(
                              i: index, controll: quCont),
                          buildWirthSpace(0.01),
                          CustomButtonIcon2(
                            icon: Icons.remove,
                            ontap: () async {
                              await AudioPlayer().play(
                                AssetSource(
                                  'audio/click.mp3',
                                ),
                              );
                              // await AudioPlayer()
                              //     .stop();
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
    );
  }
}
