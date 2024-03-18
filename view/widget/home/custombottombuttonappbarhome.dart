import 'package:alaraaf/controller/home/homescreencontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: AppColor.thirdcolor,
              notchMargin: 6,
              child: Row(
                children: [
                  ...List.generate(
                    controller.listPage.length + 1,
                    ((index) {
                      int i = index > 2 ? index - 1 : index;
                      return index == 2
                          ? const Spacer()
                          : CustomButtonAppBar(
                              onPressed: () {
                                controller.changePage(i);
                              },
                              textbutton: controller.bottomAppBar[i]['title'],
                              icondata: controller.bottomAppBar[i]['icon'],
                              active:
                                  controller.currentpage == i ? true : false,
                            );
                    }),
                  ),
                ],
              ),
            ));
  }
}
