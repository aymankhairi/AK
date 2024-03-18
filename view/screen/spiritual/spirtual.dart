import 'package:alaraaf/controller/favorite/favoritecontroller.dart';
import 'package:alaraaf/controller/spiritual/spirtualcontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:alaraaf/view/screen/home/home.dart';
import 'package:alaraaf/view/widget/customappbar.dart';
import 'package:alaraaf/view/widget/spirtual/customlistspirtual.dart';
import 'package:alaraaf/view/widget/spirtual/listcategoiresspirtual.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Spirtual extends StatelessWidget {
  const Spirtual({super.key});

  @override
  Widget build(BuildContext context) {
    SpirtualControllerImp controller = Get.put(SpirtualControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: controller.search!,
              onChanged: (val) {
                controller.checkSearch(val);
              },
              titleappbar: "search".tr,
              //onPressedIcon: () {},
              onPressedSearch: () {
                controller.onsearchSpiritual();
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myFavorite);
              },
              onPressedIconWallet: () {
                // Get.toNamed(AppRoute.walletview);
              },
              text: controller.myServices.sharedPreferences
                  .getInt("coins")
                  .toString(),
            ),
            const SizedBox(height: 15),
            const ListCategoiresSpirtual(),
            GetBuilder<SpirtualControllerImp>(
                builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? GridView.builder(
                              shrinkWrap: true,
                              itemCount: controller.spiritual.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.6),
                              itemBuilder: (BuildContext context, index) {
                                controllerFav.isFavorite[controller
                                        .spiritual[index]['spiritual_id']] =
                                    controller.spiritual[index]['favorite'];
                                return CustomListSpirtual(
                                  spirtualModel: SpirtualModel.fromjson(
                                      controller.spiritual[index]),
                                );
                              },
                            )
                          : ListSpiritualSearch(
                              listdata: controller.listadatac),
                    ))
          ],
        ),
      ),
    );
  }
}
