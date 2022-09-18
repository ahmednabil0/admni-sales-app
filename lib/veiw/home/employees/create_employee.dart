import 'package:admin_new_app/veiw/components/public_widgets/app_bar.dart';
import 'package:admin_new_app/veiw/components/public_widgets/bttons.dart';
import 'package:admin_new_app/veiw/components/public_widgets/custom_text.dart';
import 'package:admin_new_app/veiw/components/public_widgets/spaces.dart';
import 'package:admin_new_app/veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:admin_new_app/veiw/helper/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../veiw_model/controller/employee/create_user_veiw_model.dart';
import '../../components/dropdown/drop_down.dart';
import '../../components/public_widgets/back_ground.dart';

class CreateUserVeiw extends GetWidget<CreateUserVeiwModel> {
  CreateUserVeiw({super.key});
  @override
  final controller = Get.put(CreateUserVeiwModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  buildAppBar(txt: '84'.tr),
                  buildHeightSpace(0.02),
                  SvgPicture.asset(
                    'assets/svg/null_states_people_dark_mode.svg',
                    height: Get.width * 0.38,
                  ),
                  AppText(
                    txt: '89'.tr,
                    size: Get.width * 0.05,
                    fw: FontWeight.bold,
                    color: const Color.fromARGB(255, 189, 13, 1),
                  ),
                  Divider(
                    color: AppColors.fontColor,
                    thickness: 2.5,
                    endIndent: Get.width * 0.25,
                    indent: Get.width * 0.2,
                    height: 0,
                  ),
                  buildHeightSpace(0.04),
                  TxtFrmFeild.buildUserTxtForm(controller: controller.nameCont),
                  buildHeightSpace(0.02),
                  TxtFrmFeild.buildCompanyNameTxtForm(
                      controller: controller.emailCont,
                      hint: '85'.tr,
                      icon: Icons.email_rounded),
                  buildHeightSpace(0.02),
                  TxtFrmFeild.buildCompanyNameTxtForm(
                    controller: controller.phoneCont,
                    hint: '77'.tr,
                    icon: Icons.phone,
                  ),
                  buildHeightSpace(0.02),
                  GetBuilder<CreateUserVeiwModel>(
                    builder: (controller) => TxtFrmFeild.buildpasswordTxtForm(
                        obs: controller.opscur,
                        onPressed: () {
                          controller.isops();
                        },
                        controller: controller.passwordCont),
                  ),
                  AppText(
                    txt: '86'.tr,
                    size: Get.width * 0.05,
                    fw: FontWeight.bold,
                    color: const Color.fromARGB(255, 189, 13, 1),
                  ),
                  Divider(
                    color: AppColors.fontColor,
                    thickness: 2.5,
                    endIndent: Get.width * 0.25,
                    indent: Get.width * 0.2,
                    height: 0,
                  ),
                  buildHeightSpace(0.04),
                  GetBuilder<CreateUserVeiwModel>(
                    builder: (controller) => buildDrobDownBranshes2(
                      controller: controller,
                    ),
                  ),
                  buildHeightSpace(0.04),
                  AppText(
                    txt: '87'.tr,
                    size: Get.width * 0.05,
                    fw: FontWeight.bold,
                    color: const Color.fromARGB(255, 189, 13, 1),
                  ),
                  Divider(
                    color: AppColors.fontColor,
                    thickness: 2.5,
                    endIndent: Get.width * 0.25,
                    indent: Get.width * 0.2,
                    height: 0,
                  ),
                  buildHeightSpace(0.04),
                  TxtFrmFeild.buildRentTxtForm(
                      controller: controller.salaryCont),
                  AppText(
                    txt: '88'.tr,
                    size: Get.width * 0.05,
                    fw: FontWeight.bold,
                    color: const Color.fromARGB(255, 189, 13, 1),
                  ),
                  Divider(
                    color: AppColors.fontColor,
                    thickness: 2.5,
                    endIndent: Get.width * 0.25,
                    indent: Get.width * 0.2,
                    height: 0,
                  ),
                  buildHeightSpace(0.04),
                  GetBuilder<CreateUserVeiwModel>(
                    builder: (controller) => buildDrobDown(
                      controller: controller,
                    ),
                  ),
                  buildHeightSpace(0.04),
                  CustomButton(
                    ontap: () async {
                      if (_key.currentState!.validate()) {
                        await controller.signUp();
                      }
                    },
                    txt: '84'.tr,
                  ),
                  buildHeightSpace(0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
