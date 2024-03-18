import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  gotopageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  StatusRequest statusRequest = StatusRequest.none;
  @override
  gotopageLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
