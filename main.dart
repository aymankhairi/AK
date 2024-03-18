import 'package:alaraaf/binding/initialbinding.dart';
import 'package:alaraaf/core/localization/changelocal.dart';
import 'package:alaraaf/core/localization/transilation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      //home:  Test(),
      // routes: routes,
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}