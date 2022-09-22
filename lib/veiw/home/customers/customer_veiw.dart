import 'package:admin_new_app/veiw/components/widgets/bransh_card.dart';
import 'package:admin_new_app/veiw/helper/consts/colors.dart';
import 'package:admin_new_app/veiw_model/controller/customers/customer_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/public_widgets/app_bar.dart';
import '../../components/public_widgets/back_ground.dart';
import '../../components/public_widgets/spaces.dart';
import '../../components/widgets/cust_card.dart';

class Customersveiw extends GetWidget<CustomerVeiwModel> {
  Customersveiw({super.key});
  @override
  final controller = Get.put(CustomerVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await controller.fetchUserData();
            },
            child: Column(
              children: [
                buildAppBar(txt: '76'.tr),
                buildHeightSpace(0.02),
                buildCustCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
