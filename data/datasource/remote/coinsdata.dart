import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class CoinsData {
  Crud crud;
  CoinsData(this.crud);
  postdata(String userid, String price) async {
    var response = await crud.postData(AppLink.coins, {
      "userid": userid,
      "price": price,
    });
    return response.fold((l) => l, (r) => r);
  }

  getData() async {
    var response = await crud.postData(AppLink.coinsview, {});
    return response.fold((l) => l, (r) => r);
  }
}
