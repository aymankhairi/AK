import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/archivedata.dart';
import 'package:alaraaf/data/model/responsemodel.dart';
import 'package:get/get.dart';

abstract class ArchiveViewController extends GetxController {
  initialData();
  goToPageResponseDetails(ResponseModel responseModel);
}

class ArchiveViewControllerImp extends ArchiveViewController {
  String? userid;
  ArchiveData requestData = ArchiveData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];

  getdata() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await requestData
        .getData(myServices.sharedPreferences.getInt("userid").toString());
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

  @override
  goToPageResponseDetails(responseModel) {
    Get.toNamed("responsedetails", arguments: {"responseModel": responseModel});
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
