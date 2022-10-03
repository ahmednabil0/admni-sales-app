import 'package:admin_new_app/model/customers/customer_model.dart';
import 'package:admin_new_app/model/customers/get_customer_data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../model/items/get_items_data.dart';
import '../../../model/items/item_model.dart';
import '../../../veiw/components/public_widgets/custom_text.dart';
import '../../../veiw/components/public_widgets/spaces.dart';
import '../../../veiw/components/txt_frm_feilds/txt_forms.dart';
import '../../../veiw/components/widgets/search_cust.dart';
import '../../../veiw/helper/consts/colors.dart';

class CreateInvoiceVeiwModel extends GetxController {
  TextEditingController txtCont = TextEditingController();
  TextEditingController txtCCont = TextEditingController();
  // get item data
  //start
  List<ItemModel> _itemData = [];
  Future<void> fetchItemData(String q) async {
    _itemData.clear();
    _itemData = await ItemData().getItemDataSearch(q);
    // ignore: avoid_print
    print(_itemData);

    update();
  }

  void addToSL(ItemModel model) {
    if (!selectedList.contains(model)) {
      selectedList.add(model);
    }
    calTotal();

    txtCont.text == '';
    update();
  }

  List<ItemModel> get itemData => _itemData;
  List<ItemModel> selectedList = [];
  //end

// get Customer data
  //start
  List<CustomerModel> _custData = [];
  Future<void> fetchcustData(String q) async {
    _custData.clear();
    _custData = await CustomerData().getCustomerData(q);
    // ignore: avoid_print
    print(_custData);

    update();
  }

  void addToCL(CustomerModel model) {
    if (!selectedCList.contains(model)) {
      selectedCList.clear();
      selectedCList.add(model);
    }
    calTotal();

    txtCCont.text = selectedCList[0].custName;
    update();
  }

  List<CustomerModel> get custData => _custData;
  List<CustomerModel> selectedCList = [];
  //end
  void add(int i) {
    selectedList[i].quntity++;
    calTotal();

    update();
  }

  void sub(int i) {
    if (selectedList[i].quntity > 1) {
      selectedList[i].quntity--;
      calTotal();
    }
    update();
  }

  double total = 0.0;
  void calTotal() {
    if (selectedList.isNotEmpty) {
      total = 0.0;
      for (ItemModel element in selectedList) {
        total = total + (element.price * element.quntity);
      }
      // TextEditingController deliveryCont = TextEditingController();
      // TextEditingController vatCont = TextEditingController();
      // total = total +
      //     double.parse(deliveryCont.text) +
      //     (double.parse(vatCont.text) * total);
    }
    update();
  }

  // bottom sheet
  //start
  void shoeBottomSheet() {
    Get.bottomSheet(
      Container(
          height: Get.width * 2,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Get.width * 0.1),
              topRight: Radius.circular(Get.width * 0.1),
            ),
          ),
          child: Column(
            children: [
              Divider(
                thickness: 4,
                height: Get.width * 0.05,
                color: AppColors.fontColor.withOpacity(0.3),
                endIndent: Get.width * 0.4,
                indent: Get.width * 0.4,
              ),
              buildHeightSpace(0.02),
              GetBuilder<CreateInvoiceVeiwModel>(
                  builder: (controller) =>
                      buildSarchCustomersC(controller.txtCCont)),
              Expanded(
                  child: Stack(
                children: [
                  GetBuilder<CreateInvoiceVeiwModel>(
                    builder: (controller) => controller.custData.isEmpty
                        ? const SizedBox()
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.08,
                                vertical: Get.width * 0.01),
                            itemCount: controller.custData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.02,
                                    vertical: Get.width * 0.005),
                                child: ListTile(
                                    onTap: () async {
                                      await AudioPlayer().play(
                                        AssetSource(
                                          'audio/beeb.mp3',
                                        ),
                                      );
                                      // await AudioPlayer().stop();
                                      controller
                                          .addToCL(controller.custData[index]);
                                      controller.custData.clear();
                                    },
                                    selectedTileColor: AppColors.seconrayColor,
                                    hoverColor: AppColors.primaryColor,
                                    title: AppText(
                                      txt:
                                          '${controller.custData[index].custName}       ${controller.custData[index].phone}',
                                      size: Get.width * 0.03,
                                      fw: FontWeight.w800,
                                      color: AppColors.fontColor,
                                    ),
                                    leading: const Icon(Icons.person)),
                              );
                            },
                          ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Get.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TxtFrmFeild.buildPayedTxtForm(
                            controller: TextEditingController()),
                        TxtFrmFeild.buildrentTxtForm(
                            controller: TextEditingController())
                      ],
                    ),
                  )
                ],
              ))
            ],
          )),
      barrierColor: Colors.black.withOpacity(0.2),
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      backgroundColor: Colors.transparent,
      enableDrag: true,
    );
  }
  //end
}
