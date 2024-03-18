class ResponseModel {
  int? users_id;
  String? users_name;
  String? users_email;
  String? users_phone;
  String? users_zodiac;
  String? users_password;
  String? users_verifycode;
  String? users_approved;
  String? users_active;
  String? users_created;
  String? users_coins;

  ResponseModel({
    this.users_id,
    this.users_name,
    this.users_email,
    this.users_phone,
    this.users_zodiac,
    this.users_password,
    this.users_verifycode,
    this.users_approved,
    this.users_active,
    this.users_created,
    this.users_coins,
  });

  ResponseModel.fromjson(Map<String, dynamic> json) {
    users_id = json['users_id'];
    users_name = json['users_name'];
    users_email = json['users_email'];
    users_phone = json['users_phone'];
    users_zodiac = json['users_zodiac'];
    users_password = json['users_password'];
    users_verifycode = json['users_verifycode'];
    users_approved = json['users_approved'];
    users_active = json['users_active'];
    users_created = json['users_created'];
    users_coins = json['users_coins'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.users_id;
    data['users_name'] = this.users_name;
    data['users_email'] = this.users_email;
    data['users_phone'] = this.users_phone;
    data['users_zodiac'] = this.users_zodiac;
    data['users_password'] = this.users_password;
    data['users_verifycode'] = this.users_verifycode;
    data['users_approved'] = this.users_approved;
    data['users_active'] = this.users_active;
    data['users_created'] = this.users_created;
    data['users_coins'] = this.users_coins;

    return data;
  }
}
