import 'package:alaraaf/controller/request/requestviewcontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/data/model/requestmodel.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListRequestSpirtual extends GetView<RequestViewControllerImp> {
  final RequestModel requestModel;
  const CustomListRequestSpirtual({
    super.key,
    required this.requestModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToPageSpirtualDetails(myfavoriteModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "${requestModel.request_id}",
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imageitems}/${requestModel.request_image!}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                // translateDataBase(
                requestModel.request_name.toString(),
                //  requestModel.spiritualnameen),
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                // translateDataBase(
                requestModel.request_question.toString(),
                //  requestModel.spiritualnameen),
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 22,
                    child: const Row(
                      children: [],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
