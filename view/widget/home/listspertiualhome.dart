import 'package:alaraaf/controller/home/homecontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/translatedatabase.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSpertHome extends GetView<HomeControllerImp> {
  const ListSpertHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.spiritual.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return SpirtHome(
              spirtualModel: SpirtualModel.fromjson(controller.spiritual[i]),
            );
          }),
    );
  }
}

class SpirtHome extends StatelessWidget {
  final SpirtualModel spirtualModel;
  const SpirtHome({super.key, required this.spirtualModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.network(
            "${AppLink.imageitems}/${spirtualModel.spiritualImage}",
            height: 100,
            width: 150,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: 110,
          width: 180,
        ),
        Positioned(
            left: 10,
            child: Text(
              translateDataBase(
                  spirtualModel.spiritualNameAr, spirtualModel.spiritualNameEn),
              style: const TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ))
      ],
    );
  }
}
