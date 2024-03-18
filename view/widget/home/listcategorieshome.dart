import 'package:alaraaf/controller/home/homecontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/function/translatedatabase.dart';
import 'package:alaraaf/data/model/categoriesmodel.dart';
import 'package:alaraaf/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 0.5, mainAxisSpacing: 0.2),
          itemCount: controller.categories.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoSpirtuals(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: 125,
            width: 125,
            child: SvgPicture.network(
              "${AppLink.imagecategories}/${categoriesModel.categoriesImage}",
            ),
          ),
          Text(
            "${translateDataBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesNameEn)}",
            style: const TextStyle(fontSize: 13, color: AppColor.thirdcolor),
          )
        ],
      ),
    );
  }
}
