class RegisterCustomerResponse {
  bool? isSuccssed;
  String? message;
  Obj? obj;
  dynamic? errors;

  RegisterCustomerResponse(
      {this.isSuccssed, this.message, this.obj, this.errors});

  RegisterCustomerResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    obj = json['obj'] != null ? Obj.fromJson(json['obj']) : null;
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
  String? token;
  String? tokenExpire;

  Obj({this.token, this.tokenExpire});

  Obj.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenExpire = json['tokenExpire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = this.token;
    data['tokenExpire'] = this.tokenExpire;
    return data;
  }
}