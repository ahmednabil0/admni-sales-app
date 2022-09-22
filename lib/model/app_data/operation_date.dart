import 'package:admin_new_app/veiw/home/branshes/bransh_veiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../veiw/home/customers/bottom_nav_veiw.dart';
import '../../veiw/home/employees/Employee_veiw.dart';
import '../../veiw/home/item/item_veiw.dart';
import 'home_card_model.dart';

class SalesAppData {
  static List<HomeCardModel> appDataList = [
    HomeCardModel(type: '11'.tr, ontap: () {}, icon: Icons.date_range_outlined),
    HomeCardModel(
        type: '12'.tr, ontap: () {}, icon: Icons.description_outlined),
    HomeCardModel(type: '13'.tr, ontap: () {}, icon: Icons.get_app_outlined),
    HomeCardModel(
        type: '14'.tr, ontap: () {}, icon: Icons.assignment_return_outlined),
    HomeCardModel(type: '15'.tr, ontap: () {}, icon: Icons.addchart_sharp),
    HomeCardModel(type: '16'.tr, ontap: () {}, icon: Icons.fact_check_outlined),
    HomeCardModel(
        type: '75'.tr,
        ontap: () {
          Get.to(() => EmployeeVeiw());
        },
        icon: Icons.person_add),
    HomeCardModel(
        type: '76'.tr,
        ontap: () {
          Get.to(() => const BottomNavBarCust());
        },
        icon: Icons.person_search_sharp),
    HomeCardModel(
        type: '90'.tr,
        ontap: () {
          Get.to(() => BranshVeiw());
        },
        icon: Icons.home_work),
    HomeCardModel(
        type: '91'.tr,
        ontap: () {
          Get.to(() => ItemVeiw());
        },
        icon: Icons.local_grocery_store_outlined),
  ];
}
