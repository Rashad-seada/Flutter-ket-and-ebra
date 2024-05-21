class EmbroideryEntity {
  int? id;
  num? price;
  String? name;
  String? description;
  String? imgUrl;

  EmbroideryEntity({this.id,this.price, this.name, this.description, this.imgUrl});

  EmbroideryEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['name'] = name;
    data['description'] = description;
    data['imgUrl'] = imgUrl;
    return data;
  }
}