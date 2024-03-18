import 'package:alaraaf/controller/settings/techsuppcontroller.dart';
import 'package:alaraaf/controller/wallet/walletcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:alaraaf/core/function/mail.dart';
import 'package:alaraaf/core/function/validinput.dart';
import 'package:alaraaf/view/widget/auth/texttitleauth.dart';
import 'package:alaraaf/view/widget/request/textformrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class WalletAdd extends StatefulWidget {
  const WalletAdd({super.key});

  @override
  State<WalletAdd> createState() => _WalletAddState();
}

class _WalletAddState extends State<WalletAdd> {
  @override
  Widget build(BuildContext context) {
    WalletControllerImp controller = Get.put(WalletControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: GetBuilder<WalletControllerImp>(
                id: 'id',
                builder: (controller) {
                  return Column(
                    children: <Widget>[
                      CreditCardWidget(
                        cardNumber: controller.visacardNumber.text,
                        expiryDate: controller.visacardExpiry.text,
                        cardHolderName: controller.cardHolderName.text,
                        cvvCode: controller.ccvCode.text,
                        showBackView: controller.isccvFocused,
                        onCreditCardWidgetChange:
                            (CreditCardBrand creditCardBrand) {},
                        bankName: "Bank",
                        obscureCardCvv: true,
                        obscureCardNumber: true,
                        isHolderNameVisible: true,
                        isSwipeGestureEnabled: true,
                        cardType: CardType.mastercard,
                        glassmorphismConfig: Glassmorphism(
                            blurX: 15.0,
                            blurY: 15.0,
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Colors.grey.withOpacity(0.3),
                                  Colors.black.withOpacity(0.5)
                                ])),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            CreditCardForm(
                              formKey: controller.formstate,
                              cardNumber: controller.visacardNumber.text,
                              expiryDate: controller.visacardExpiry.text,
                              cardHolderName: controller.cardHolderName.text,
                              cvvCode: controller.ccvCode.text,
                              obscureCvv: true,
                              obscureNumber: true,
                              isHolderNameVisible: true,
                              isCardNumberVisible: true,
                              isExpiryDateVisible: true,
                              onCreditCardModelChange:
                                  controller.onCreditCardModelChange,
                            ),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColor.secondrycolor,
                                  ),
                                  onPressed: () {
                                    if (controller.formstate.currentState!
                                        .validate()) {
                                      print("valid!");
                                    } else {
                                      print("invalid!");
                                    }
                                  },
                                  child: Text(
                                    "Add".tr,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.backgroundcolor),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        )

        //  ListView(
        //   children: [
        //     Stack(
        //       clipBehavior: Clip.none,
        //       alignment: Alignment.center,
        //       children: [
        //         Container(height: Get.width / 3, color: AppColor.primaryColor),
        //         Positioned(
        //             top: Get.width / 4.6,
        //             child: Container(
        //               padding: const EdgeInsets.all(4),
        //               decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.circular(100)),
        //               child: CircleAvatar(
        //                 radius: 40,
        //                 backgroundColor: Colors.blueGrey[100],
        //                 backgroundImage:
        //                     const AssetImage(AppImageAsset.onBoardingImageTwo),
        //               ),
        //             )),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 50,
        //     ),
        //     Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 25),
        //       child: Card(
        //         shadowColor: AppColor.thirdcolor,
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             GetBuilder<WalletControllerImp>(
        //               builder: (controller) => HandlingDataRequest(
        //                 statusRequest: controller.statusRequest,
        //                 widget: Container(
        //                   padding: const EdgeInsets.symmetric(
        //                       vertical: 50, horizontal: 30),
        //                   child: Form(
        //                     key: controller.formstate,
        //                     child: ListView(
        //                       physics: const NeverScrollableScrollPhysics(),
        //                       shrinkWrap: true,
        //                       primary: false,
        //                       children: [
        //                         TextTitileAuth(
        //                             text: "Please enter your Credit Card".tr),
        //                         const SizedBox(
        //                           height: 30,
        //                         ),
        //                         TextFormRequest(
        //                           maxLines: 4,
        //                           minLines: 1,
        //                           filterPattern: RegExp('[a-z A-Z أ-ي]+'),
        //                           valid: (val) {
        //                             return ValidInput(val!, 12, 255, "question");
        //                           },
        //                           hintText: "Credit Card Number".tr,
        //                           labelText: "Credit Card".tr,
        //                           iconText: Icons.question_answer,
        //                           myController: controller.visacardNumber,
        //                         ),
        //                         MaterialButton(
        //                             animationDuration:
        //                                 const Duration(milliseconds: 250),
        //                             color: AppColor.primaryColor,
        //                             height: 35,
        //                             shape: RoundedRectangleBorder(
        //                                 borderRadius: BorderRadius.circular(20)),
        //                             padding:
        //                                 const EdgeInsets.symmetric(vertical: 11),
        //                             textColor: Colors.white,
        //                             onPressed: () {
        //                               // sendEmail(
        //                               //     controller.question.toString(),
        //                               //     controller.myServices.sharedPreferences
        //                               //         .getString("users_name")
        //                               //         .toString(),
        //                               //     controller.myServices.sharedPreferences
        //                               //         .getString("useremail")
        //                               //         .toString());

        //                               //controller.request();
        //                             },
        //                             child: Text("Add".tr)),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
