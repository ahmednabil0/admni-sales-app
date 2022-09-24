import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../model/customers/customer_model.dart';
import '../../../model/customers/get_customer_data.dart';

class IllgCustomersVeiwModel extends GetxController {
  final TextEditingController queryCont = TextEditingController();
  // get customer data
  //start
  List<CustomerModel> _custData = [];
  Future<void> fetchUserData() async {
    _custData.clear();
    _custData = await CustomerData().getIlegalCustomerData();
    update();
  }

  List<CustomerModel> get userData => _custData;
  //end
  @override
  void onInit() async {
    await fetchUserData();
    super.onInit();
  }
}
