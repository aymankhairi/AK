import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class EditAuthData {
  Crud crud;
  EditAuthData(this.crud);
  getdata(String userid) async {
    var response = await crud.postData(AppLink.edit, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  editUserName(String userid, String username) async {
    var response = await crud.postData(AppLink.editname, {
      "userid": userid,
      "username": username,
    });
    return response.fold((l) => l, (r) => r);
  }

  editUserPhone(String userid, String userphone) async {
    var response = await crud.postData(AppLink.editphone, {
      "userid": userid,
      "userphone": userphone,
    });
    return response.fold((l) => l, (r) => r);
  }

  editUserPassword(String userid, String userpassword) async {
    var response = await crud.postData(AppLink.editpassword, {
      "userid": userid,
      "userpassword": userpassword,
    });
    return response.fold((l) => l, (r) => r);
  }

  editUserZodiac(String userid, String userzodiac) async {
    var response = await crud.postData(AppLink.editzodiac, {
      "userid": userid,
      "userzodiac": userzodiac,
    });
    return response.fold((l) => l, (r) => r);
  }

  gettotalcount(String userid) async {
    var response = await crud.postData(AppLink.totrequest, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
