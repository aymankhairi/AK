import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future sendEmail(String text, String name, String email) async {
  String? token;
  FirebaseMessaging.instance.getToken().then((value) {
    print("token : +$value");

    token = value;
  });
  final smtpServer = gmailSaslXoauth2(email, token.toString());
  final message = Message()
    ..from = Address(email, name)
    ..recipients = ['ayman_kh_7902@hotmail.com']
    ..text = text;

  try {
    await send(message, smtpServer);
  } on MailerException catch (e) {
    print(e);
  }
}
// void showSnackBar(String text){
//   final snackBar=SnackBar(content: Text(text,style: TextStyle(fontSize: 20),),backgroundColor: AppColor.secondrycolor,);
//   ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(snackBar);
// }
