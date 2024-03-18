import 'package:flutter/material.dart';
import 'package:alaraaf/controller/onboarding_controller.dart';
import '../widget/onBoarding/button.dart';
import '../widget/onBoarding/dotscontroller.dart';
import '../widget/onBoarding/slider.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: SliderOnBoarding(),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  DotsControllerOnBoarding(),
                  Spacer(flex: 1),
                  OnBoardingButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
