class FabricEntity {
  int? id;
  num? price;
  String? name;
  String? description;
  String? imgUrl;

  FabricEntity({this.id,this.price, this.name, this.description, this.imgUrl});

  FabricEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['price'] = this.price;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}