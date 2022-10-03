import 'dart:math';

import 'package:admin_new_app/main.dart';
import 'package:admin_new_app/model/customers/customer_model.dart';
import 'package:admin_new_app/model/customers/get_customer_data.dart';
import 'package:admin_new_app/model/invoices/invoice_model.dart';
import 'package:admin_new_app/veiw/components/circlar_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../model/items/get_items_data.dart';
import '../../../model/items/item_model.dart';

class CreateInvoiceVeiwModel extends GetxController {
  TextEditingController txtCont = TextEditingController();
  TextEditingController txtCCont = TextEditingController();
  TextEditingController payedCont = TextEditingController();
  TextEditingController rentCont = TextEditingController();
  TextEditingController vatCont = TextEditingController();
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
    rentCont.text = total.toStringAsFixed(2);

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
      total = total + (double.parse(vatCont.text) * total);
      rentCont.text = (total - double.parse(payedCont.text)).toString();
    }
    update();
  }

  // bottom sheet
  //start
  String? dateTime;
  String? dueDate;
  CollectionReference ref = FirebaseFirestore.instance.collection('invoicesAA');
  List<Map> products = [];
  Future<void> uploadInvoice() async {
    for (var element in selectedList) {
      products.add(element.toMap());
    }
    showCircular();
    DateTime date = DateTime.now();
    dateTime = Jiffy(date).format("yyyy/MM/dd");
    DateTime due = DateTime.now().add(const Duration(days: 7));
    dueDate = Jiffy(due).format("yyyy/MM/dd");
    Random random = Random();
    int min = 10;
    int max = 1000000000;
    int min2 = 1000;
    int max2 = 100000000;

    int result = min + random.nextInt(max - min) + random.nextInt(max2 - min2);
    await ref.doc().set(InvoiceModel(
            id: result,
            date: dateTime!,
            dueDate: dueDate!,
            total: total,
            customerName: selectedCList[0].custName,
            salesId: sharedpref!.getString('salesId')!,
            company: sharedpref!.getString('company')!,
            uploaded: 1,
            items: products,
            vat: double.parse(vatCont.text.trim()),
            delivery: 0.0,
            payed: double.parse(payedCont.text.trim()),
            rent: double.parse(rentCont.text.trim()))
        .toMap());
    Get.back();
    Get.back();
    Get.back();
    Get.back();
  }

  @override
  void onInit() {
    rentCont.text = '0.0';
    payedCont.text = '0.0';
    vatCont.text = '0.0';
    super.onInit();
  }
  //end
}
