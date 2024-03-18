import 'package:alaraaf/data/model/onBoardingmodel.dart';

import '../../../core/constant/imageasset.dart';
import 'package:get/get.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Welcome To Araab App".tr,
      body: "We specialize in reading horoscopes".tr,
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "Easy & Safe".tr,
      body: "To reveal what is hidden".tr,
      image: AppImageAsset.onBoardingImageTwo),
  OnBoardingModel(
      title: "Discover the secrets of your life".tr,
      body: "If you are looking for a way".tr,
      image: AppImageAsset.onBoardingImageThree),
];
