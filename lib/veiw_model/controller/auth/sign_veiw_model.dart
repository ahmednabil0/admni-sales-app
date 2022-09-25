import 'package:admin_new_app/main.dart';
import 'package:admin_new_app/veiw/components/circlar_method.dart';
import 'package:admin_new_app/veiw/home/home_veiw.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignInCompanyVeiwModel extends GetxController {
  bool opscur = true;
  void isops() {
    opscur = !opscur;
    update();
  }

  // // sign up
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  Future<void> signIn(String email, String password) async {
    showCircular();
    try {
      // ignore: unused_local_variable
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        await ref
            .where('id', isEqualTo: firebaseAuth.currentUser!.uid)
            .get()
            .then((value) {
          if (value.docs[0]['permision'] == 'manger') {
            Get.snackbar('Ok', 'sucess Sign in');
            sharedpref!.remove('id');
            sharedpref!.remove('company');
            sharedpref!.setString('company', value.docs[0]['companyName']);
            sharedpref!.setInt('id', value.docs[0]['companyId']);
            Get.off(() => const HomePageVeiw());
          }
        });
      }
      // ignore: unnecessary_null_comparison

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('erreo', 'user not found');
        Get.back();
      } else if (e.code == 'wrong-password') {
        Get.snackbar('error', 'wrong password');
        Get.back();
      }
    }
  }
  //   // ignore: unnecessary_null_comparison

}
