import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_model.dart';

class ItemData {
  CollectionReference emRef = FirebaseFirestore.instance.collection('products');
  List<ItemModel> itemList = [];
  Future<List<ItemModel>> getItemData() async {
    await emRef
        // .where('companyName', isEqualTo: sharedpref!.getString('company'))
        // .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .get()
        .then((value) {
      for (var i in value.docs) {
        itemList.add(ItemModel.fromMap(i));
      }
    });
    return itemList;
  }
}
