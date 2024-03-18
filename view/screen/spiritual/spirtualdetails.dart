import 'package:alaraaf/controller/spiritual/spirtualdetailscontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/translatedatabase.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/spirtualdetails/price.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpirtualDetails extends StatelessWidget {
  const SpirtualDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SpirtualDetailsControllerImp controller =
        Get.put(SpirtualDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 50,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: controller.spirtualModel.spiritualActive != 3
                ? AppColor.primaryColor
                : Colors.transparent,
            onPressed: () {
              controller.spirtualModel.spiritualActive != 3
                  ? controller.goToPageRequest(controller.spirtualModel)
                  : "";
            },
            child: Text(
              "Contact".tr,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
              ),
              Positioned(
                top: 50,
                right: Get.width / 6,
                left: Get.width / 6,
                child: Hero(
                  tag: "${controller.spirtualModel.spiritualId}",
                  child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.imageitems}/${controller.spirtualModel.spiritualImage!}",
                      height: 250,
                      fit: BoxFit.contain,
                      imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fill),
                            ),
                          )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height / 2.5,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  translateDataBase(controller.spirtualModel.spiritualNameAr,
                      controller.spirtualModel.spiritualNameEn),
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: AppColor.thirdcolor)),
              const SizedBox(height: 20),
              if (controller.spirtualModel.spiritualActive == 3)
                Text(
                    "The Fortuneteller ${controller.spirtualModel.spiritualNameEn} is in a vacation from ${controller.spirtualModel.spiritualvacfrom} to ${controller.spirtualModel.spiritualvacto}  \n Dears, sorry not to catch your requests at the moment \ni'll be back soonest",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.red[300], fontSize: 13)),
              const SizedBox(height: 10),
              SpirtualPrice(
                  price: "${controller.spirtualModel.spiritualPrice} "),
              const SizedBox(height: 20),
              Text(controller.data.toString()),
              Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  "${"Bio".tr}  :\n" +
                      translateDataBase(
                          controller.spirtualModel.spiritualDescAr,
                          controller.spirtualModel.spiritualDescEn),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: AppColor.grey)),
            ]),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: CustomButtonAuth(
              text: "Add comment".tr,
              onPressed: () {
                controller.goToPageComment(controller.spirtualModel);
              },
            ),
          )
        ],
      ),
    );
  }
}
