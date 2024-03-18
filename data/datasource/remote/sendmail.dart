import 'package:alaraaf/core/class/crud.dart';
import 'package:alaraaf/linkapi.dart';

class SendmailData {
  Crud crud;
  SendmailData(this.crud);
  sendMail(String userid, String question, String email) async {
    var response = await crud.postData(AppLink.mailsend, {
      "userid": userid,
      "question": question,
      "useremail": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
