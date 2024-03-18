import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String userid, String spiritualid) async {
    var response = await crud.postData(AppLink.favoriteAdd,
        {"userid": userid.toString(), "spiritualid": spiritualid});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String userid, String spiritualid) async {
    var response = await crud.postData(AppLink.favoriteRemove,
        {"userid": userid.toString(), "spiritualid": spiritualid});
    return response.fold((l) => l, (r) => r);
  }
}
// // 
//  