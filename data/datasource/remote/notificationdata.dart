import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String userid) async {
    var response =
        await crud.postData(AppLink.notificationView, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
