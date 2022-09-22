import 'package:cloud_firestore/cloud_firestore.dart';

import '../../main.dart';
import 'branch_model.dart';

class BranshData {
  CollectionReference brRef = FirebaseFirestore.instance.collection('branshes');

  List<BranshModel> branshList = [];
  Future<List<BranshModel>> fetchBranshData() async {
    await brRef
        .where('companyName', isEqualTo: sharedpref!.getString('company'))
        .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .get()
        .then((value) {
      for (var i in value.docs) {
        branshList.add(BranshModel.fromMap(i));
      }
    });
    return branshList;
  }
}
