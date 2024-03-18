import 'package:alaraaf/controller/auth/edit/editauthnamecontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/logoauth.dart';
import 'package:alaraaf/view/widget/auth/textformauth.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserAuth extends StatelessWidget {
  const EditUserAuth({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditAuthNameControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        title: Text(
          "".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<EditAuthNameControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(
                      children: [
                        const LogoAuth(),
                        TextTitileAuth(text: "Edit Your User Name".tr),
                        const SizedBox(
                          height: 20,
                        ),
                        // TextBodyAuth(
                        //   text: "Edit Your Info".tr,
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        TextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return ValidInput(val!, 5, 30, "username");
                          },
                          myController: controller.name,
                          hintText: controller.myServices.sharedPreferences
                              .getString("username")!,
                          labelText: "user name".tr,
                          iconText: Icons.room_preferences_outlined,
                        ),
                        CustomButtonAuth(
                            text: "Edit".tr,
                            onPressed: () {
                              controller.EditName();
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
