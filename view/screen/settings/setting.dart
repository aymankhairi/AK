import 'package:alaraaf/controller/settings/settingscontroller.dart';
import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return ListView(
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
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height / 1.25,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    controller.gotoRejecRequest();
                  },
                  title: Text("Rejected Request".tr),
                  trailing: const Icon(Icons.deselect_sharp),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    controller.gotoArchive();
                  },
                  title: Text("Archive".tr),
                  trailing: const Icon(Icons.archive_outlined),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    controller.gotoTechSupp();
                  },
                  title: Text("Technical Support".tr),
                  trailing: const Icon(Icons.help_outline),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    controller.gotoLanguageChoose();
                  },
                  title: Text("Language".tr),
                  trailing: const Icon(Icons.language),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    controller.gotoWallet();
                  },
                  title: Text("Wallet".tr),
                  trailing: const Icon(Icons.wallet),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    controller.gotoCoins();
                  },
                  title: Text("Buy Coins".tr),
                  trailing: const Icon(Icons.monetization_on),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel: +963146415"));
                  },
                  title: Text("Contact Us".tr),
                  trailing: const Icon(Icons.phone_callback_outlined),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text("Log Out".tr),
                  trailing: const Icon(Icons.exit_to_app),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )
      ],
    );
  }
}
