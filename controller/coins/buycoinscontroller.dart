import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/coinsdata.dart';
import 'package:get/get.dart';

abstract class BuyCoinsController extends GetxController {
  request(int price);
}

class BuyCoinsControllerImp extends BuyCoinsController {
  CoinsData coinsData = CoinsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];

  @override
  request(price) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await coinsData.postdata(
      myServices.sharedPreferences.getInt("userid").toString(),
      (price + myServices.sharedPreferences.getInt("coins")!).toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //data.addAll(response['data']);
        myServices.sharedPreferences
            .setInt("coins", response['data']['users_coins']);
        Get.offAllNamed(AppRoute.homePage);
        //Navigator.push(context,MaterialPageRoute(builder: (context) =>NextPage()));
      } else {
        Get.defaultDialog(
            title: "Warning".tr,
            middleText: "Email or username already exist".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  view() async {
    var response = await coinsData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['request']);
        //Get.offNamed(AppRoute.homePage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    view();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String appToStringAsFixed(double number, int afterDecimal) {
    return '${number.toString().split('.')[0]}.${number.toString().split('.')[1].substring(0, afterDecimal)}';
  }
}
