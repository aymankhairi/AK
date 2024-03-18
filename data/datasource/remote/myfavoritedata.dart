import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  getData(String userid) async {
    var response =
        await crud.postData(AppLink.favoriteView, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String favid) async {
    var response =
        await crud.postData(AppLink.favoriteDelete, {"favoriteid": favid});
    return response.fold((l) => l, (r) => r);
  }
}
