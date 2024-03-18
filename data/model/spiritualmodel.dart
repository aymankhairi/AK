class SpirtualModel {
  int? spiritualId;
  String? spiritualNameAr;
  String? spiritualNameEn;

  String? spiritualemail;
  String? spiritualpassword;

  String? spiritualDescEn;
  String? spiritualDescAr;
  String? spiritualImage;
  int? spiritualActive;
  int? spiritualPrice;
  int? spiritualDiscount;
  int? spiritualoffer;

  String? spiritualDate;
  String? spiritualvacfrom;
  String? spiritualvacto;
  int? itemsCat;

  int? categoriesId;
  String? categoriesNameEn;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? favorite;

  SpirtualModel(
      {this.spiritualId,
      this.spiritualNameAr,
      this.spiritualNameEn,
      this.spiritualemail,
      this.spiritualpassword,
      this.spiritualDescEn,
      this.spiritualDescAr,
      this.spiritualImage,
      this.spiritualActive,
      this.spiritualPrice,
      this.spiritualDiscount,
      this.spiritualoffer,

      this.spiritualDate,
      this.spiritualvacfrom,
      this.spiritualvacto,
      this.itemsCat,
      this.categoriesId,
      this.categoriesNameEn,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite});

  SpirtualModel.fromjson(Map<String, dynamic> json) {
    spiritualId = json['spiritual_id'];
    spiritualNameAr = json['spiritual_name_ar'];
    spiritualNameEn = json['spiritual_name_en'];
    spiritualemail = json['spiritual_email'];
    spiritualpassword = json['spiritual_password'];
    spiritualDescEn = json['spiritual_desc_en'];
    spiritualDescAr = json['spiritual_desc_ar'];
    spiritualImage = json['spiritual_image'];
    spiritualActive = json['spiritual_active'];
    spiritualPrice = json['spiritual_price'];
    spiritualDiscount = json['spiritual_discount'];
    spiritualoffer = json['spiritual_offer'];

    spiritualDate = json['spiritual_date'];

    spiritualvacfrom = json['spiritual_vacfrom'];
    spiritualvacto = json['spiritual_vacto'];

    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spiritual_id'] = this.spiritualId;
    data['spiritual_name_ar'] = this.spiritualNameAr;
    data['spiritual_name_en'] = this.spiritualNameEn;

    data['spiritual_email'] = this.spiritualemail;
    data['spiritual_password'] = this.spiritualpassword;

    data['spiritual_desc_en'] = this.spiritualDescEn;
    data['spiritual_desc_ar'] = this.spiritualDescAr;
    data['spiritual_image'] = this.spiritualImage;
    data['spiritual_active'] = this.spiritualActive;
    data['spiritual_price'] = this.spiritualPrice;
    data['spiritual_discount'] = this.spiritualDiscount;
    data['spiritual_offer'] = this.spiritualoffer;

    data['spiritual_date'] = this.spiritualDate;
    data['spiritual_vacfrom'] = this.spiritualvacfrom;
    data['spiritual_vacto'] = this.spiritualvacto;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name_en'] = this.categoriesNameEn;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['favorite'] = this.favorite;
    return data;
  }
}
