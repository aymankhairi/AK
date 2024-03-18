// import 'package:alaraaf/controller/auth/edit/editauthcontroller.dart';
// import 'package:alaraaf/core/class/handlingdataview.dart';
// import 'package:alaraaf/core/constant/color.dart';
// import 'package:alaraaf/core/function/validinput.dart';
// import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
// import 'package:alaraaf/view/widget/auth/logoauth.dart';
// import 'package:alaraaf/view/widget/auth/textbodyauth.dart';
// import 'package:alaraaf/view/widget/auth/textformauth.dart';
// import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class EditAuth extends StatelessWidget {
//   const EditAuth({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(EditAuthControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.primaryColor,
//         elevation: 0.0,
//         title: Text(
//           "".tr,
//           style: Theme.of(context)
//               .textTheme
//               .headline1!
//               .copyWith(color: AppColor.grey),
//         ),
//       ),
//       body: GetBuilder<EditAuthControllerImp>(
//           builder: (controller) => HandlingDataRequest(
//                 statusRequest: controller.statusRequest,
//                 widget: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                   child: Form(
//                     key: controller.formstate,
//                     child: ListView(
//                       children: [
//                         const LogoAuth(),
//                         TextTitileAuth(text: "Edit Your Info".tr),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         // TextBodyAuth(
//                         //   text: "Edit Your Info".tr,
//                         // ),
//                         // const SizedBox(
//                         //   height: 10,
//                         // ),
//                         TextFormAuth(
//                           isNumber: false,
//                           valid: (val) {
//                             return ValidInput(val!, 4, 30, "username");
//                           },
//                           myController: controller.name,
//                           hintText: controller.myServices.sharedPreferences
//                               .getString("username")!,
//                           labelText: "User Name",
//                           iconText: Icons.room_preferences_outlined,
//                         ),
//                         TextFormAuth(
//                           isNumber: false,
//                           valid: (val) {
//                             return ValidInput(val!, 3, 15, "zodiac");
//                           },
//                           myController: controller.zodiac,
//                           hintText: controller.myServices.sharedPreferences
//                               .getString("userzodiac")!,
//                           labelText: "Zodiac".tr,
//                           iconText: Icons.emoji_nature_sharp,
//                         ),
//                         TextFormAuth(
//                           isNumber: false,
//                           valid: (val) {
//                             return ValidInput(val!, 9, 20, "phone");
//                           },
//                           myController: controller.phone,
//                           hintText: controller.myServices.sharedPreferences
//                               .getString("userphone")!,
//                           labelText: "Phone Number".tr,
//                           iconText: Icons.phone_android_outlined,
//                         ),
//                         GetBuilder<EditAuthControllerImp>(
//                           builder: (controller) => TextFormAuth(
//                             obsecuretext: controller.isshowpassword,
//                             onTapIcon: () {
//                               controller.showPassword();
//                             },
//                             isNumber: false,
//                             valid: (val) {
//                               return ValidInput(val!, 8, 40, "password");
//                             },
//                             hintText: "Enter Your Password".tr,
//                             labelText: "Password".tr,
//                             iconText: Icons.lock_outlined,
//                             myController: controller.password,
//                           ),
//                         ),
//                         // InkWell(
//                         //   onTap: () {
//                         //   //  controller.goToForgetPassword();
//                         //   },
//                         //   child: Text(
//                         //     "forgot password?".tr,
//                         //     textAlign: TextAlign.end,
//                         //   ),
//                         // ),
//                         CustomButtonAuth(
//                             text: "Edit".tr,
//                             onPressed: () {
//                               controller.Edit();
//                             }),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         // TextSignUpAuth(
//                         //   text1: "Don't have an account?".tr,
//                         //   text2: "Sign up".tr,
//                         //   onTap: () {
//                         //     controller.goToSignup();
//                         //   },
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )

//           // controller.statusRequest ==
//           //         StatusRequest.loading
//           // ? const Center(
//           //     child: Text("Loading.."),
//           //   )
//           // :

//           ),
//     );
//   }
// }
