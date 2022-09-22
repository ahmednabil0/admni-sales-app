import 'package:get/get.dart';

import '../controller/auth/create_company_veiw_model.dart';
import '../controller/auth/sign_veiw_model.dart';
import '../controller/branshes/bransh_veiw_model.dart';
import '../controller/customers/customer_veiw_model.dart';
import '../controller/employee/create_user_veiw_model.dart';
import '../controller/employee/employee_veiw_model.dart';
import '../controller/items/item_data_veiw_model.dart';
import '../localization/local_veiw_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyLocalController());
    Get.lazyPut(() => CreateCompanyVeiwModel());
    Get.lazyPut(() => CustomerVeiwModel());
    Get.lazyPut(() => CreateUserVeiwModel());
    Get.lazyPut(() => ItemVeiwModel());
    Get.lazyPut(() => EmployeeVeiwModel());
    Get.lazyPut(() => BranshVeiwModel());
    Get.lazyPut(() => SignInCompanyVeiwModel());
  }
}
