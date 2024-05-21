class GetSellerOrdersResponse {
  bool? isSuccssed;
  String? message;
  List<SellerOrder>? obj;
  dynamic errors;

  GetSellerOrdersResponse(
      {this.isSuccssed, this.message, this.obj, this.errors});

  GetSellerOrdersResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <SellerOrder>[];
      json['obj'].forEach((v) {
        obj!.add(new SellerOrder.fromJson(v));
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

class SellerOrder {
  num? id;
  num? price;
  String? date;
  bool? isFinshed;
  String? userName;
  String? phoneNumber;
  String? location;
  num? height;
  num? shoulder;
  num? armLenght;
  num? chestWide;
  num? neck;
  num? handSize;
  num? kbkLength;
  String? textureName;
  String? textureImg;
  num? texturePrice;
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
  num? buttonsPrice;
  String? embroideryName;
  String? embroideryUrl;
  num? embroideryPrice;

  SellerOrder(
      {this.id,
        this.price,
        this.date,
        this.isFinshed,
        this.userName,
        this.phoneNumber,
        this.location,
        this.height,
        this.shoulder,
        this.armLenght,
        this.chestWide,
        this.neck,
        this.handSize,
        this.kbkLength,
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
        this.embroideryPrice});

  SellerOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    date = json['date'];
    isFinshed = json['isFinshed'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    location = json['location'];
    height = json['height'];
    shoulder = json['shoulder'];
    armLenght = json['armLenght'];
    chestWide = json['chestWide'];
    neck = json['neck'];
    handSize = json['handSize'];
    kbkLength = json['kbkLength'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['date'] = this.date;
    data['isFinshed'] = this.isFinshed;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['location'] = this.location;
    data['height'] = this.height;
    data['shoulder'] = this.shoulder;
    data['armLenght'] = this.armLenght;
    data['chestWide'] = this.chestWide;
    data['neck'] = this.neck;
    data['handSize'] = this.handSize;
    data['kbkLength'] = this.kbkLength;
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