


import '../../../seller/seller_home/data/entities/get_seller_orders_reponse.dart';

class CartResponse {
  bool? isSuccssed;
  String? message;
  Obj? obj;
  dynamic? errors;

  CartResponse({this.isSuccssed, this.message, this.obj, this.errors});

  CartResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    obj = json['obj'] != null ? new Obj.fromJson(json['obj']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccssed'] = this.isSuccssed;
    data['message'] = this.message;
    if (this.obj != null) {
      data['obj'] = this.obj!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class Obj {
  int? price;
  List<Details>? details;

  Obj({this.price, this.details});

  Obj.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  int? height;
  int? shoulder;
  int? armLenght;
  int? chestWide;
  int? neck;
  int? handSize;
  int? kbkLength;
  int? textureId;
  int? yakaId;
  int? chestId;
  int? frontPocketId;
  String? textureName;
  String? textureImg;
  int? texturePrice;
  String? yakaName;
  String? yakaUrl;
  String? chestName;
  String? chestUrl;
  String? frontPocketName;
  String? frontPocketUrl;
  String? handName;
  String? handUrl;
  String? buttonsName;
  String? buttonsUrl;
  int? buttonsPrice;
  String? embroideryName;
  String? embroideryUrl;
  int? embroideryPrice;
  int? handId;
  int? buttonsId;
  int? embroideryId;
  int? itemCartId;
  int? sellerrId;

  Details(
      {this.id,
        this.height,
        this.shoulder,
        this.armLenght,
        this.chestWide,
        this.neck,
        this.handSize,
        this.kbkLength,
        this.textureId,
        this.yakaId,
        this.chestId,
        this.frontPocketId,
        this.textureName,
        this.textureImg,
        this.texturePrice,
        this.yakaName,
        this.yakaUrl,
        this.chestName,
        this.chestUrl,
        this.frontPocketName,
        this.frontPocketUrl,
        this.handName,
        this.handUrl,
        this.buttonsName,
        this.buttonsUrl,
        this.buttonsPrice,
        this.embroideryName,
        this.embroideryUrl,
        this.embroideryPrice,
        this.handId,
        this.buttonsId,
        this.embroideryId,
        this.itemCartId,
        this.sellerrId});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    height = json['height'];
    shoulder = json['shoulder'];
    armLenght = json['armLenght'];
    chestWide = json['chestWide'];
    neck = json['neck'];
    handSize = json['handSize'];
    kbkLength = json['kbkLength'];
    textureId = json['textureId'];
    yakaId = json['yakaId'];
    chestId = json['chestId'];
    frontPocketId = json['frontPocketId'];
    textureName = json['textureName'];
    textureImg = json['textureImg'];
    texturePrice = json['texturePrice'];
    yakaName = json['yakaName'];
    yakaUrl = json['yakaUrl'];
    chestName = json['chestName'];
    chestUrl = json['chestUrl'];
    frontPocketName = json['frontPocketName'];
    frontPocketUrl = json['frontPocketUrl'];
    handName = json['handName'];
    handUrl = json['handUrl'];
    buttonsName = json['buttonsName'];
    buttonsUrl = json['buttonsUrl'];
    buttonsPrice = json['buttonsPrice'];
    embroideryName = json['embroideryName'];
    embroideryUrl = json['embroideryUrl'];
    embroideryPrice = json['embroideryPrice'];
    handId = json['handId'];
    buttonsId = json['buttonsId'];
    embroideryId = json['embroideryId'];
    itemCartId = json['itemCartId'];
    sellerrId = json['sellerrId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['height'] = this.height;
    data['shoulder'] = this.shoulder;
    data['armLenght'] = this.armLenght;
    data['chestWide'] = this.chestWide;
    data['neck'] = this.neck;
    data['handSize'] = this.handSize;
    data['kbkLength'] = this.kbkLength;
    data['textureId'] = this.textureId;
    data['yakaId'] = this.yakaId;
    data['chestId'] = this.chestId;
    data['frontPocketId'] = this.frontPocketId;
    data['textureName'] = this.textureName;
    data['textureImg'] = this.textureImg;
    data['texturePrice'] = this.texturePrice;
    data['yakaName'] = this.yakaName;
    data['yakaUrl'] = this.yakaUrl;
    data['chestName'] = this.chestName;
    data['chestUrl'] = this.chestUrl;
    data['frontPocketName'] = this.frontPocketName;
    data['frontPocketUrl'] = this.frontPocketUrl;
    data['handName'] = this.handName;
    data['handUrl'] = this.handUrl;
    data['buttonsName'] = this.buttonsName;
    data['buttonsUrl'] = this.buttonsUrl;
    data['buttonsPrice'] = this.buttonsPrice;
    data['embroideryName'] = this.embroideryName;
    data['embroideryUrl'] = this.embroideryUrl;
    data['embroideryPrice'] = this.embroideryPrice;
    data['handId'] = this.handId;
    data['buttonsId'] = this.buttonsId;
    data['embroideryId'] = this.embroideryId;
    data['itemCartId'] = this.itemCartId;
    data['sellerrId'] = this.sellerrId;
    return data;
  }

  SellerOrder toSellerOrder() {
    return SellerOrder(
      height: this.height,
      shoulder: this.shoulder,
      armLenght: this.armLenght,
      chestWide: this.chestWide,
      neck: this.neck,
      handSize: this.handSize,
      kbkLength: this.kbkLength,
      textureName: this.textureName,
      textureImg: this.textureImg,
      texturePrice: this.texturePrice,
      yakaName: this.yakaName,
      yakaUrl: this.yakaUrl,
      chestName: this.chestName,
      chestUrl: this.chestUrl,
      frontPocketName: this.frontPocketName,
      frontPocketUrl: this.frontPocketUrl,
      handName: this.handName,
      handUrl: this.handUrl,
      buttonsName: this.buttonsName,
      buttonsUrl: this.buttonsUrl,
      buttonsPrice: this.buttonsPrice,
      embroideryName: this.embroideryName,
      embroideryUrl: this.embroideryUrl,
      embroideryPrice: this.embroideryPrice,
    );
  }

}