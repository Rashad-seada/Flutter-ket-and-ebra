
import 'package:smart_soft/features/seller/add_variation/data/entities/seller_entity.dart';

class VariationEntity {
  num? price;
  String? imgUrl;
  int? sellerId;
  Seller? seller;
  int? id;
  String? name;
  String? description;

  VariationEntity(
      {this.price,
        this.imgUrl,
        this.sellerId,
        this.seller,
        this.id,
        this.name,
        this.description});

  VariationEntity.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    imgUrl = json['imgUrl'];
    sellerId = json['sellerId'];
    seller =
    json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['imgUrl'] = this.imgUrl;
    data['sellerId'] = this.sellerId;
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}