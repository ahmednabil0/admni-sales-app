import 'package:admin_new_app/model/invoices/get_invoice_data.dart';
import 'package:admin_new_app/model/invoices/invoice_model.dart';
import 'package:admin_new_app/veiw/components/public_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../veiw/helper/consts/colors.dart';

class InvoicesVeiwModel extends GetxController {
  // get Invoices data
  //start
  List<InvoiceModel> _invoiceData = [];
  Future<void> fetchInvoiceData() async {
    _invoiceData.clear();
    _invoiceData = await InvoicesDate().getInvoicesData();
    update();
  }

  List<InvoiceModel> get invoiceData => _invoiceData;
  Future<void> fetchInvoiceDataSe(String q) async {
    _invoiceData.clear();
    _invoiceData = await InvoicesDate().getInvoicesDataSearch(q.trim());
    update();
  }

  //end
  //end

  // date picker
  //start
  final TextEditingController dateCont = TextEditingController();

  Row buildDateTxtFormCust(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GetBuilder<InvoicesVeiwModel>(
          builder: (controller) => Container(
            alignment: Alignment.center,
            height: Get.width * 0.115,
            width: Get.width * 0.2,
            decoration: BoxDecoration(
                color: AppColors.seconrayColor,
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child: AppText(
              txt: invoiceData.length.toString(),
              size: Get.width * 0.04,
              fw: FontWeight.w800,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.55,
          child: TextFormField(
            controller: dateCont,
            textAlign: TextAlign.center,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '5'.tr;
              }
              return null;
            },
            readOnly: true,
            onTap: () async {
              DateTime? date = await showDatePicker(
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.red,
                        primaryColorDark:
                            AppColors.primaryColor.withOpacity(0.5),
                        accentColor: Colors.blueAccent,
                        cardColor: AppColors.primaryColor.withOpacity(0.4),
                      ),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child!,
                  );
                },
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (date == null) {
                dateCont.clear();
              }
              if (date != null) {
                dateCont.text = Jiffy(date).format("yyyy/MM/dd");
              }
            },
            style: const TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              hintText: '39'.tr,
              hintStyle: TextStyle(
                fontSize: Get.width * 0.04,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor.withOpacity(0.5),
              ),
              prefixIcon: const Icon(
                Icons.date_range_outlined,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            await fetchInvoiceDataSe(dateCont.text);
          },
          child: CircleAvatar(
            backgroundColor: AppColors.seconrayColor,
            child: const Icon(
              Icons.content_paste_search,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
      ],
    );
  }

  //end
  @override
  void onInit() async {
    await fetchInvoiceData();

    super.onInit();
  }
}
