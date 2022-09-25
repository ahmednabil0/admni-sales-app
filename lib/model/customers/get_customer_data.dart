import 'package:cloud_firestore/cloud_firestore.dart';

import '../../main.dart';
import 'customer_model.dart';

class CustomerData {
  CollectionReference emRef =
      FirebaseFirestore.instance.collection('customers');
  List<CustomerModel> customerList = [];
  Future<List<CustomerModel>> getCustomerData(String query) async {
    await emRef
        .where('companyName', isEqualTo: sharedpref!.getString('company'))
        .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .where('custName', isGreaterThanOrEqualTo: query)
        .where('custName', isLessThan: '${query}z')
        .orderBy('custName', descending: false)
        .get()
        .then((value) {
      for (var i in value.docs) {
        customerList.add(CustomerModel.fromMap(i));
      }
    });
    return customerList;
  }

  Future<List<CustomerModel>> getIlegalCustomerData() async {
    await emRef
        .where('companyName', isEqualTo: sharedpref!.getString('company'))
        .where('companyId', isEqualTo: sharedpref!.getInt('id'))
        .where('rent_value', isGreaterThan: 0)
        .orderBy('rent_value', descending: false)
        .get()
        .then((value) {
      for (var i in value.docs) {
        customerList.add(CustomerModel.fromMap(i));
      }
    });
    return customerList;
  }
}
