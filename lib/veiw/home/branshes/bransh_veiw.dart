import 'package:admin_new_app/veiw/components/widgets/bransh_card.dart';
import 'package:admin_new_app/veiw_model/controller/branshes/bransh_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/public_widgets/app_bar.dart';
import '../../components/public_widgets/back_ground.dart';
import '../../components/public_widgets/spaces.dart';
import '../../helper/consts/colors.dart';

class BranshVeiw extends StatelessWidget {
  BranshVeiw({super.key});
  final controller = Get.put(BranshVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.getData();
            },
            child: Column(
              children: [
                buildAppBar(txt: '90'.tr),
                buildHeightSpace(0.02),
                buildBranshCard(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addbransh();
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.add_business_rounded,
          color: AppColors.backgroundColor,
          size: Get.width * 0.085,
        ),
      ),
    );
  }
}
