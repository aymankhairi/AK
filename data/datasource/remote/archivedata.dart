import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class ArchiveData {
  Crud crud;
  ArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.archiveview, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
