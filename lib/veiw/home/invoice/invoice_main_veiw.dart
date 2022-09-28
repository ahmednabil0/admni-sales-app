import 'package:admin_new_app/veiw/components/public_widgets/app_bar.dart';
import 'package:admin_new_app/veiw/components/public_widgets/back_ground.dart';
import 'package:admin_new_app/veiw/components/public_widgets/bttons.dart';
import 'package:admin_new_app/veiw/components/public_widgets/spaces.dart';
import 'package:admin_new_app/veiw/home/invoice/craete_invoice_veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'invoices_veiw.dart';

class InvoiceMainVeiw extends StatelessWidget {
  const InvoiceMainVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBackGroundHome(
        child: SafeArea(
          child: Column(
            children: [
              buildAppBar(
                txt: '12'.tr,
              ),
              buildHeightSpace(
                0.3,
              ),
              SvgPicture.asset(
                'assets/svg/invoice-bill-svgrepo-com (1).svg',
                height: Get.width * 0.4,
              ),
              buildHeightSpace(
                0.2,
              ),
              CustomButton(
                ontap: () {
                  Get.to(() => InvoicesVeiw());
                },
                txt: '12'.tr,
              ),
              buildHeightSpace(
                0.03,
              ),
              CustomButton(
                ontap: () {
                  Get.to(() => CreateInvoiceVeiw());
                },
                txt: '99'.tr,
              ),
              buildHeightSpace(
                0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
