import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../../model/branches/branch_model.dart';
import '../../../model/branches/get_bransh_data.dart';
import '../../../veiw/components/circlar_method.dart';
import '../../../veiw/home/employees/emp_data_veiw.dart';
import '../../../veiw/home/home_veiw.dart';

class CreateUserVeiwModel extends GetxController {
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController phoneCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController salaryCont = TextEditingController();
  bool opscur = true;
  void isops() {
    opscur = !opscur;
    update();
  }

  String? intailData;
  String? intailData2;
  List<String> dataList2 = ['sales', 'manger (Disabled)', 'branshManger'];
  oncganged(String? val) {
    intailData = val.toString();
    update();
  }

  oncganged2(String? val) {
    intailData2 = val.toString();
    update();
  }

  List<String> dataList = [];

  // get bransh data
  // start
  List<BranshModel> _branshList = [];
  Future<void> getData() async {
    _branshList = await BranshData().fetchBranshData();
    for (var element in _branshList) {
      dataList.add('${element.bransh}/${element.branshId}');
    }
    update();
  }

  List<BranshModel> get branshList => _branshList;
  //end

  // create user
  //start
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  Future<void> signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCont.text,
        password: passwordCont.text,
      );
      // ignore: unnecessary_null_comparison
      if (userCredential != null) {
        showCircular();
        await userRef.doc(firebaseAuth.currentUser!.uid).set({
          'id': firebaseAuth.currentUser!.uid,
          'name': nameCont.text,
          'email': emailCont.text,
          'password': passwordCont.text,
          'lat': 0.0,
          'long': 0.0,
          'companyName': sharedpref!.getString('company'),
          'companyId': sharedpref!.getInt('id'),
          'personalSales': double.parse(salaryCont.text),
          'isActive': true,
          'phone': phoneCont.text,
          'permision': intailData2,
          'branchId': int.parse(intailData!.split('/').last.trim()),
        });
        await Future.delayed(const Duration(milliseconds: 250));
        Get.back();
        Get.off(
          () => EmpDataVeiw(
            number: phoneCont.text.trim(),
            user: emailCont.text.trim(),
            pass: passwordCont.text.trim(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('sorry', 'Weak password');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('sorry', 'invalid email');
      }
    } catch (e) {
      Get.snackbar(
        'sorry',
        e.toString(),
      );
    }
  }

  //end

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }
}
