import 'package:get/get.dart';

import '../controller/auth/create_company_veiw_model.dart';
import '../localization/local_veiw_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLocalController());
    Get.lazyPut(() => CreateCompanyVeiwModel());
  }
}
