import 'package:alaraaf/controller/response/responsedetailscontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/request/ratingdialog.dart';
import 'package:alaraaf/view/widget/request/timelinetile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class ResponseDetails extends StatefulWidget {
  const ResponseDetails({
    super.key,
  });

  @override
  State<ResponseDetails> createState() => _ResponseDetailsState();
}

class _ResponseDetailsState extends State<ResponseDetails> {
  @override
  Widget build(BuildContext context) {
    Get.put(ResponseDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 5,
      ),
      body: GetBuilder<ResponseDetailsControllerImp>(
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
                          "${AppLink.imagestaticquestion}/${controller.responseModel.request_image!}",
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.responseModel.request_name!,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: AppColor.thirdcolor)),
                    const SizedBox(height: 10),
                    Text(
                      "${"Question".tr}  :",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(" ${controller.responseModel.request_question!}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: AppColor.grey)),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${"Question".tr} :"),
                            ElevatedButton(
                                onPressed: () {
                                  controller.playRecording(
                                      "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.play_arrow),
                                    Text("Play".tr,
                                        style: TextStyle(fontSize: 12))
                                  ],
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  controller.pauseRecording(
                                      "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.pause),
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
                              curve: Curves.bounceIn,
                              children: [
                                SpeedDialChild(
                                    elevation: 0,
                                    child: Text("1.0 x"),
                                    onTap: () {
                                      controller.speedRecordingone(
                                          "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
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
                                          "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
                                    }),
                                SpeedDialChild(
                                    elevation: 0,
                                    child: Text("2.0x"),
                                    onTap: () {
                                      controller.speedRecording(
                                          "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
                                    }),
                              ],
                            )
                            // ElevatedButton(
                            //     onPressed: () {
                            //       controller.speedRecording(
                            //           "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
                            //     },
                            //     child: Column(
                            //       children: [
                            //         Icon(Icons.speed),
                            //         Text("x2", style: TextStyle(fontSize: 12))
                            //       ],
                            //     )),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${"Answer".tr}  :"),
                            ElevatedButton(
                                onPressed: () {
                                  controller.playRecording(
                                      "${AppLink.recordrequest}/${controller.responseModel.request_response!}");
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.play_arrow),
                                    Text("Play".tr)
                                  ],
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  controller.pauseRecording(
                                      "${AppLink.recordrequest}/${controller.responseModel.request_response!}");
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.pause),
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
                              curve: Curves.bounceIn,
                              children: [
                                SpeedDialChild(
                                    elevation: 0,
                                    child: Text("1.0 x"),
                                    onTap: () {
                                      controller.speedRecordingone(
                                          "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
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
                                          "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
                                    }),
                                SpeedDialChild(
                                    elevation: 0,
                                    child: Text("2.0x"),
                                    onTap: () {
                                      controller.speedRecording(
                                          "${AppLink.recordrequest}/${controller.responseModel.request_voice!}");
                                    }),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TimeLineRequest(
                            isfirst: true,
                            islast: false,
                            ispast:
                                controller.responseModel.request_approved == 0
                                    ? false
                                    : true,
                            eventcard: Text("Admin approved".tr)),
                        TimeLineRequest(
                            isfirst: false,
                            islast: false,
                            ispast: controller.responseModel.request_approved ==
                                    0
                                ? false
                                : controller.responseModel.request_approved == 1
                                    ? false
                                    : true,
                            eventcard: Text("Waiting For Answer".tr)),
                        TimeLineRequest(
                            isfirst: false,
                            islast: true,
                            ispast: controller.responseModel.request_approved ==
                                    0
                                ? false
                                : controller.responseModel.request_approved == 1
                                    ? false
                                    : controller.responseModel
                                                .request_approved ==
                                            2
                                        ? false
                                        : true,
                            eventcard: Text("Answer delevierd".tr)),
                      ],
                    ),
                    if (controller.responseModel.request_rating == 0)
                      Row(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.all(25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              child: CustomButtonAuth(
                                text: "Add a rating".tr,
                                onPressed: () {
                                  showDialogRating(
                                      context,
                                      controller.responseModel.request_id
                                          .toString());
                                },
                              ),
                            ),
                          ),
                          if (controller.responseModel.request_arhive == 0)
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)),
                                child: CustomButtonAuth(
                                  text: "Archive".tr,
                                  onPressed: () {
                                    controller.archive();
                                    // showDialogRating(
                                    //     context,
                                    //     controller.responseModel.request_id
                                    //         .toString());
                                  },
                                ),
                              ),
                            ),
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
