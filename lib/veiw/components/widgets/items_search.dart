import 'package:admin_new_app/veiw_model/controller/invoice/create_invoice_veiw_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/consts/colors.dart';
import '../public_widgets/custom_text.dart';

class ListVeiwItems extends StatelessWidget {
  const ListVeiwItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateInvoiceVeiwModel>(
      builder: (controller) => ListView.builder(
        itemCount: controller.itemData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.02, vertical: Get.width * 0.01),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(Get.width * 0.04)),
              child: ListTile(
                onTap: () async {
                  await AudioPlayer().play(
                    AssetSource(
                      'audio/beeb.mp3',
                    ),
                  );
                  // await AudioPlayer().stop();
                  controller.addToSL(controller.itemData[index]);
                  controller.itemData.clear();
                  controller.txtCont.text = '';
                },
                selectedTileColor: AppColors.seconrayColor,
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
    );
  }
}
