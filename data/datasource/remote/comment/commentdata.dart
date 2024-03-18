import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class CommentData {
  Crud crud;
  CommentData(this.crud);
  addComment(String userid, String spiritualid, String comment,
      String username) async {
    var response = await crud.postData(AppLink.commentAdd, {
      "userid": userid.toString(),
      "spiritualid": spiritualid,
      "comment": comment,
      "username": username,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeComment(String commentid) async {
    var response = await crud
        .postData(AppLink.commentDelete, {"commentid": commentid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getData(String spiritualid) async {
    var response =
        await crud.postData(AppLink.commentView, {"spiritualid": spiritualid});
    return response.fold((l) => l, (r) => r);
  }
}
// // 
//  