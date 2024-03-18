import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  gotopageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  StatusRequest statusRequest = StatusRequest.none;
  @override
  gotopageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
