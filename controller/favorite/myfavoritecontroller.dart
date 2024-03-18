import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/myfavoritedata.dart';
import 'package:alaraaf/data/model/myfavoritemodel.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());
  MyServices myServices = Get.find();
  List<MyFavoriteModel> spiritual = [];
  late StatusRequest statusRequest;

  getData() async {
    spiritual.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myServices.sharedPreferences.getInt("userid").toString());
    // myServices.sharedPreferences.getInt("id").toString());

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        spiritual.addAll(responsedata.map((e) => MyFavoriteModel.fromjson(e)));
        print("data");
        print(spiritual);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) {
    favoriteData.deleteData(favoriteid);
    spiritual
        .removeWhere((element) => element.favoriteid.toString() == favoriteid);
    update();
  }

  goToPageSpirtualDetails(spirtualModel) {
    Get.toNamed("spirtualdetails", arguments: {"spirtualmodel": spirtualModel});
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
