import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  print("hey=======");
  FirebaseMessaging.onMessage.listen((message) {
    print("=========Notification=========");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    //refreshPage(message.data);
  });
}

// refreshPage(data) {
//   print("===========page id=======");
//   print(data['pageid']);
//   print("===========page name=======");
//   print(data['pagename']);
//   print("===========current page =======");
//   print(Get.currentRoute);
//   if (Get.currentRoute == "requestdetails" &&
//       data['pagename'] == "refreshrequest") {
//     RequestViewController requestViewController = Get.find();
//   }
// }
