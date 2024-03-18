import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/requestdata.dart';
import 'package:get/get.dart';
import 'package:alaraaf/data/model/requestmodel.dart';

abstract class RequestViewController extends GetxController {
  initialData();
  //goToPageRequestDetails(RequestModel requestModel);
  getdatadetail(requestid);
  goToPageRequestDetails(RequestModel requestModel);
}

class RequestViewControllerImp extends RequestViewController {
  String? userid;
  RequestData requestData = RequestData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];
  List datadetail = [];

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await requestData
        .getData(myServices.sharedPreferences.getInt("userid").toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['request'] == null) return StatusRequest.failure;
        data.addAll(response['request']);
        //Get.offNamed(AppRoute.homePage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageRequestDetails(requestModel) {
    Get.toNamed("requestdetails", arguments: {"requestModel": requestModel});
  }

  @override
  getdatadetail(requestid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await requestData.getDetailData(
        myServices.sharedPreferences.getInt("userid").toString(),
        requestid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['request'] == null) return StatusRequest.failure;
        datadetail.addAll(response['request']);
        Get.toNamed(AppRoute.requestdetails);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
    getdata();

    userid = myServices.sharedPreferences.getInt("userid").toString();
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

  // pickercamera() async {
  //   image =
  //       (await ImagePicker().pickImage(source: ImageSource.camera)) as XFile;

  //   if (image == null) return;
  //   file = XFile(image!.path);
  // }

  // pickergallery() async {
  //   image =
  //       (await ImagePicker().pickImage(source: ImageSource.gallery)) as XFile;
  //   if (image == null) return const Text("No Image Selected");
  //   file = XFile(image!.path);
  // }
}
