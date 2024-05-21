class GetRejectedSellersResponse {
  bool? isSuccssed;
  String? message;
  List<Obj>? obj;
  dynamic? errors;

  GetRejectedSellersResponse(
      {this.isSuccssed, this.message, this.obj, this.errors});

  GetRejectedSellersResponse.fromJson(Map<String, dynamic> json) {
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
  int? comNo;
  String? name;
  int? taxNo;
  Null? profileImg;
  String? phoneNumber;
  int? id;
  int? cityId;

  Obj(
      {this.comNo,
        this.name,
        this.taxNo,
        this.profileImg,
        this.phoneNumber,
        this.id,
        this.cityId});

  Obj.fromJson(Map<String, dynamic> json) {
    comNo = json['comNo'];
    name = json['name'];
    taxNo = json['taxNo'];
    profileImg = json['profileImg'];
    phoneNumber = json['phoneNumber'];
    id = json['id'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comNo'] = this.comNo;
    data['name'] = this.name;
    data['taxNo'] = this.taxNo;
    data['profileImg'] = this.profileImg;
    data['phoneNumber'] = this.phoneNumber;
    data['id'] = this.id;
    data['cityId'] = this.cityId;
    return data;
  }
}