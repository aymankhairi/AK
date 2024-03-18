import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/responsedata.dart';
import 'package:alaraaf/data/model/responsemodel.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

abstract class ResponseDetailsController extends GetxController {
  // initialData();
}

class ResponseDetailsControllerImp extends ResponseDetailsController {
  String? userid;
  ResponseData responseData = ResponseData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];
  late ResponseModel responseModel;
  late AudioPlayer audioPlayer;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isplaying = false;

  submitRating(double rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await responseData.getratingcom(
      responseModel.request_id.toString(),
      myServices.sharedPreferences.getInt("userid").toString(),
      myServices.sharedPreferences.getString("username")!,
      responseModel.spiritual_id.toString(),
      comment,
      rating.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.homePage); //data.addAll(response['request']);
        Get.defaultDialog(
            title: "Thank You".tr, middleText: "For Your Rating".tr);
        //Get.offNamed(AppRoute.homePage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  archive() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await responseData.archive(
      myServices.sharedPreferences.getInt("userid").toString(),
      responseModel.request_id.toString(),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.homePage); //data.addAll(response['request']);
        // Get.defaultDialog(
        //     title: "Thank You".tr, middleText: "For Your Rating".tr);
        //Get.offNamed(AppRoute.homePage);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    //  getdata();
    responseModel = Get.arguments['responseModel'];

    userid = myServices.sharedPreferences.getInt("userid").toString();
  }

  @override
  void onInit() {
    audioPlayer = AudioPlayer();
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playRecording(String url) async {
    //await audioPlayer.setUrl(url);
    final duration = await audioPlayer.setUrl(url);
    position = duration!; // Schemes: (https: | file: | asset: )
    await audioPlayer.play(); // Play while waiting for completion
    // Pause but remain ready to play
  }

  Future<void> pauseRecording(String url) async {
    await audioPlayer.pause();
  }

  Future<void> speedRecording(String url) async {
    await audioPlayer.setSpeed(2.0); // Twice as fast
  }

  Future<void> speedRecordingone(String url) async {
    await audioPlayer.setSpeed(1.0); // orginal
  }

  Future<void> speedRecordingonehalf(String url) async {
    await audioPlayer.setSpeed(1.5); //x1.5
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
