import 'package:alaraaf/controller/request/requestdetailscontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:alaraaf/view/widget/request/timelinetile.dart';
import 'package:alaraaf/view/widget/spirtualdetails/price.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(RequestDetailsControllerImp());
    return Scaffold(
      body: GetBuilder<RequestDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30))),
                  ),
                  Positioned(
                    top: 50,
                    right: Get.width / 6,
                    left: Get.width / 6,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imagestaticquestion}/${controller.requestModel.request_image!}",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fill),
                        ),
                      ),
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 110,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(controller.requestModel.request_name!,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: AppColor.thirdcolor)),
                        const Spacer(),
                        // Text("${
                        //   Jiffy.parse(controller.requestModel.request_date!).fromNow()
                        // }"),
                        Text(
                            Jiffy.parse(controller.requestModel.request_date!)
                                .fromNow(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColor.thirdcolor,
                                    fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SpirtualPrice(
                        price:
                            "${controller.requestModel.request_price.toString()}"),
                    const SizedBox(height: 10),
                    Text(controller.requestModel.request_question!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColor.grey)),
                    const SizedBox(height: 14),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${"Question".tr} :"),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColor.primaryColor)),
                                onPressed: () {
                                  controller.playRecording(
                                      "${AppLink.recordrequest}/${controller.requestModel.request_voice!}");
                                },
                                child: Column(
                                  children: [
                                    const Icon(Icons.play_arrow),
                                    Text("Play".tr,
                                        style: const TextStyle(fontSize: 12))
                                  ],
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColor.primaryColor)),
                                onPressed: () {
                                  controller.pauseRecording(
                                      "${AppLink.recordrequest}/${controller.requestModel.request_voice!}");
                                },
                                child: Column(
                                  children: [
                                    const Icon(Icons.pause),
                                    Text(
                                      "Pause".tr,
                                      style: TextStyle(fontSize: 12),
                                    )
                                  ],
                                )),
                            SpeedDial(
                              child: Icon(
                                Icons.more_horiz,
                                color: Colors.blueGrey,
                              ),
                              activeIcon: Icons.close,
                              iconTheme: IconThemeData(color: Colors.white),
                              buttonSize: Size(58, 58),
                              backgroundColor: AppColor.primaryColor,
                              curve: Curves.bounceIn,
                              children: [
                                SpeedDialChild(
                                    elevation: 0,
                                    child: Text("1.0 x"),
                                    onTap: () {
                                      controller.speedRecordingone(
                                          "${AppLink.recordrequest}/${controller.requestModel.request_voice!}");
                                    }),
                                SpeedDialChild(
                                    elevation: 0,
                                    child: Text("1.5x"),
                                    // labelWidget: Text(
                                    //   "1.5x",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                    onTap: () {
                                      controller.speedRecordingonehalf(
                                          "${AppLink.recordrequest}/${controller.requestModel.request_voice!}");
                                    }),
                                SpeedDialChild(
                                    elevation: 0,
                                    child: Text("2.0x"),
                                    onTap: () {
                                      controller.speedRecording(
                                          "${AppLink.recordrequest}/${controller.requestModel.request_voice!}");
                                    }),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    if (controller.requestModel.request_reasonrej == "")
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TimeLineRequest(
                              isfirst: true,
                              islast: false,
                              ispast:
                                  controller.requestModel.request_approved == 0
                                      ? false
                                      : true,
                              eventcard: Text("Admin approved".tr)),
                          TimeLineRequest(
                              isfirst: false,
                              islast: false,
                              ispast:
                                  controller.requestModel.request_approved == 0
                                      ? false
                                      : controller.requestModel
                                                  .request_approved ==
                                              1
                                          ? false
                                          : true,
                              eventcard: Text("Waiting For Answer".tr)),
                          TimeLineRequest(
                              isfirst: false,
                              islast: true,
                              ispast:
                                  controller.requestModel.request_approved == 0
                                      ? false
                                      : controller.requestModel
                                                  .request_approved ==
                                              1
                                          ? false
                                          : controller.requestModel
                                                      .request_approved ==
                                                  2
                                              ? false
                                              : true,
                              eventcard: Text("Answer delevierd".tr)),
                        ],
                      ),
                    if (controller.requestModel.request_approved == 4)
                      Column(
                        children: [
                          Center(
                            child: Row(
                              children: [
                                Text("Reason :\n".tr,
                                    style: const TextStyle(fontSize: 12)),
                                Text(controller.requestModel.request_reasonrej!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: AppColor.grey)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColor.primaryColor)),
                              onPressed: () {
                                controller
                                    .goToPageRERequest(controller.requestModel);
                              },
                              child: Column(
                                children: [
                                  const Icon(Icons.restart_alt_outlined),
                                  Text(
                                    "Resend Request".tr,
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )),
                        ],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
