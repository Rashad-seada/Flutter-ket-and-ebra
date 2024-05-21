class GetAdminHomeResponse {
  bool? isSuccssed;
  String? message;
  Obj? obj;
  dynamic errors;

  GetAdminHomeResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetAdminHomeResponse.fromJson(Map<String, dynamic> json) {
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
  List<ReturnListofReq>? returnListofReq;
  int? totalSales;
  List<ReturnSeller>? returnSeller;
  List<dynamic>? listtoReturnUser;

  Obj(
      {this.returnListofReq,
        this.totalSales,
        this.returnSeller,
        this.listtoReturnUser});

  Obj.fromJson(Map<String, dynamic> json) {
    if (json['returnListofReq'] != null) {
      returnListofReq = <ReturnListofReq>[];
      json['returnListofReq'].forEach((v) {
        returnListofReq!.add(new ReturnListofReq.fromJson(v));
      });
    }
    totalSales = json['totalSales'];
    if (json['returnSeller'] != null) {
      returnSeller = <ReturnSeller>[];
      json['returnSeller'].forEach((v) {
        returnSeller!.add(new ReturnSeller.fromJson(v));
      });
    }
    if (json['listtoReturnUser'] != null) {
      listtoReturnUser = <dynamic>[];
      json['listtoReturnUser'].forEach((v) {
        listtoReturnUser!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.returnListofReq != null) {
      data['returnListofReq'] =
          this.returnListofReq!.map((v) => v.toJson()).toList();
    }
    data['totalSales'] = this.totalSales;
    if (this.returnSeller != null) {
      data['returnSeller'] = this.returnSeller!.map((v) => v.toJson()).toList();
    }
    if (this.listtoReturnUser != null) {
      data['listtoReturnUser'] =
          this.listtoReturnUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReturnListofReq {
  int? comNo;
  String? name;
  int? taxNo;
  String? profileImg;
  String? phoneNumber;
  int? id;
  int? cityId;

  ReturnListofReq(
      {this.comNo,
        this.name,
        this.taxNo,
        this.profileImg,
        this.phoneNumber,
        this.id,
        this.cityId});

  ReturnListofReq.fromJson(Map<String, dynamic> json) {
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

class ReturnSeller {
  int? comNo;
  String? name;
  int? taxNo;
  String? profileImg;
  String? phoneNumber;
  int? id;
  int? cityId;

  ReturnSeller(
      {this.comNo,
        this.name,
        this.taxNo,
        this.profileImg,
        this.phoneNumber,
        this.id,
        this.cityId});

  ReturnSeller.fromJson(Map<String, dynamic> json) {
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