import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/items/item_data_veiw_model.dart';
import '../../components/public_widgets/app_bar.dart';
import '../../components/public_widgets/back_ground.dart';
import '../../components/public_widgets/spaces.dart';
import '../../components/widgets/item_card.dart';
import '../../helper/consts/colors.dart';
import 'add_item_veiw.dart';

class ItemVeiw extends GetWidget<ItemVeiwModel> {
  ItemVeiw({super.key});
  @override
  final controller = Get.put(ItemVeiwModel(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.fetchItemData();
            },
            child: Column(
              children: [
                buildAppBar(txt: '91'.tr),
                buildHeightSpace(0.02),
                buildItemCard()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddItemVeiw());
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.playlist_add_circle_outlined,
          color: AppColors.backgroundColor,
          size: Get.width * 0.095,
        ),
      ),
    );
  }
}
