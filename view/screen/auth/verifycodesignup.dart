import 'package:alaraaf/controller/auth/verifycodesignupcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/view/widget/auth/textbodyauth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          elevation: 0.0,
          title: Container(
            margin: EdgeInsets.all(4),
            child: Text(
              "Verification Code".tr,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: AppColor.grey),
            ),
          ),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(
                children: [
                  TextTitileAuth(text: "Check".tr),
                  const SizedBox(
                    height: 10,
                  ),
                  TextBodyAuth(
                    text:
                        "${"Please Enter The Digit Code That Sent To".tr}${controller.email}",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 5,
                    borderColor: Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.gotosuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      controller.reSend();
                    },
                    child: Center(
                        child: Text(
                      "Resend Verify Code",
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 18,
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
