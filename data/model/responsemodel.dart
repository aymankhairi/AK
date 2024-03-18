class ResponseModel {
  int? request_id;
  String? request_name;
  String? request_image;
  String? request_question;
  String? request_voice;
  String? request_response;
  int? request_approved;
  String? request_adminname;
  String? request_date;
  int? request_price;
  int? spiritual_id;
  int? user_id;
  int? request_rating;
  int? request_arhive;
  String? request_reasonrej;

  ResponseModel({
    this.request_id,
    this.request_name,
    this.request_image,
    this.request_question,
    this.request_voice,
    this.request_response,
    this.request_approved,
    this.request_adminname,
    this.request_date,
    this.request_price,
    this.spiritual_id,
    this.user_id,
    this.request_rating,
    this.request_arhive,
    this.request_reasonrej,
  });

  ResponseModel.fromjson(Map<String, dynamic> json) {
    request_id = json['request_id'];
    request_name = json['request_name'];
    request_image = json['request_image'];
    request_question = json['request_question'];
    request_voice = json['request_voice'];
    request_response = json['request_response'];
    request_approved = json['request_approved'];
    request_adminname = json['request_adminname'];
    request_date = json['request_date'];
    request_price = json['request_price'];
    spiritual_id = json['spiritual_id'];
    user_id = json['user_id'];
    request_rating = json['request_rating'];
    request_arhive = json['request_arhive'];
    request_reasonrej = json['request_reasonrej'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.request_id;
    data['request_name'] = this.request_name;
    data['request_image'] = this.request_image;
    data['request_question'] = this.request_question;
    data['request_voice'] = this.request_voice;
    data['request_response'] = this.request_response;
    data['request_approved'] = this.request_approved;
    data['request_adminname'] = this.request_adminname;
    data['request_date'] = this.request_date;
    data['request_price'] = this.request_price;
    data['spiritual_id'] = this.spiritual_id;
    data['user_id'] = this.user_id;
    data['request_rating'] = this.request_rating;
    data['request_arhive'] = this.request_arhive;
    data['request_reasonrej'] = this.request_reasonrej;
    return data;
  }
}
