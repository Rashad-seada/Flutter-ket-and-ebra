class GetAllOrdersResponse {
  bool? isSuccssed;
  String? message;
  List<OrderItemEntity>? obj;
  Null? errors;

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
  int? price;
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

class OrderDetails {
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
    data['yakaId'] = this.yakaId;
    data['chestId'] = this.chestId;
    data['frontPocketId'] = this.frontPocketId;
    data['handId'] = this.handId;
    data['buttonsId'] = this.buttonsId;
    data['embroideryId'] = this.embroideryId;
    return data;
  }
}