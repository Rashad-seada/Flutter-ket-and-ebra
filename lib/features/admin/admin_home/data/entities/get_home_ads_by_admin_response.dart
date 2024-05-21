class GetHomeAdsByAdminResponse {
  bool? isSuccssed;
  String? message;
  List<Obj>? obj;
  dynamic? errors;

  GetHomeAdsByAdminResponse(
      {this.isSuccssed, this.message, this.obj, this.errors});

  GetHomeAdsByAdminResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? sellerId;
  String? description;
  String? imgUrl;

  Obj({this.id, this.sellerId, this.description, this.imgUrl});

  Obj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['sellerId'];
    description = json['description'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sellerId'] = this.sellerId;
    data['description'] = this.description;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}