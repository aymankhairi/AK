import 'package:alaraaf/controller/video/videocontroller.dart';
import 'package:alaraaf/core/constant/routes.dart';
import 'package:alaraaf/core/middleware/mymiddleware.dart';
import 'package:alaraaf/view/screen/archive/archiveview.dart';
import 'package:alaraaf/view/screen/auth/edit/editpassword.dart';
import 'package:alaraaf/view/screen/auth/edit/editphone.dart';
import 'package:alaraaf/view/screen/auth/edit/editusername.dart';
import 'package:alaraaf/view/screen/auth/edit/editzodiac.dart';
import 'package:alaraaf/view/screen/auth/login.dart';
import 'package:alaraaf/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:alaraaf/view/screen/auth/profile.dart';
import 'package:alaraaf/view/screen/auth/signup.dart';
import 'package:alaraaf/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:alaraaf/view/screen/auth/successsignup.dart';
import 'package:alaraaf/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:alaraaf/view/screen/auth/verifycodesignup.dart';
import 'package:alaraaf/view/screen/comment/commentsview.dart';
import 'package:alaraaf/view/screen/language.dart';
import 'package:alaraaf/view/screen/myfavorite.dart';
import 'package:alaraaf/view/screen/notification/notification.dart';
import 'package:alaraaf/view/screen/onBoarding.dart';
import 'package:alaraaf/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:alaraaf/view/screen/home/homescreen.dart';
import 'package:alaraaf/view/screen/paypal/paypalview.dart';
import 'package:alaraaf/view/screen/request/request.dart';
import 'package:alaraaf/view/screen/request/requestdetail.dart';
import 'package:alaraaf/view/screen/request/requestrej.dart';
import 'package:alaraaf/view/screen/request/requestview.dart';
import 'package:alaraaf/view/screen/request/rerequest.dart';
import 'package:alaraaf/view/screen/response/response.dart';
import 'package:alaraaf/view/screen/response/responsedetails.dart';
import 'package:alaraaf/view/screen/settings/buycoin.dart';
import 'package:alaraaf/view/screen/settings/languagechoose.dart';
import 'package:alaraaf/view/screen/settings/techsupp.dart';
import 'package:alaraaf/view/screen/spiritual/spirtual.dart';
import 'package:alaraaf/view/screen/spiritual/spirtualdetails.dart';
import 'package:alaraaf/view/screen/video/video.dart';
import 'package:alaraaf/view/screen/wallet/walletadd.dart';
import 'package:alaraaf/view/screen/wallet/walletview.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),

  //GetPage( name: "/", page: () => TestView()),

  //auth
  GetPage(name: AppRoute.profile, page: () => const Profile()),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),

  //Auth Edit
  //GetPage(name: AppRoute.editAuth, page: () => const EditAuth()),
  GetPage(name: AppRoute.editAuthName, page: () => const EditUserAuth()),
  GetPage(name: AppRoute.editAuthPhone, page: () => const EditPhoneAuth()),
  GetPage(name: AppRoute.editAuthZodiac, page: () => const EditZodiacAuth()),
  GetPage(
      name: AppRoute.editAuthPassword, page: () => const EditPasswordAuth()),

  //onboarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //home
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  //items
  GetPage(name: AppRoute.spirtual, page: () => const Spirtual()),
  GetPage(name: AppRoute.spirtualDetails, page: () => const SpirtualDetails()),
  //favorite
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),

//request
  GetPage(name: AppRoute.request, page: () => const Request()),
  GetPage(name: AppRoute.requestView, page: () => const RequestView()),
  GetPage(name: AppRoute.requestdetails, page: () => const RequestDetails()),
  GetPage(name: AppRoute.requestreject, page: () => const RequestReject()),
  GetPage(name: AppRoute.rerequest, page: () => const Rerequest()),

  //response
  GetPage(name: AppRoute.responseview, page: () => const ResponseView()),
  GetPage(name: AppRoute.responsedetails, page: () => const ResponseDetails()),

  //archive
  GetPage(name: AppRoute.archiveview, page: () => const ArchiveView()),

  //comment
  GetPage(name: AppRoute.commentsview, page: () => const CommentView()),
  //notification
  GetPage(
      name: AppRoute.notificationview, page: () => const NotificationView()),

  //wallet
  GetPage(name: AppRoute.walletview, page: () => const WalletView()),
  GetPage(name: AppRoute.walletadd, page: () => const WalletAdd()),

  //settings
  GetPage(name: AppRoute.techsupport, page: () => const TechSupport()),
  //language
  GetPage(name: AppRoute.languagechoose, page: () => const LanguageChoose()),
  ////
  /////
  ///
  ///
  GetPage(name: AppRoute.checkoutpage, page: () => const CheckoutPage()),
  //coins

  GetPage(name: AppRoute.buycoins, page: () => const BuyCoins()),

  //video
  GetPage(
      name: AppRoute.videoplayerscreen, page: () => const VideoPlayerScreen()),
];
