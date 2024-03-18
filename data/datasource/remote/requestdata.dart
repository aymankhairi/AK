import 'dart:io';

import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class RequestData {
  Crud crud;
  RequestData(this.crud);
  postdata(String spiritualid, String userid, String fullname, String question,
      File photo, String price, File voice, String total) async {
    var response = await crud.postRequestwithmultiFile(
        AppLink.request,
        {
          "fullname": fullname,
          "question": question,
          "spiritualid": spiritualid.toString(),
          "userid": userid,
          "price": price,
          "total": total,
        },
        photo,
        voice);
    return response.fold((l) => l, (r) => r);
  }

  repostdata(
      String spiritualid,
      String userid,
      String fullname,
      String question,
      File photo,
      String price,
      File voice,
      String requestid) async {
    var response = await crud.postRequestwithmultiFile(
        AppLink.rerequest,
        {
          "fullname": fullname,
          "question": question,
          "spiritualid": spiritualid.toString(),
          "userid": userid,
          "price": price,
          "requestid": requestid,
        },
        photo,
        voice);
    return response.fold((l) => l, (r) => r);
  }

  getData(String userid) async {
    var response = await crud.postData(AppLink.requestView, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  getrejData(String userid) async {
    var response = await crud.postData(AppLink.requestrej, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  getDetailData(String userid, String requestid) async {
    var response = await crud.postData(
        AppLink.requestdetail, {"userid": userid, "requestid": requestid});
    return response.fold((l) => l, (r) => r);
  }
}
