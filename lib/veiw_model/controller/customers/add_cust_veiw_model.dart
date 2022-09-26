import 'package:admin_new_app/model/customers/customer_model.dart';
import 'package:admin_new_app/veiw/components/circlar_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

import '../../../main.dart';

class AddCustVeiwModel extends GetxController {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();
  String dialCodeInitial = '+20';
  CountryCode? selected;
  void selcted(CountryCode code) {
    if (code.dialCode != null) {
      dialCodeInitial = code.dialCode!;
    } else {
      // ignore: avoid_returning_null_for_void
      return null;
    }
    update();
  }

  createRandom() {
    String i = randomAlphaNumeric(20).toString();
    return i;
  }

  CollectionReference ref = FirebaseFirestore.instance.collection('customers');

  Future<void> uploadCustomers() async {
    showCircular();
    String d = createRandom();
    await ref.doc(d).set(CustomerModel(
          cid: d,
          companyId: sharedpref!.getInt('id')!,
          companyName: sharedpref!.getString('company')!,
          custName: nameCont.text,
          phone: '$dialCodeInitial ${phoneCont.text}',
          rent: 0,
          rent_value: 0.0,
        ).toMap());

    Get.back();
    Get.snackbar('عملية ناجحة', 'تمت عمليه اضافة عميل بنجاح');
    phoneCont.clear();
    nameCont.clear();
  }
}
