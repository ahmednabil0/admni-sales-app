import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/employee/employee_veiw_model.dart';
import '../../components/public_widgets/app_bar.dart';
import '../../components/public_widgets/back_ground.dart';
import '../../components/public_widgets/spaces.dart';
import '../../components/widgets/user_card.dart';
import '../../helper/consts/colors.dart';
import 'create_employee.dart';

class EmployeeVeiw extends GetWidget<EmployeeVeiwModel> {
  EmployeeVeiw({super.key});
  @override
  final controller = Get.put(EmployeeVeiwModel());
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
                buildAppBar(txt: '75'.tr),
                buildHeightSpace(0.02),
                buildUserCard()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateUserVeiw());
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.person_add,
          color: AppColors.backgroundColor,
          size: Get.width * 0.07,
        ),
      ),
    );
  }
}
