import 'dart:math';

import '../../../veiw/components/circlar_method.dart';
import '../../../veiw/components/public_widgets/bttons.dart';
import '../../../veiw/components/txt_frm_feilds/txt_forms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../../model/branches/branch_model.dart';
import '../../../model/branches/get_bransh_data.dart';

class BranshVeiwModel extends GetxController {
  final TextEditingController nameCont = TextEditingController();
  double? lat;
  double? long;
  int createId() {
    Random random = Random();
    int min = 10;
    int max = 1000000000;
    int min2 = 1000;
    int max2 = 100000000;

    int result = min + random.nextInt(max - min) + random.nextInt(max2 - min2);
    return result;
  }

  // get bransh data
  // start
  List<BranshModel> _branshList = [];
  Future<void> getData() async {
    _branshList = await BranshData().fetchBranshData();

    update();
  }

  List<BranshModel> get branshList => _branshList;
  //end

  // upload bransh
  //start
  CollectionReference branshRef =
      FirebaseFirestore.instance.collection('branshes');
  Future<void> uploadBransh() async {
    showCircular();
    await branshRef.doc().set(BranshModel(
          bransh: nameCont.text,
          companyId: sharedpref!.getInt('id')!,
          companyName: sharedpref!.getString('company')!,
          branshId: createId(),
          lat: lat!,
          long: long!,
        ).toMap());
    await getData();
    Get.back();
  }

  //end
  // get bransh postion
  // start
  Future getposition() async {
    LocationPermission locate;
    locate = await Geolocator.checkPermission();
    if (locate == LocationPermission.denied) {
      locate = await Geolocator.requestPermission();
    }
  }

  Future<void> getlanlong() async {
    await Geolocator.getCurrentPosition().then((value) {
      lat = value.latitude;
      long = value.longitude;
    });
  }

  // end

  //build add bransh
  //start
  void addbransh() async {
    if (lat == null && long == null) {
      showCircular();
      await getposition();
      await getlanlong();
      Get.back();
    }
    Get.defaultDialog(
        title: '',
        content: TxtFrmFeild.buildCompanyNameTxtForm(
          controller: nameCont,
          hint: 'ادخل اسم الفرع',
          icon: Icons.place_outlined,
        ),
        actions: [
          CustomButton7(
            ontap: () async {
              await uploadBransh();

              Get.back();
            },
            txt: 'craete bransh',
          )
        ]);
  }

  //end
  @override
  void onInit() async {
    await getData();
    super.onInit();
  }
}
