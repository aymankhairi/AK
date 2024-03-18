import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class VerifyCodePassData {
  Crud crud;
  VerifyCodePassData(this.crud);
  postdata(String email, String userverifycode) async {
    var response = await crud.postData(AppLink.verifyCodePassword, {
      "useremail": email,
      "userverifycode": userverifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
