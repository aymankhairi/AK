import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class testData {
  Crud crud;
  testData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
