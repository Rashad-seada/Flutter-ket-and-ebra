import 'button_entity.dart';

class GetButtonResponse {
  bool? isSuccssed;
  String? message;
  List<ButtonEntity>? obj;
  Null? errors;

  GetButtonResponse({this.isSuccssed, this.message, this.obj, this.errors});

  GetButtonResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    if (json['obj'] != null) {
      obj = <ButtonEntity>[];
      json['obj'].forEach((v) {
        obj!.add(new ButtonEntity.fromJson(v));
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

