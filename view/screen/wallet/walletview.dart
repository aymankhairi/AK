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
import 'package:get/get.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WalletControllerImp controller = Get.put(WalletControllerImp());
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
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                  top: Get.width / 4.6,
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
            child: Card(
              shadowColor: AppColor.thirdcolor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                      animationDuration: const Duration(milliseconds: 250),
                      color: AppColor.primaryColor,
                      height: 35,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 11),
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

                        controller.gotoAddCard();
                      },
                      child: Text("Add Credit Card".tr)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GetBuilder<WalletControllerImp>(
                      builder: (controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            controller.delete(controller
                                                .data[index]['visa_code']);
                                          })),
                                  Expanded(
                                    flex: 2,
                                    child: ListTile(
                                      title: Text("Visa expired \n",
                                          style: const TextStyle(fontSize: 15)),
                                      subtitle: Text(
                                          controller.data[index]
                                              ['visa_expired'],
                                          style: const TextStyle(fontSize: 12)),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
