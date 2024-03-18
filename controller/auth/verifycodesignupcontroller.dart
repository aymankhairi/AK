import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  chechCode();
  gotosuccessSignUp(String verifyCodeSignup);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  verifyCodeSignupData verifycodesignupdata = verifyCodeSignupData(Get.find());
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  chechCode() {}
  @override
  gotosuccessSignUp(verifyCodeSignup) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifycodesignupdata.postdata(email!, verifyCodeSignup);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning".tr, middleText: "Verify Code Not Correct".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['useremail'];
    super.onInit();
  }

  reSend() {
    verifycodesignupdata.resendData(email!);
  }
}
