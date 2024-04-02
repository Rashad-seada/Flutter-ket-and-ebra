


class Seller {
  int? comNo;
  int? taxNo;
  String? photoOfReg;
  String? phoneNumber;
  int? userId;
  int? cityId;
  Null? location;
  Null? profileImg;
  int? id;
  String? name;
  Null? description;

  Seller(
      {this.comNo,
        this.taxNo,
        this.photoOfReg,
        this.phoneNumber,
        this.userId,
        this.cityId,
        this.location,
        this.profileImg,
        this.id,
        this.name,
        this.description});

  Seller.fromJson(Map<String, dynamic> json) {
    comNo = json['comNo'];
    taxNo = json['taxNo'];
    photoOfReg = json['photoOfReg'];
    phoneNumber = json['phoneNumber'];
    userId = json['userId'];
    cityId = json['cityId'];
    location = json['location'];
    profileImg = json['profileImg'];
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comNo'] = this.comNo;
    data['taxNo'] = this.taxNo;
    data['photoOfReg'] = this.photoOfReg;
    data['phoneNumber'] = this.phoneNumber;
    data['userId'] = this.userId;
    data['cityId'] = this.cityId;
    data['location'] = this.location;
    data['profileImg'] = this.profileImg;
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}