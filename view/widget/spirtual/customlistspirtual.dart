import 'package:alaraaf/controller/favorite/favoritecontroller.dart';
import 'package:alaraaf/controller/spiritual/spirtualcontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/translatedatabase.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListSpirtual extends GetView<SpirtualControllerImp> {
  final SpirtualModel spirtualModel;
  const CustomListSpirtual({
    super.key,
    required this.spirtualModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageSpirtualDetails(spirtualModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (spirtualModel.spiritualDiscount != 0)
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.fireplace),
                      Text("Offer"),
                    ],
                  ),
                Hero(
                  tag: "${spirtualModel.spiritualId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageitems}/${spirtualModel.spiritualImage!}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    spirtualModel.spiritualActive == 1
                        ? Text(
                            "online".tr,
                            style: TextStyle(fontSize: 10),
                          )
                        : Text(
                            "offline".tr,
                            style: TextStyle(fontSize: 10),
                          ),
                    CircleAvatar(
                      backgroundColor: spirtualModel.spiritualActive == 1
                          ? Colors.green
                          : Colors.red,
                      radius: 4,
                    ),
                    const Spacer(),
                    Text(
                      translateDataBase(spirtualModel.spiritualNameAr,
                          spirtualModel.spiritualNameEn),
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rating".tr,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 22,
                      child: Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => const Icon(
                                    Icons.star,
                                    size: 14,
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${spirtualModel.spiritualPrice} \$",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    GetBuilder<FavoriteController>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller
                                    .isFavorite[spirtualModel.spiritualId] ==
                                1) {
                              controller.setFavorite(
                                  spirtualModel.spiritualId, 0);
                              controller.removeFavorite(
                                  spirtualModel.spiritualId.toString());
                            } else {
                              controller.setFavorite(
                                  spirtualModel.spiritualId, 1);
                              controller.addFavorite(
                                  spirtualModel.spiritualId.toString());
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[spirtualModel.spiritualId] ==
                                    1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          )),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
