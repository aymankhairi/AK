import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username, String email, String phone, String zodiac,
      String password) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "useremail": email,
      "userphone": phone,
      "userzodiac": zodiac,
      "userpassword": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
