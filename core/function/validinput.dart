import 'package:get/get.dart';

ValidInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid Username".tr;
    }
  }
  if (type == "fullname") {
    if (val.isEmpty) {
      return "please enter your full name";
    }
  }
  if (type == "question") {
    if (val.isEmpty) {
      return "please enter your question";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Valid Email".tr;
    }
  }
  if (type == "zodiac") {
    if (val.isEmpty) {
      return "Enter Your Zodic Sign".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Valid Phone Number".tr;
    }
  }
  if (val.isEmpty) {
    return "please fill the fields".tr;
  }
  if (val.length < min) {
    return ("Can't be less than".tr + " $min ");
  }
  if (val.length > max) {
    return ("Can't be larger than".tr + " $max ");
  }
}
