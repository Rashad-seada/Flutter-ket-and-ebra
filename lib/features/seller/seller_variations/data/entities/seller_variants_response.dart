class SellerVariantsResponse {
  bool? isSuccssed;
  String? message;
  List<Obj>? obj;
  dynamic? errors;

  SellerVariantsResponse(
      {this.isSuccssed, this.message, this.obj, this.errors});

  SellerVariantsResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <Obj>[];
      json['obj'].forEach((v) {
        obj!.add(new Obj.fromJson(v));
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

class Obj {

  num? id;
  String? imgUrl;
  String? name;
  String? description;
  num? price;

  Obj({this.id, this.imgUrl, this.name, this.description, this.price});

  Obj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    return data;
  }
}