import 'package:admin_new_app/model/branches/branch_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BranshData {
  CollectionReference brRef = FirebaseFirestore.instance.collection('branshes');

  List<BranshModel> userList = [];
  Future<List<BranshModel>> fetchBranshData() async {
    await brRef.get().then((value) {
      for (var i in value.docs) {
        userList.add(BranshModel.fromMap(i));
      }
    });
    return userList;
  }
}
