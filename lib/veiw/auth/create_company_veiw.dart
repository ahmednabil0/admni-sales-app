import 'sign_in_veiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../veiw_model/controller/auth/create_company_veiw_model.dart';
import '../components/public_widgets/back_ground.dart';
import '../components/public_widgets/bttons.dart';
import '../components/public_widgets/custom_text.dart';
import '../components/public_widgets/spaces.dart';
import '../components/txt_frm_feilds/txt_forms.dart';
import '../helper/consts/colors.dart';

class CreateCompanyVeiw extends GetWidget<CreateCompanyVeiwModel> {
  CreateCompanyVeiw({super.key});
  @override
  final controller = Get.put(CreateCompanyVeiwModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGround(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeightSpace(0.08),
                Image.asset('assets/images/Apartment.png'),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildWirthSpace(0.08),
                          AppText(
                            txt: 'اسم الشركة',
                            size: Get.width * 0.045,
                            fw: FontWeight.bold,
                            color: AppColors.backgroundColor,
                          ),
                        ],
                      ),
                      TxtFrmFeild.buildCompanyNameTxtForm(
                        controller: controller.companyNameCont,
                        hint: 'ادخل اسم الشركة'.tr,
                        icon: Icons.home_work_outlined,
                      ),
                      buildHeightSpace(0.031),
                      Row(
                        children: [
                          buildWirthSpace(0.08),
                          AppText(
                            txt: 'تاريخ الانشاء',
                            size: Get.width * 0.045,
                            fw: FontWeight.bold,
                            color: AppColors.backgroundColor,
                          ),
                        ],
                      ),
                      TxtFrmFeild.buildCompanyNameTxtForm(
                        controller: controller.craeteDateCont,
                        hint: 'تاريخ الانشاء'.tr,
                        icon: Icons.home_work_outlined,
                      ),
                    ],
                  ),
                ),
                buildHeightSpace(0.1),
                CustomButton3(
                  ontap: () async {
                    if (_key.currentState!.validate()) {
                      await controller.createCompany();
                    }
                  },
                  txt: 'انشاء الشركة ',
                ),
                buildHeightSpace(0.1),
                InkWell(
                  onTap: () {
                    Get.to(() => SignInVeiw());
                  },
                  child: AppText(
                    txt: 'تسجيل دخول',
                    size: Get.width * 0.045,
                    fw: FontWeight.bold,
                    color: AppColors.backgroundColor,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: AppColors.backgroundColor,
                  height: 0,
                  indent: Get.width * 0.35,
                  endIndent: Get.width * 0.35,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
