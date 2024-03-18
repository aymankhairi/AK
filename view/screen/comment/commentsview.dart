import 'package:alaraaf/controller/comment/commentaddcontroller.dart';
import 'package:alaraaf/controller/comment/commentdeletecontroller.dart';
import 'package:alaraaf/controller/comment/commentviewcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    CommentDeleteControllerImp controllerdelete =
        Get.put(CommentDeleteControllerImp());
    Get.put(CommentViewControllerImp());
    CommentAddControllerImp controlleradd = Get.put(CommentAddControllerImp());
    var spiritualid = controlleradd.spirtualModel.spiritualId;
    void showCommentDialog() {
      showDialog(
          context: context,
          builder: (context) => Form(
              key: controlleradd.formstate,
              child: AlertDialog(
                title: Text("Add comment".tr),
                content: TextFormField(
                  controller: controlleradd.comment,
                  decoration: InputDecoration(hintText: "Write a Comment".tr),
                ),
                actions: [
                  CustomButtonAuth(
                      text: "Add comment".tr,
                      onPressed: () {
                        controlleradd.add(spiritualid.toString());
                      }),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Cancel".tr))
                ],
              )));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        height: 35,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.primaryColor,
          onPressed: () {
            showCommentDialog();
          },
          child: Text(
            "Add comment".tr,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(4)),
        margin: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GetBuilder<CommentViewControllerImp>(
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
                                  child: controller.data[index]['user_id'] ==
                                          controller
                                              .myServices.sharedPreferences
                                              .getInt("userid")
                                      ? IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () {
                                            controllerdelete.delete(controller
                                                .data[index]['comment_id']);
                                          })
                                      : IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.messenger_rounded))),
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: Text(
                                      controller.data[index]
                                              ['comment_username'] +
                                          "\n",
                                      style: const TextStyle(fontSize: 15)),
                                  subtitle: Text(
                                      controller.data[index]['comment_name'],
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
            ),
          ],
        ),
      ),
    );
  }
}
