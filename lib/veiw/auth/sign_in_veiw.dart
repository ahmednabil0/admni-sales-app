import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../veiw_model/controller/auth/sign_veiw_model.dart';
import '../components/public_widgets/back_ground.dart';
import '../components/public_widgets/bttons.dart';
import '../components/public_widgets/custom_text.dart';
import '../components/public_widgets/spaces.dart';
import '../components/txt_frm_feilds/txt_forms.dart';
import '../helper/consts/colors.dart';
import 'create_company_veiw.dart';

class SignInVeiw extends GetWidget<SignInCompanyVeiwModel> {
  SignInVeiw({super.key});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController userCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final controlller = Get.put(SignInCompanyVeiwModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGround2(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeightSpace(0.1),
                Image.asset('assets/images/Apartment.png'),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildWirthSpace(0.08),
                          AppText(
                            txt: 'اسم المستخدم',
                            size: Get.width * 0.045,
                            fw: FontWeight.bold,
                            color: AppColors.backgroundColor,
                          ),
                        ],
                      ),
                      TxtFrmFeild.buildCompanyNameTxtForm(
                        controller: userCont,
                        hint: 'ادخل اسم المستخدم'.tr,
                        icon: Icons.person_outlined,
                      ),
                      buildHeightSpace(0.031),
                      Row(
                        children: [
                          buildWirthSpace(0.08),
                          AppText(
                            txt: 'كلمة المرور',
                            size: Get.width * 0.045,
                            fw: FontWeight.bold,
                            color: AppColors.backgroundColor,
                          ),
                        ],
                      ),
                      GetBuilder<SignInCompanyVeiwModel>(
                        builder: (controller) =>
                            TxtFrmFeild.buildpasswordTxtForm(
                                controller: passwordCont,
                                obs: controller.opscur,
                                onPressed: () {
                                  controlller.isops();
                                }),
                      ),
                    ],
                  ),
                ),
                buildHeightSpace(0.1),
                CustomButton3(
                  ontap: () async {
                    if (_key.currentState!.validate()) {
                      await controlller.signIn(
                          userCont.text.trim(), passwordCont.text.trim());
                    }
                  },
                  txt: 'تسجيل دخول',
                ),
                buildHeightSpace(0.1),
                InkWell(
                  onTap: () {
                    Get.to(() => CreateCompanyVeiw());
                  },
                  child: AppText(
                    txt: 'انشاء شركة',
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
