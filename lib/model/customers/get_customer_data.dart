import 'package:cloud_firestore/cloud_firestore.dart';

import '../../main.dart';
import 'customer_model.dart';

class CustomerData {
  CollectionReference emRef =
      FirebaseFirestore.instance.collection('customers');
  List<CustomerModel> customerList = [];
  Future<List<CustomerModel>> getCustomerData() async {
    await emRef
        .where('companyName', isEqualTo: sharedpref!.getString('company'))
        .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .get()
        .then((value) {
      for (var i in value.docs) {
        customerList.add(CustomerModel.fromMap(i));
      }
    });
    return customerList;
  }
}
