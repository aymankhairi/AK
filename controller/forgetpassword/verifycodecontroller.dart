import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/data/datasource/remote/forgetpassword/verifycodepass.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  chechCode();
  gotoResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodePassData verifyCodePassData = VerifyCodePassData(Get.find());
  @override
  chechCode() {}
  @override
  gotoResetPassword(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodePassData.postdata(email!, verifyCode);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.resetPassword, arguments: {"useremail": email});
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
}
