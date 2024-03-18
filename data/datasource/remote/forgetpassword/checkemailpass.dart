import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class CheckEmailPassData {
  Crud crud;
  CheckEmailPassData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(AppLink.checkEmailPassword, {
      "useremail": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
