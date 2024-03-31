class CreateOrderResponse {
  bool? isSuccssed;
  String? message;


  CreateOrderResponse({this.isSuccssed, this.message,});

  CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['isSuccssed'];
    message = json['message'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccssed'] = this.isSuccssed;
    data['message'] = this.message;

    return data;
  }
}