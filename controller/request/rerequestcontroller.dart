import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/function/handlingdatacontroller.dart';
import 'package:alaraaf/core/services/services.dart';
import 'package:alaraaf/data/datasource/remote/requestdata.dart';
import 'package:alaraaf/data/model/requestmodel.dart';
import 'package:alaraaf/data/model/spiritualmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

abstract class RerequestController extends GetxController {
  File? file;
  XFile? image;

  pickercamera();
  request(spiritualid, price, requestid);
  pickergallery();
}

class RerequestControllerImp extends RerequestController {
  RequestData requestData = RequestData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  //late SpirtualModel spirtualModel;
  late RequestModel requestModel;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController fullname;
  late TextEditingController question;
  String? myfile;
  List data = [];

  late Record record;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';
  File? voice;
  @override
  request(spiritualid, price, requestid) async {
    if (file == null) {
      return AlertDialog(
        title: Text("please insert an image".tr),
      );
    }
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await requestData.repostdata(
        spiritualid.toString(),
        myServices.sharedPreferences.getInt("userid").toString(),
        fullname.text,
        question.text,
        file!,
        price.toString(),
        voice!,
        requestid.toString(),
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.addAll(response['data']);
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
    } else {
      print("Not Valid");
    }
  }

  initialData() {
    requestModel = Get.arguments['requestModel'];
    file;
  }

  @override
  void onInit() {
    initialData();
    audioPlayer = AudioPlayer();
    record = Record();
    fullname = TextEditingController();
    question = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    record.dispose();
    audioPlayer.dispose();
    pickercamera();
    pickergallery();
    fullname.dispose();
    question.dispose();
    super.dispose();
  }

  @override
  pickercamera() async {
    image = await (ImagePicker().pickImage(source: ImageSource.camera));
    if (image == null) return;

    file = File(image!.path);
  }

  @override
  pickergallery() async {
    image = await (ImagePicker().pickImage(source: ImageSource.gallery));
    if (image == null) return;
    file = File(image!.path);
  }

  Future<void> startRecording() async {
    try {
      if (await record.hasPermission()) {
        await record.start();
        isRecording = true;
      }
    } catch (e) {
      print("Error");
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await record.stop();
      isRecording = false;
      audioPath = path!;
      voice = File(audioPath);
    } catch (e) {
      print("Error");
    }
  }

  Future<void> playRecording() async {
    try {
      Source urlsource = UrlSource(audioPath);
      await audioPlayer.play(urlsource);
    } catch (e) {
      print("Error");
    }
  }
}
