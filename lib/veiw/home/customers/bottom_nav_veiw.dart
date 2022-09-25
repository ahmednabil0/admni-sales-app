import 'add_customer_veiw.dart';
import 'customer_veiw.dart';
import 'illegal_cust_veiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../helper/consts/colors.dart';

class BottomNavBarCust extends StatefulWidget {
  const BottomNavBarCust({super.key});

  @override
  State<BottomNavBarCust> createState() => _BottomNavBarCustState();
}

class _BottomNavBarCustState extends State<BottomNavBarCust> {
  int currenntIndex = 0;
  List<Widget> bodyList = [
    Customersveiw(),
    IllegalCustomers(),
    AddCustomerVeiw()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: bodyList[currenntIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Get.width * 0.08,
            ),
            topRight: Radius.circular(
              Get.width * 0.08,
            ),
          ),
        ),
        padding: EdgeInsets.all(Get.width * .025),
        child: GNav(
          haptic: true,
          textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Get.width * .045,
              color: AppColors.backgroundColor),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          hoverColor: AppColors.primaryColor,
          tabBackgroundGradient: LinearGradient(colors: [
            AppColors.primaryColor,
            AppColors.seconrayColor.withOpacity(0.7)
          ]),
          curve: Curves.easeInToLinear,
          duration: const Duration(milliseconds: 200),
          color: Colors.grey.withOpacity(0.8),
          padding: EdgeInsets.symmetric(
              vertical: Get.height * 4 / 812, horizontal: Get.height * 4 / 812),
          tabBackgroundColor: AppColors.seconrayColor.withOpacity(0.5),
          tabActiveBorder: Border.all(
              color: AppColors.primaryColor.withOpacity(0.1), width: 2.3),
          iconSize: Get.width * 0.07,
          activeColor: AppColors.backgroundColor,
          gap: Get.width * 0.04,
          tabBorderRadius: Get.height * 20.5 / 812,
          selectedIndex: currenntIndex,
          onTabChange: (index) {
            setState(() {
              currenntIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          tabs: [
            GButton(
              icon: Icons.people_sharp,
              text: '76'.tr,
            ),
            GButton(
              icon: Icons.person_remove,
              text: '95'.tr,
            ),
            GButton(
              icon: Icons.group_add_sharp,
              text: '96'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
