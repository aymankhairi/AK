import 'package:alaraaf/controller/favorite/myfavoritecontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/translatedatabase.dart';
import 'package:alaraaf/data/model/myfavoritemodel.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoriteSpirtual extends GetView<MyFavoriteController> {
  final MyFavoriteModel myfavoriteModel;

  const CustomListFavoriteSpirtual({
    super.key,
    required this.myfavoriteModel,
  });

  @override
  Widget build(BuildContext context) {
    //  SpirtualModel spirtualModel;
    MyFavoriteController controller = Get.put(MyFavoriteController());
    return InkWell(
      onTap: () {
        // myfavoriteModel.spiritualid==spirtualModel.spiritualId
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
                tag: "${myfavoriteModel.spiritualid}",
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.imageitems}/${myfavoriteModel.spiritualimage!}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                translateDataBase(myfavoriteModel.spiritualnamear,
                    myfavoriteModel.spiritualnameen),
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
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
                    "${myfavoriteModel.spiritualprice} \$",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteFromFavorite(
                          myfavoriteModel.favoriteid.toString());
                    },
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: AppColor.primaryColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
