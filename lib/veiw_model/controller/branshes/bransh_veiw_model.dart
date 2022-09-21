import 'package:get/get.dart';

import '../../../model/branches/branch_model.dart';
import '../../../model/branches/get_bransh_data.dart';

class BranshVeiwModel extends GetxController {
  // get bransh data
  // start
  List<BranshModel> _branshList = [];
  Future<void> getData() async {
    _branshList = await BranshData().fetchBranshData();

    update();
  }

  List<BranshModel> get branshList => _branshList;
  //end
}
