import 'package:get/get.dart';

class SignInCompanyVeiwModel extends GetxController {
  bool opscur = true;
  void isops() {
    opscur = !opscur;
    update();
  }
}
