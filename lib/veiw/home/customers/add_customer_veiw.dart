import 'package:admin_new_app/veiw/components/public_widgets/app_bar.dart';
import 'package:admin_new_app/veiw/components/public_widgets/back_ground.dart';
import 'package:admin_new_app/veiw/components/public_widgets/bttons.dart';
import 'package:admin_new_app/veiw/components/public_widgets/spaces.dart';
import 'package:admin_new_app/veiw/helper/consts/colors.dart';
import 'package:admin_new_app/veiw_model/controller/customers/add_cust_veiw_model.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/public_widgets/custom_text.dart';
import '../../components/txt_frm_feilds/txt_forms.dart';

class AddCustomerVeiw extends GetWidget<AddCustVeiwModel> {
  AddCustomerVeiw({super.key});
  @override
  final controller = Get.put(AddCustVeiwModel());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildAppBar(txt: '96'.tr),
                buildHeightSpace(0.3),
                Container(
                  height: Get.height * 0.37,
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Get.width * 0.07),
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.seconrayColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      buildHeightSpace(0.02),
                      AppText(
                        txt: '97'.tr,
                        size: Get.width * 0.05,
                        fw: FontWeight.w500,
                        color: AppColors.backgroundColor,
                      ),
                      Divider(
                        color: AppColors.backgroundColor.withOpacity(0.5),
                        thickness: 2.5,
                        endIndent: Get.width * 0.2,
                        indent: Get.width * 0.2,
                      ),
                      buildHeightSpace(0.06),
                      Form(
                        key: _key,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.02),
                                child: TxtFrmFeild.buildCustTxtForm(
                                    controller: controller.nameCont),
                              ),
                              buildHeightSpace(0.02),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.02),
                                child: TextFormField(
                                  controller: controller.phoneCont,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "please enter your phone";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      prefixIcon: CountryListPick(
                                        useSafeArea: false,

                                        theme: CountryTheme(
                                          isShowFlag: true,
                                          isShowTitle: false,
                                          isShowCode: true,
                                          isDownIcon: true,
                                          showEnglishName: true,
                                          labelColor: Colors.blueAccent,
                                        ),
                                        initialSelection:
                                            controller.dialCodeInitial,
                                        onChanged: (CountryCode? code) {
                                          controller.selcted(code!);
                                        },
                                        // or
                                        // initialSelection: 'US'
                                      ),
                                      suffixIcon:
                                          const Icon(Icons.phone_outlined),
                                      hintText: '541 588 887',
                                      hintStyle: TextStyle(
                                          color: Colors.grey.withOpacity(0.8),
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Divider(
                        color: AppColors.backgroundColor,
                        thickness: 5,
                        height: 0,
                      ),
                      CustomButton7(
                          ontap: () async {
                            if (_key.currentState!.validate()) {
                              await controller.uploadCustomers();
                            }
                          },
                          txt: '96'.tr),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
