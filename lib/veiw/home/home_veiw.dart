import '../../model/app_data/operation_date.dart';
import '../components/public_widgets/back_ground.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/public_widgets/custom_text.dart';
import '../helper/consts/colors.dart';

class HomePageVeiw extends StatelessWidget {
  const HomePageVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: Icon(
            Icons.menu_rounded,
            color: AppColors.backgroundColor,
            size: Get.width * 0.07,
          ),
          actions: [
            Icon(
              Icons.more_vert_rounded,
              color: AppColors.backgroundColor,
              size: Get.width * 0.07,
            ),
          ],
          title: RichText(
            text: TextSpan(
              style: TextStyle(
                  color: AppColors.backgroundColor,
                  fontSize: Get.width * 0.05,
                  fontWeight: FontWeight.w900),
              children: const <TextSpan>[
                TextSpan(text: 'Admin '),
                TextSpan(
                    text: 'Sales',
                    style: TextStyle(
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                  text: ' Rep',
                )
              ],
            ),
          )),
      body: createBackGroundHome(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(Get.width * 0.03),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: Get.width * 0.05,
                      mainAxisSpacing: Get.width * 0.05,
                      childAspectRatio: Get.width * 0.36 / Get.width * 3.4),
                  itemCount: SalesAppData.appDataList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int i) {
                    return InkWell(
                      onTap: SalesAppData.appDataList[i].ontap,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(
                              Get.width * 0.06,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: AppColors.fontColor.withOpacity(0.5),
                                  offset: const Offset(5, 5))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              SalesAppData.appDataList[i].icon,
                              color: i.isEven
                                  ? AppColors.fontColor
                                  : AppColors.primaryColor,
                              size: Get.width * 0.135,
                            ),
                            SizedBox(
                              height: Get.width * 0.025,
                            ),
                            AppText(
                              txt: SalesAppData.appDataList[i].type,
                              size: Get.width * 0.038,
                              fw: FontWeight.bold,
                              color: i.isOdd
                                  ? AppColors.fontColor
                                  : AppColors.primaryColor.withOpacity(0.8),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
