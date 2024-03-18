import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "useremail": email,
      "userpassword": password,
    });
    return response.fold((l) => l, (r) => r);
  }

  online(String userid) async {
    var response = await crud.postData(AppLink.online, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  offline(String userid) async {
    var response = await crud.postData(AppLink.offline, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
