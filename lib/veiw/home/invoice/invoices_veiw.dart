import 'package:admin_new_app/veiw/components/public_widgets/app_bar.dart';
import 'package:admin_new_app/veiw/components/public_widgets/back_ground.dart';
import 'package:admin_new_app/veiw/components/public_widgets/spaces.dart';
import 'package:admin_new_app/veiw/components/widgets/cust_card.dart';
import 'package:admin_new_app/veiw_model/controller/invoice/invoices_veiw_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/widgets/built_invoice_card.dart';
import '../../components/widgets/search_cust.dart';

class InvoicesVeiw extends GetWidget<InvoicesVeiwModel> {
  InvoicesVeiw({super.key});
  @override
  final controller = Get.put(InvoicesVeiwModel());
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
              buildHeightSpace(0.02),
              controller.buildDateTxtFormCust(context),
              Expanded(child: buildInvoiceCard())
            ],
          ),
        ),
      ),
    );
  }
}
