import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class verifyCodeSignupData {
  Crud crud;
  verifyCodeSignupData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeSignup, {
      "useremail": email,
      "userverifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {"useremail": email});
    return response.fold((l) => l, (r) => r);
  }
}
