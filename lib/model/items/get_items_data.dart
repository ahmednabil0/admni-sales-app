import 'package:cloud_firestore/cloud_firestore.dart';

import '../../main.dart';
import 'item_model.dart';

class ItemData {
  CollectionReference emRef = FirebaseFirestore.instance.collection('products');
  List<ItemModel> itemList = [];
  Future<List<ItemModel>> getItemData() async {
    await emRef
        .where('companyName', isEqualTo: sharedpref!.getString('company'))
        .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .get()
        .then((value) {
      for (var i in value.docs) {
        itemList.add(ItemModel.fromMap(i));
      }
    });
    return itemList;
  }

  List<ItemModel> itemSearchList = [];

  Future<List<ItemModel>> getItemDataSearch(String q) async {
    await emRef
        .where('companyName', isEqualTo: sharedpref!.getString('company'))
        .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .where('name', isGreaterThanOrEqualTo: q)
        .where('name', isLessThan: '${q}z')
        .get()
        .then((value) {
      for (var i in value.docs) {
        itemList.add(ItemModel.fromMap(i));
      }
    });
    if (q.trim() == '') {
      itemList.clear();
    }
    return itemList;
  }
}
