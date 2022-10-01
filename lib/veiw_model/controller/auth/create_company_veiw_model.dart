import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../main.dart';

class CreateCompanyVeiwModel extends GetxController {
  // varaibles
  //start
  final TextEditingController companyNameCont = TextEditingController();
  final TextEditingController craeteDateCont = TextEditingController();
  DateTime date = DateTime.now();
  //end

  // create id
  //start
  int createId() {
    Random random = Random();
    int min = 10;
    int max = 1000000000;
    int min2 = 1000;
    int max2 = 100000000;

    int result = min + random.nextInt(max - min) + random.nextInt(max2 - min2);
    return result;
  }

  //end

  // create company
  //start
  CollectionReference companyRef =
      FirebaseFirestore.instance.collection('company');
  Future<void> createCompany() async {
    int i = createId();

    await companyRef.doc().set({
      "name": companyNameCont.text,
      "createDate": date,
      "id": i,
      "logo": '',
    });
    sharedpref!.setString('company', companyNameCont.text);
    sharedpref!.setInt('id', i);
  }

  //end
  String local = sharedpref!.getString('lang') == 'en' ? 'en' : 'ar';
  @override
  void onInit() async {
    // await Jiffy.locale(local);
    craeteDateCont.text =
        Jiffy(date).format('MM/dd/yyyy  يوم : EEE   الساعة :  h:mm a');
    super.onInit();
  }
}
