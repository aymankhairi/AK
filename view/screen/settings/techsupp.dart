import 'package:alaraaf/controller/settings/techsuppcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:alaraaf/core/function/mail.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:alaraaf/view/widget/request/textformrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechSupport extends StatefulWidget {
  const TechSupport({super.key});

  @override
  State<TechSupport> createState() => _TechSupportState();
}

class _TechSupportState extends State<TechSupport> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(TechSuppControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 5, color: AppColor.primaryColor),
              Positioned(
                  top: Get.width / 10.6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blueGrey[100],
                      backgroundImage:
                          const AssetImage(AppImageAsset.onBoardingImageTwo),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: MediaQuery.of(context).size.height / 1.52,
            child: Card(
              shadowColor: AppColor.thirdcolor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetBuilder<TechSuppControllerImp>(
                    builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 30),
                        child: Form(
                          key: controller.formstate,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            children: [
                              TextTitileAuth(
                                  text:
                                      "Please enter your questions or problems you are having"
                                          .tr),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormRequest(
                                maxLines: 4,
                                minLines: 1,
                                filterPattern: RegExp('[a-z A-Z أ-ي]+'),
                                valid: (val) {
                                  return ValidInput(val!, 12, 255, "question");
                                },
                                hintText: "Enter Your Question".tr,
                                labelText: "Question".tr,
                                iconText: Icons.question_answer,
                                myController: controller.question,
                              ),
                              MaterialButton(
                                  animationDuration:
                                      const Duration(milliseconds: 250),
                                  color: AppColor.primaryColor,
                                  height: 35,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 11),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    // sendEmail(
                                    //     controller.question.toString(),
                                    //     controller.myServices.sharedPreferences
                                    //         .getString("users_name")
                                    //         .toString(),
                                    //     controller.myServices.sharedPreferences
                                    //         .getString("useremail")
                                    //         .toString());
                                    controller.request();
                                  },
                                  child: Text("Send".tr)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
