class AppLink {
  //server uri
  static const String ip = "192.168.1.47";
  static const String server = "http://$ip:8080/al_araaf";

  //images
  static const String imagestatic = "http://$ip:8080/al_araaf/upload";
  static const String imagestaticquestion =
      "http://$ip:8080/al_araaf/upload/images";
  static const String imagecategories =
      "http://$ip:8080/al_araaf/upload/categories";
  static const String recordrequest = "http://$ip:8080/al_araaf/upload/record";
  static const String imageitems = "$server/upload/items";
  static const String imagecoins = "$server/upload/coins";

  //
  static const String test = "$server/test.php";

  //auth//
  static const String signUp = "$server/auth/signup.php";
  static const String verifyCodeSignup = "$server/auth/verifycode.php";
  static const String login = "$server/auth/login.php";
  static const String resend = "$server/auth/resend.php";
  static const String offline = "$server/auth/offline.php";
  static const String online = "$server/auth/online.php";
  static const String userdata = "$server/auth/userdata.php";

  //auth edit
  static const String edit = "$server/auth/editprofile.php";
  static const String editzodiac = "$server/auth/edituserzodiac.php";
  static const String editphone = "$server/auth/edituserphone.php";
  static const String editname = "$server/auth/editusername.php";
  static const String editpassword = "$server/auth/edituserpassword.php";
  //request//
  static const String request = "$server/auth/request.php";
  static const String requestView = "$server/auth/request_view.php";
  static const String requestdetail = "$server/auth/requestdetail.php";
  static const String requestrej = "$server/auth/rejectrequest.php";
  static const String rerequest = "$server/auth/rerequest.php";
  //response//
  static const String responseview = "$server/auth/response.php";
  static const String responsearchive = "$server/auth/responsearchive.php";
  static const String archiveview = "$server/auth/archiveview.php";
  //auth//
  //forgetpassword//
  static const String checkEmailPassword =
      "$server/auth/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/auth/forgetpassword/resetpassword.php";
  static const String verifyCodePassword =
      "$server/auth/forgetpassword/verifycodepassword.php";

  //home
  static const String homepage = "$server/home.php";

  //spiritual
  static const String spirtuals = "$server/spirtuals/spirtuals.php";
  static const String search = "$server/spirtuals/search.php";

  //favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String favoriteDelete = "$server/favorite/delete.php";

  //comments
  static const String commentAdd = "$server/comments/comment_add.php";
  static const String commentDelete = "$server/comments/comments_delete.php";
  static const String commentView = "$server/comments/comment_view.php";

  //notification
  static const String notificationView = "$server/notification.php";

  //rating+comment
  static const String rating = "$server/rating.php";
  //settings
  static const String mailsend = "$server/mailsend.php";
  //coins
  static const String coins = "$server/auth/coins.php";
  //count request per user
  static const String totrequest = "$server/auth/totalrequest.php";
  //waiting for spiritual
  static const String totalwaiting = "$server/spirtuals/waiting";
  //coins
  static const String coinsview = "$server/coins/view.php";
  //wallet
  static const String addcard = "$server/coins/addcard.php";
  static const String viewcards = "$server/coins/viewvisacards.php";
  static const String deletecard = "$server/coins/deletecard.php";
}
