
import 'package:smart_soft/features/seller/add_variation/data/entities/variation_entity.dart';

class CreateVariationResponse {
  bool? isSuccssed;
  String? message;
  VariationEntity? obj;
  dynamic? errors;

  CreateVariationResponse(
      {this.isSuccssed, this.message, this.obj, this.errors});

  CreateVariationResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];
    obj = json['obj'] != null ? VariationEntity.fromJson(json['obj']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccssed'] = isSuccssed;
    data['message'] = message;
    if (this.obj != null) {
      data['obj'] = obj!.toJson();
    }
    data['errors'] = errors;
    return data;
  }
}

