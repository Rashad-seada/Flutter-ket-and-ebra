import '../../../seller/seller_home/data/entities/get_seller_orders_reponse.dart';

class GetAllOrdersResponse {
  bool? isSuccssed;
  String? message;
  List<OrderItemEntity>? obj;
  dynamic? errors;

  GetAllOrdersResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetAllOrdersResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <OrderItemEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new OrderItemEntity.fromJson(v));
      });
    }
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccssed'] = this.isSuccssed;
    data['message'] = this.message;
    if (this.obj != null) {
      data['obj'] = this.obj!.map((v) => v.toJson()).toList();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class OrderItemEntity {
  OrderDetails? orderDetails;
  num? price;
  String? date;

  OrderItemEntity({this.orderDetails, this.price, this.date});

  OrderItemEntity.fromJson(Map<String, dynamic> json) {
    orderDetails = json['orderDetails'] != null
        ? new OrderDetails.fromJson(json['orderDetails'])
        : null;
    price = json['price'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails!.toJson();
    }
    data['price'] = this.price;
    data['date'] = this.date;
    return data;
  }
}

class OrderDetailsEntity {
  OrderDetails? orderDetails;

  OrderDetailsEntity({this.orderDetails});

  OrderDetailsEntity.fromJson(Map<String, dynamic> json) {
    orderDetails = json['orderDetails'] != null
        ? new OrderDetails.fromJson(json['orderDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails!.toJson();
    }
    return data;
  }
}

class OrderDetails {
  int? height;
  int? shoulder;
  int? armLenght;
  int? chestWide;
  int? neck;
  int? handSize;
  int? kbkLength;
  int? textureId;
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
  int? yakaId;
  int? chestId;
  int? frontPocketId;
  int? handId;
  int? buttonsId;
  int? embroideryId;

  OrderDetails(
      {this.height,
        this.shoulder,
        this.armLenght,
        this.chestWide,
        this.neck,
        this.handSize,
        this.kbkLength,
        this.textureId,
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
        this.yakaId,
        this.chestId,
        this.frontPocketId,
        this.handId,
        this.buttonsId,
        this.embroideryId});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    shoulder = json['shoulder'];
    armLenght = json['armLenght'];
    chestWide = json['chestWide'];
    neck = json['neck'];
    handSize = json['handSize'];
    kbkLength = json['kbkLength'];
    textureId = json['textureId'];
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
    yakaId = json['yakaId'];
    chestId = json['chestId'];
    frontPocketId = json['frontPocketId'];
    handId = json['handId'];
    buttonsId = json['buttonsId'];
    embroideryId = json['embroideryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['shoulder'] = this.shoulder;
    data['armLenght'] = this.armLenght;
    data['chestWide'] = this.chestWide;
    data['neck'] = this.neck;
    data['handSize'] = this.handSize;
    data['kbkLength'] = this.kbkLength;
    data['textureId'] = this.textureId;
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
    data['yakaId'] = this.yakaId;
    data['chestId'] = this.chestId;
    data['frontPocketId'] = this.frontPocketId;
    data['handId'] = this.handId;
    data['buttonsId'] = this.buttonsId;
    data['embroideryId'] = this.embroideryId;
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