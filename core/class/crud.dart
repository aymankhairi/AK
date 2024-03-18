import 'dart:convert';
import 'package:alaraaf/core/class/statusrequest.dart';
import 'package:alaraaf/core/function/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverexception);
    }
  }

  Future<Either<StatusRequest, Map>> postRequestwithFile(
      String linkurl, Map data, File file) async {
    try {
      if (await checkInternet()) {
        var response = http.MultipartRequest("POST", Uri.parse(linkurl));
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multiPartFile = http.MultipartFile("photo", stream, length,
            filename: basename(file.path));
        response.files.add(multiPartFile);
        data.forEach((key, value) {
          response.fields[key] = value;
        });
        var myresponse = await response.send();
        var request = await http.Response.fromStream(myresponse);
        if (myresponse.statusCode == 200 || myresponse.statusCode == 201) {
          Map responsebody = jsonDecode(request.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverexception);
    }
  }

  Future<Either<StatusRequest, Map>> postRequestwithmultiFile(
      String linkurl, Map data, File file, File voice) async {
    try {
      if (await checkInternet()) {
        var response = http.MultipartRequest("POST", Uri.parse(linkurl));
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multiPartFile = http.MultipartFile("photo", stream, length,
            filename: basename(file.path));
        response.files.add(multiPartFile);
        var lengthvoice = await voice.length();
        var streamvoice = http.ByteStream(voice.openRead());
        var multiPartFilevoice = http.MultipartFile(
            "voice", streamvoice, lengthvoice,
            filename: basename(voice.path));
        response.files.add(multiPartFilevoice);
        data.forEach((key, value) {
          response.fields[key] = value;
        });
        var myresponse = await response.send();
        var request = await http.Response.fromStream(myresponse);
        if (myresponse.statusCode == 200 || myresponse.statusCode == 201) {
          Map responsebody = jsonDecode(request.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverexception);
    }
  }
}
