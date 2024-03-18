import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/requestdata.dart';
import 'package:alaraaf/data/model/requestmodel.dart';
import 'package:get/get.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';

abstract class RequestDetailsController extends GetxController {
  // initialData();
  goToPageRERequest(RequestModel requestModel);
}

class RequestDetailsControllerImp extends RequestDetailsController {
  String? userid;
  RequestData requestData = RequestData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List data = [];
  late AudioPlayer audioPlayer;
  late RequestModel requestModel;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isplaying = false;
  // getdata() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await requestData
  //       .getData(myServices.sharedPreferences.getInt("userid").toString());
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == 'success') {
  //       if (response['request'] == null) return StatusRequest.failure;
  //       data.addAll(response['request']);
  //       //Get.offNamed(AppRoute.homePage);
  //     } else {
  //       Get.defaultDialog(title: "Warning".tr, middleText: "Email or username already exist".tr);
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  initialData() {
    //  getdata();
    requestModel = Get.arguments['requestModel'];

    userid = myServices.sharedPreferences.getInt("userid").toString();
  }

  @override
  void onInit() {
    initialData();
    audioPlayer = AudioPlayer();
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

  @override
  goToPageRERequest(requestModel) {
    Get.toNamed("rerequest", arguments: {"requestModel": requestModel});
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
