class MyFavoriteModel {
  int? favoriteid;
  int? favoriteusersid;
  int? favoritespirtualsid;
  int? spiritualid;
  String? spiritualnamear;
  String? spiritualnameen;
  String? spiritualdescen;
  String? spiritualdescar;
  String? spiritualimage;
  int? spiritualactive;
  int? spiritualprice;
  int? spiritualdiscount;
  String? spiritualdate;
  String? spiritualvacfrom;
  String? spiritualvacto;
  int? itemscat;
  int? usersid;

  MyFavoriteModel({
    this.favoriteid,
    this.favoriteusersid,
    this.favoritespirtualsid,
    this.spiritualid,
    this.spiritualnamear,
    this.spiritualnameen,
    this.spiritualdescen,
    this.spiritualdescar,
    this.spiritualimage,
    this.spiritualactive,
    this.spiritualprice,
    this.spiritualdiscount,
    this.spiritualdate,
    this.spiritualvacfrom,
    this.spiritualvacto,
    this.itemscat,
    this.usersid,
  });
  MyFavoriteModel.fromjson(Map<String, dynamic> json) {
    favoriteid = json['favorite_id'];
    favoriteusersid = json['favorite_usersid'];
    favoritespirtualsid = json['favorite_spirtualsid'];
    spiritualid = json['spiritual_id'];
    spiritualnamear = json['spiritual_name_ar'];
    spiritualnameen = json['spiritual_name_en'];
    spiritualdescen = json['spiritual_desc_en'];
    spiritualdescar = json['spiritual_desc_ar'];
    spiritualimage = json['spiritual_image'];
    spiritualactive = json['spiritual_active'];
    spiritualprice = json['spiritual_price'];
    spiritualdiscount = json['spiritual_discount'];
    spiritualdate = json['spiritual_date'];
    spiritualvacfrom = json['spiritual_vacfrom'];
    spiritualvacto = json['spiritual_vacto'];
    itemscat = json['items_cat'];
    usersid = json['users_id'];
  }
  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteid;
    data['favorite_usersid'] = this.favoriteusersid;
    data['favorite_spirtualsid'] = this.favoritespirtualsid;
    data['spiritual_id'] = this.spiritualid;
    data['spiritual_name_ar'] = this.spiritualnamear;
    data['spiritual_name_en'] = this.spiritualnameen;
    data['spiritual_desc_en'] = this.spiritualdescen;
    data['spiritual_desc_ar'] = this.spiritualdescar;
    data['spiritual_image'] = this.spiritualimage;
    data['spiritual_active'] = this.spiritualactive;
    data['spiritual_price'] = this.spiritualprice;
    data['spiritual_discount'] = this.spiritualdiscount;
    data['spiritual_date'] = this.spiritualdate;
    data['spiritual_vacfrom'] = this.spiritualvacfrom;
    data['spiritual_vacto'] = this.spiritualvacto;
    data['items_cat'] = this.itemscat;
    data['users_id'] = this.usersid;
    return data;
  }
}
