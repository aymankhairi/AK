import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class ResponseData {
  Crud crud;
  ResponseData(this.crud);

  getData(String userid) async {
    var response =
        await crud.postData(AppLink.responseview, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  getratingcom(String requestid, String userid, String username,
      String spiritualid, String comment, String rating) async {
    var response = await crud.postData(AppLink.rating, {
      "requestid": requestid,
      "userid": userid,
      "username": username,
      "spiritualid": spiritualid,
      "comment": comment,
      "rating": rating,
    });
    return response.fold((l) => l, (r) => r);
  }

  archive(String userid, String requestid) async {
    var response = await crud.postData(AppLink.responsearchive, {
      "userid": userid,
      "requestid": requestid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
