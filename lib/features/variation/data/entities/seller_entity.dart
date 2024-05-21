class SellerEntity {
  int? comNo;
  String? name;
  int? taxNo;
  String? profileImg;
  String? phoneNumber;
  int? id;
  int? cityId;

  SellerEntity(
      {this.comNo,
        this.name,
        this.taxNo,
        this.profileImg,
        this.phoneNumber,
        this.id,
        this.cityId});

  SellerEntity.fromJson(Map<String, dynamic> json) {
    comNo = json['comNo'];
    name = json['name'];
    taxNo = json['taxNo'];
    profileImg = json['profileImg'];
    phoneNumber = json['phoneNumber'];
    id = json['id'];
    cityId = json['cityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comNo'] = this.comNo;
    data['name'] = this.name;
    data['taxNo'] = this.taxNo;
    data['profileImg'] = this.profileImg;
    data['phoneNumber'] = this.phoneNumber;
    data['id'] = this.id;
    data['cityId'] = this.cityId;
    return data;
  }
}