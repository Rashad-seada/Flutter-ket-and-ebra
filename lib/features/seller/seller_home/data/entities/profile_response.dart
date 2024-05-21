class ProfileResponse {
  bool? isSuccssed;
  String? message;
  dynamic? obj;
  dynamic? errors;

  ProfileResponse({this.isSuccssed, this.message, this.obj, this.errors});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    obj = json['obj'];
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccssed'] = this.isSuccssed;
    data['message'] = this.message;
    data['obj'] = this.obj;
    data['errors'] = this.errors;
    return data;
  }
}