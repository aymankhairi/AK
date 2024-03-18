import 'package:alaraaf/controller/request/requestcontroller.dart';
import 'package:alaraaf/controller/request/requestviewcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:alaraaf/view/widget/request/textformrequest.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  // late File file;
  @override
  Widget build(BuildContext context) {
    Get.put(RequestControllerImp());
    RequestViewControllerImp controllerIm = Get.put(RequestViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
      ),
      body: GetBuilder<RequestControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                primary: false,
                children: [
                  TextTitileAuth(
                      text: "Fill your information and your question".tr),
                  const SizedBox(
                    height: 10,
                  ),
                  // TextBodyAuth(
                  //   text: "Sign up with your E-mail and Password".tr,
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormRequest(
                    maxLines: 1,
                    minLines: 1,
                    filterPattern: RegExp('[a-z A-Z أ-ي]+'),
                    valid: (val) {
                      return ValidInput(val!, 5, 100, "fullname");
                    },
                    hintText: "Enter Your Full Name".tr,
                    labelText: "Full Name".tr,
                    iconText: Icons.person_2_outlined,
                    myController: controller.fullname,
                  ),
                  TextFormRequest(
                    maxLines: 4,
                    minLines: 1,
                    filterPattern: RegExp('[a-z A-Z أ-ي]+'),
                    valid: (val) {
                      return ValidInput(val!, 12, 500, "question");
                    },
                    hintText: "Enter Your Question".tr,
                    labelText: "Question".tr,
                    iconText: Icons.question_answer,
                    myController: controller.question,
                  ),
                  MaterialButton(
                      animationDuration: Duration(milliseconds: 250),
                      color: controller.file == null
                          ? AppColor.primaryColor
                          : const Color.fromARGB(255, 160, 26, 91),
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      textColor: Colors.white,
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (context) => Container(
                                  height: 130,
                                  width: double.infinity,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        CustomButtonAuth(
                                            text: "Upload photo From Camera".tr,
                                            onPressed: () {
                                              controller.pickercamera();

                                              setState(() {});
                                              Navigator.of(context).pop();
                                            }),
                                        CustomButtonAuth(
                                            text:
                                                "Upload photo From Gallery".tr,
                                            onPressed: () {
                                              controller.pickergallery();

                                              setState(() {});
                                              Navigator.of(context).pop();
                                              // SnackBar snackBar;
                                            }),
                                      ],
                                    ),
                                  ),
                                ));
                        // setState(() {});
                      },
                      child: controller.file == null
                          ? Text("Choose Image".tr)
                          : Text("Image Succefuly uploaded".tr)),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColor.primaryColor)),
                          onPressed: () {
                            controller.startRecording();
                          },
                          child: controller.isRecording
                              ? RippleAnimation(
                                  repeat: true,
                                  color: AppColor.backgroundcolor,
                                  minRadius: 40,
                                  ripplesCount: 4,
                                  child: Container(
                                    width: 60,
                                    height: 50,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: AppColor.backgroundcolor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(
                                      Icons.keyboard_voice_rounded,
                                      color: AppColor.thirdcolor,
                                    ),
                                  ),
                                )
                              : RippleAnimation(
                                  repeat: false,
                                  color: AppColor.black,
                                  minRadius: 20,
                                  ripplesCount: 3,
                                  child: Container(
                                    width: 60,
                                    height: 50,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: AppColor.backgroundcolor,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Icon(
                                      Icons.keyboard_voice_rounded,
                                      color: AppColor.thirdcolor,
                                    ),
                                  ),
                                )),
                      const Spacer(),
                      // if (controller.isRecording)
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColor.primaryColor),
                        ),
                        onPressed: () async {
                          controller.stopRecording();
                        },
                        child: Container(
                          width: 60,
                          height: 50,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 3),
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.stop_circle,
                            color: AppColor.backgroundcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // if (!controller.isRecording && controller.audioPath != '')
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColor.primaryColor)),
                      onPressed: controller.playRecording,
                      child: Text("Play Recording")),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(height: 10),

                  CustomButtonAuth(
                    text: "Send".tr,
                    onPressed: () {
                      if (controller.file == null) {
                        AwesomeDialog(
                          dialogType: DialogType.warning,
                          context: context,
                          title: "Warning".tr,
                          body: Text(
                            "please fill all the info".tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          animType: AnimType.bottomSlide,
                          padding: const EdgeInsets.all(15),
                          dialogBackgroundColor: AppColor.primaryColor,
                          alignment: Alignment.bottomCenter,
                        ).show();
                      }
                      setState(() {});
                      if (controller.formstate.currentState!.validate()) {
                        Get.defaultDialog(
                            backgroundColor: AppColor.secondrycolor,
                            title: "Alert".tr,
                            middleText: controller
                                        .spirtualModel.spiritualDiscount ==
                                    0
                                ? "${"This will cost you  : ".tr}${controller.spirtualModel.spiritualPrice} coins"
                                : "${"This will cost you  : ".tr}${(controller.spirtualModel.spiritualPrice! - (controller.spirtualModel.spiritualPrice! * (controller.spirtualModel.spiritualoffer! / 100)))} coins",
                            actions: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          AppColor.primaryColor)),
                                  onPressed: () {
                                    if (controller
                                            .spirtualModel.spiritualDiscount ==
                                        0) {
                                      controller.request(
                                          controller.spirtualModel.spiritualId,
                                          controller
                                              .spirtualModel.spiritualPrice);
                                    }
                                    if (controller
                                            .spirtualModel.spiritualDiscount ==
                                        1) {
                                      controller.request(
                                          controller.spirtualModel.spiritualId,
                                          (controller.spirtualModel
                                                  .spiritualPrice! -
                                              (controller.spirtualModel
                                                      .spiritualPrice! *
                                                  (controller.spirtualModel
                                                          .spiritualoffer! /
                                                      100))));
                                    }
                                  },
                                  child: Text("Confirm".tr)),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          AppColor.primaryColor)),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Cancel".tr)),
                            ]);
                      }
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // TextSignUpAuth(
                  //   text1: "have an account?".tr,
                  //   text2: "Log in".tr,
                  //   onTap: () {
                  //     controller.gotosignin();
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
