import 'package:alaraaf/controller/response/responsedetailscontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:get/get.dart';

void showRejectDialog(BuildContext context, String requestid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        "Rating Dialog".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.secondrycolor),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Rating'.tr,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15, color: AppColor.secondrycolor),
      ),
      // your app's logo?
      image: Image.asset(
        AppImageAsset.logo,
        height: 150,
      ),
      submitButtonText: "Rating".tr,
      submitButtonTextStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      commentHint: "Add comment".tr,
      // ignore: avoid_print
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ResponseDetailsControllerImp controller = Get.find();
        //   print('rating: ${response.rating}, comment: ${response.comment}');
        controller.submitRating(response.rating, response.comment);
        // TODO: add your own logic
        // if (response.rating < 3.0) {
        //   // send their comments to your email or anywhere you wish
        //   // ask the user to contact you instead of leaving a bad review
        // } else {
        //   _rateAndReviewApp();
        // }
      },
    ),
  );
}
