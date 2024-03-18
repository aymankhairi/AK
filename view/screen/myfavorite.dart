import 'package:alaraaf/controller/favorite/myfavoritecontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/view/widget/myfavorite/customlistfavoritespiritual.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  color: AppColor.primaryColor,
                  child: Center(
                    child: Text(
                      "Favorite".tr,
                      style: const TextStyle(
                          color: AppColor.backgroundcolor, fontSize: 35),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.spiritual.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, index) {
                          return CustomListFavoriteSpirtual(
                            myfavoriteModel: controller.spiritual[index],
                          );
                        },
                      )),
                )
              ],
            ),
          )),
    );
  }
}
