import 'package:admin_new_app/veiw/components/widgets/cust_card.dart';
import 'package:admin_new_app/veiw_model/controller/customers/illg_customers_veiw_model.dart';
import 'package:get/get.dart';
import '../../components/public_widgets/app_bar.dart';
import '../../components/public_widgets/back_ground.dart';
import '../../components/public_widgets/spaces.dart';
import 'package:flutter/material.dart';

class IllegalCustomers extends GetWidget<IllgCustomersVeiwModel> {
  IllegalCustomers({super.key});
  @override
  final controller = Get.put(IllgCustomersVeiwModel());
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
                buildAppBar(txt: '95'.tr),
                buildHeightSpace(0.02),
                buildIllCustCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
