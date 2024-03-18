import 'package:alaraaf/core/services/services.dart';
import 'package:get/get.dart';

translateDataBase(columnar, columner) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "Ar") {
    return columnar;
  } else {
    return columner;
  }
}
