import 'package:admin_new_app/veiw/helper/consts/colors.dart';

import '../../../veiw_model/controller/customers/customer_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/public_widgets/app_bar.dart';
import '../../components/public_widgets/back_ground.dart';
import '../../components/public_widgets/spaces.dart';
import '../../components/widgets/cust_card.dart';
import '../../components/widgets/search_cust.dart';

class Customersveiw extends GetWidget<CustomerVeiwModel> {
  Customersveiw({super.key});
  @override
  final controller = Get.put(CustomerVeiwModel(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              controller.queryCont.text = '';
              await controller.fetchUserData(controller.queryCont.text);
            },
            child: Column(
              children: [
                buildAppBar(txt: '76'.tr),
                buildHeightSpace(0.02),
                buildSarchCustomer(),
                Expanded(
                  child: Stack(
                    children: [
                      buildCustCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
