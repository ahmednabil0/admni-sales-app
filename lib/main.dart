import 'veiw/home/home_veiw.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'veiw/auth/create_company_veiw.dart';
import 'veiw/helper/theme/theme.dart';
import 'veiw_model/localization/local.dart';
import 'veiw_model/localization/local_veiw_model.dart';

SharedPreferences? sharedpref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.intaillocal,
      translations: MyLocal(),
      title: 'Flutter Demo',
      theme: getThemeDate(),
      home: choosePage(),
    );
  }

  // first route
  // start
  Widget choosePage() {
    if (sharedpref!.getInt('id') != null &&
        sharedpref!.getString('company') != null) {
      return const HomePageVeiw();
    } else {
      return CreateCompanyVeiw();
    }
    // end
  }
}