import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class SpirtualData {
  Crud crud;
  SpirtualData(this.crud);
  getData(String id, String userid) async {
    var response = await crud
        .postData(AppLink.spirtuals, {"id": id.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }

  gettotalcount(String userid) async {
    var response = await crud.postData(AppLink.totalwaiting, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
// // 
//  