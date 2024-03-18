import 'package:alaraaf/controller/onboarding_controller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

abstract class VideoPlayerScreencontroller extends GetxController {
  continues();
}

class VideoPlayerScreencontrollerImp extends VideoPlayerScreencontroller {
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;
  MyServices myServices = Get.find();
  @override
  void onInit() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    controller = VideoPlayerController.asset(AppImageAsset.video);

    // Initialize the controller and store the Future for later use.
    initializeVideoPlayerFuture = controller.initialize();

    // Use the controller to loop the video.
    controller.setLooping(true);
    controller.play();
    super.onInit();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    controller.dispose();

    super.dispose();
  }

  continues() {
    myServices.sharedPreferences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }
}
