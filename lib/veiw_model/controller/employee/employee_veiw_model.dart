import 'package:get/state_manager.dart';

import '../../../model/users/get_user_data.dart';
import '../../../model/users/user_model.dart';

class EmployeeVeiwModel extends GetxController {
  // get user data
  //start
  List<UserModel> _userData = [];
  Future<void> fetchUserData() async {
    _userData = await UserData().getUserData();
    update();
  }

  List<UserModel> get userData => _userData;
  //end
  @override
  void onInit() async {
    await fetchUserData();
    super.onInit();
  }
}
