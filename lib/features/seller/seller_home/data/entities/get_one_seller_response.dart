class GetOneSellerResponse {
  bool? isSuccssed;
  String? message;
  Obj? obj;
  dynamic? errors;

  GetOneSellerResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetOneSellerResponse.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? phoneNumber;
  String? fullName;
  String? profileImg;

  Obj({this.userName, this.phoneNumber, this.fullName, this.profileImg});

  Obj.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    fullName = json['fullName'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['fullName'] = this.fullName;
    data['profileImg'] = this.profileImg;
    return data;
  }
}