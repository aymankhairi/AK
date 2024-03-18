import 'package:alaraaf/controller/auth/edit/editauthcontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:alaraaf/view/widget/auth/CustomButtonAuth.dart';
import 'package:alaraaf/view/widget/auth/textbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    EditAuthControllerImp controller = Get.put(EditAuthControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 0.0,
        // title: Text(
        //   "Sign up".tr,
        //   style: Theme.of(context)
        //       .textTheme
        //       .headline1!
        //       .copyWith(color: AppColor.grey),
        // ),
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                  top: Get.width / 4.6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blueGrey[100],
                      backgroundImage:
                          const AssetImage(AppImageAsset.onBoardingImageTwo),
                    ),
                  )),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(7),
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(2),
            child: ListView(
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                // TextBodyAuth(text: controller.data[0].toString()),
                const SizedBox(
                  height: 15,
                ),
                // Center(
                //   child: SvgPicture.asset(
                //     'lib/assets/images/lang1.jpg',

                //     width: 240,
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonAuth(
                    text: "Edit Your User Name".tr,
                    onPressed: () {
                      controller.goToEditName();
                    }),
                // userInfoItProfile(
                //     Icons.person,
                //     controller.myServices.sharedPreferences.getString("username")!,
                //     controller.goToEditName(),
                //     const Icon(Icons.edit)),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonAuth(
                    text: "Edit Your Phone Number".tr,
                    onPressed: () {
                      controller.goToEditPhone();
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonAuth(
                    text: "Edit Your Zodiac".tr,
                    onPressed: () {
                      controller.goToEditZodiac();
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonAuth(
                  text: "Edit Your Password".tr,
                  onPressed: () {
                    controller.goToEditPassword();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

userInfoItProfile(IconData iconData, String userData, Function()? onPressed,
    Icon iconButton) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColor.thirdcolor,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    child: Row(
      children: [
        Icon(
          iconData,
          size: 30,
          color: AppColor.primaryColor,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          userData,
          style: const TextStyle(fontSize: 15),
        ),
        IconButton(
          onPressed: onPressed,
          icon: iconButton,
          color: AppColor.black,
        )
      ],
    ),
  );
}
