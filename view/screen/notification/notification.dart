import 'package:alaraaf/controller/notification/notificationcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: GetBuilder<NotificationController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          color: AppColor.primaryColor,
                          child: Center(
                            child: Text(
                              "Notification".tr,
                              style: const TextStyle(
                                  color: AppColor.backgroundcolor,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ...List.generate(
                            controller.data.length,
                            (index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: [
                                      ListTile(
                                        title: Text(
                                            controller.data[index]
                                                ["notification_title"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                        subtitle: Text(
                                            controller.data[index]
                                                ["notification_body"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color:
                                                        AppColor.secondrycolor,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                      const Divider(),
                                      Positioned(
                                        right: 8,
                                        top: 9,
                                        child: Text(
                                            Jiffy.parse(controller.data[index]
                                                    ["notification_date"])
                                                .fromNow(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColor.thirdcolor,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                )),
                      ],
                    ),
                  ))),
    );
  }
}
