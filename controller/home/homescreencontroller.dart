import 'package:alaraaf/view/screen/auth/profile.dart';
import 'package:alaraaf/view/screen/settings/setting.dart';
import 'package:alaraaf/view/screen/home/home.dart';
import 'package:alaraaf/view/screen/request/requestview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 3;

  List<Widget> listPage = [
    const Settings(),
    const Profile(),
    const RequestView(),
    const HomePage(),
  ];

  List bottomAppBar = [
    {
      "title": "Setting".tr,
      "icon": Icons.settings,
    },
    {
      "title": "Profile".tr,
      "icon": Icons.person,
    },
    {
      "title": "Request".tr,
      "icon": Icons.all_inclusive,
    },
    {
      "title": "Home".tr,
      "icon": Icons.home,
    },
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
