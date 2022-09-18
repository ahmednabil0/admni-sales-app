import 'package:admin_new_app/veiw_model/controller/auth/create_company_veiw_model.dart';
import 'package:get/get.dart';

import '../localization/local_veiw_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLocalController());
    Get.lazyPut(() => CreateCompanyVeiwModel());
  }
}
