import 'package:alaraaf/controller/response/responsecontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/data/model/responsemodel.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponseView extends StatefulWidget {
  const ResponseView({super.key});

  @override
  State<ResponseView> createState() => _ResponseViewState();
}

class _ResponseViewState extends State<ResponseView> {
  @override
  Widget build(BuildContext context) {
    Get.put(ResponseViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<ResponseViewControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.goToPageResponseDetails(
                          ResponseModel.fromjson(controller.data[index]));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.network(
                                "${AppLink.imagestaticquestion}/${controller.data[index]["request_image"]}",
                                fit: BoxFit.fill,
                                height: 100,
                                width: 100,
                              )),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                const CustomButtonAuth(text: "text"),
                                ListTile(
                                  title: Text(
                                      "${"user name".tr}:\n" +
                                          controller.data[index]
                                              ["request_name"],
                                      style: const TextStyle(fontSize: 15)),
                                  subtitle: Text(
                                      controller.data[index]
                                          ["request_question"],
                                      style: const TextStyle(fontSize: 12)),
                                ),
                                ListTile(
                                  title: Text(
                                      "${"Answer".tr}:\n" +
                                          controller.data[index]
                                              ["request_response"],
                                      style: const TextStyle(fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
