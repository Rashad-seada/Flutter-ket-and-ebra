class HandEntity {
  int? id;
  String? name;
  String? description;
  String? imgUrl;

  HandEntity({this.id,this.name, this.description, this.imgUrl});

  HandEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}