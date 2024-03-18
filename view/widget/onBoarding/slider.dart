import 'package:alaraaf/controller/onboarding_controller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const SliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            onBoardingList[i].title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColor.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            onBoardingList[i].image!,
            //width: 200,
            height: Get.width / 1.6,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
