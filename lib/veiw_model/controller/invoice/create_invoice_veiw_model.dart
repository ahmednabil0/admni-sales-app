import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../model/items/get_items_data.dart';
import '../../../model/items/item_model.dart';

class CreateInvoiceVeiwModel extends GetxController {
  TextEditingController txtCont = TextEditingController();
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
    txtCont.text == '';
    update();
  }

  List<ItemModel> get itemData => _itemData;
  List<ItemModel> selectedList = [];
  //end

  void add(int i) {
    selectedList[i].quntity++;
    update();
  }

  void sub(int i) {
    if (selectedList[i].quntity > 1) {
      selectedList[i].quntity--;
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
      TextEditingController deliveryCont = TextEditingController();
      TextEditingController vatCont = TextEditingController();
      total = total +
          double.parse(deliveryCont.text) +
          (double.parse(vatCont.text) * total);
    }
    update();
  }
}
