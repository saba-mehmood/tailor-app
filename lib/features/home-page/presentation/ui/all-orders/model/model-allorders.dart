class Order {
  int albumId;
  int id;
  String orderNo;
  String address;
  String thumbnailUrl;
  String description;

  Order({this.albumId, this.id, this.orderNo, this.address, this.thumbnailUrl,this.description});

  Order.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    orderNo = json['orderNo'];
    address = json['address'];
    thumbnailUrl = json['thumbnailUrl'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['orderNo'] = this.orderNo;
    data['address'] = this.address;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['description'] = this.description;
    return data;
  }
}
