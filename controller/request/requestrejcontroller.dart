import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/requestdata.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:get/get.dart';
import 'package:alaraaf/data/model/requestmodel.dart';

abstract class RequestRejController extends GetxController {
  initialData();
  //goToPageRequestDetails(RequestModel requestModel);
  goToPageRequestDetails(RequestModel requestModel);
  goToPageRequest(RequestModel requestModel);
}

class RequestRejControllerImp extends RequestRejController {
  String? userid;
  RequestData requestData = RequestData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];
  List datadetail = [];
  late RequestModel requestModel;

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await requestData
        .getrejData(myServices.sharedPreferences.getInt("userid").toString());
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
  goToPageRequest(requestModel) {
    Get.toNamed("rerequest", arguments: {"requestModel": requestModel});
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
