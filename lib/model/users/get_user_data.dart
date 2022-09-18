import '../../main.dart';
import 'user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  CollectionReference emRef = FirebaseFirestore.instance.collection('users');
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserData() async {
    await emRef
        .where('companyName', isEqualTo: sharedpref!.getString('company'))
        .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .get()
        .then((value) {
      for (var i in value.docs) {
        userList.add(UserModel.fromMap(i));
      }
    });
    return userList;
  }
}
