import 'package:alaraaf/controller/request/requestrejcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/data/model/requestmodel.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:alaraaf/view/widget/request/ratingdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';

class RequestReject extends StatelessWidget {
  const RequestReject({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RequestRejControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GetBuilder<RequestRejControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.goToPageRequestDetails(
                          RequestModel.fromjson(controller.data[index]));
                    },
                    child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image.network(
                                  controller.data[index]['request_image'] !=
                                          "fail"
                                      ? "${AppLink.imagestaticquestion}/${controller.data[index]['request_image']}"
                                      : "${AppLink.imagestaticquestion}/1.jpg",
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 100,
                                )),
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                title: Text(
                                    "${"user name".tr}:\n" +
                                        controller.data[index]['request_name'],
                                    style: const TextStyle(fontSize: 15)),
                                subtitle: Text(
                                    controller.data[index]['request_question'],
                                    style: const TextStyle(fontSize: 12)),
                              ),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
