import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class WalletData {
  Crud crud;
  WalletData(this.crud);
  code(String userid, String visacard) async {
    var response = await crud.postData(AppLink.addcard, {
      "userid": userid,
      "visacard": visacard,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData(String userid) async {
    var response = await crud.postData(AppLink.viewcards, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  removeCard(String cardid) async {
    var response =
        await crud.postData(AppLink.deletecard, {"cardid": cardid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
