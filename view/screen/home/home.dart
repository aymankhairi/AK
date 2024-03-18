import 'package:alaraaf/controller/home/homecontroller.dart';
import 'package:alaraaf/core/class/handlingdataview.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:alaraaf/view/widget/customappbar.dart';
import 'package:alaraaf/view/widget/home/listcategorieshome.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
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
              onPressedIcon: () {
                Get.toNamed(AppRoute.notificationview);
              },
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myFavorite);
              },
              onPressedIconWallet: () {
                // Get.toNamed(AppRoute.checkoutpage);
              },
              text: controller.myServices.sharedPreferences
                  .getInt("coins")
                  .toString(),
            ),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ), // CustomCardHome(
                        //       title: "Coffe reading", body: "Sale 20%"),
                        // CustomTitleHome(title: "Categories".tr),
                        ListCategoriesHome(),
                        //    CustomTitleHome(title: "Top Services For You".tr),
                        //    ListSpertHome(),
                        //   CustomTitleHome(title: "offer".tr),
                        //   ListSpertHome(),
                      ],
                    )
                  : ListSpiritualSearch(listdata: controller.listadatac),
            )
          ],
        ),
      ),
    );
  }
}

class ListSpiritualSearch extends GetView<HomeControllerImp> {
  final List<SpirtualModel> listdata;
  const ListSpiritualSearch({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdata.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageSpirtualDetails(listdata[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageitems}/${listdata[index].spiritualImage}",
                      )),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listdata[index].spiritualNameEn!),
                            subtitle: Text(listdata[index].categoriesNameEn!),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
