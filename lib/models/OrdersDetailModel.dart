
import 'AllOrdersModel.dart';

class OrderDetailModel  {
  int id;
  String orderNo;
  String deliveryDate;
  int stateId;
  int cityId;
  int areaId;
  String address;
  String fabricDeliveryMethod;
  Null shippingCost;
  int total;
  int customerId;
  int tailorId;
  Null deliveryBoyId;
  int status;
  int rating;
  String review;
  String reviewDate;
  Null reason;
  String createdAt;
  String updatedAt;
  States states;
  City city;
  Area area;
  Tailor tailor;
  Customer customer;
  Null deliveryBoy;

  OrderDetailModel(
      {this.id,
        this.orderNo,
        this.deliveryDate,
        this.stateId,
        this.cityId,
        this.areaId,
        this.address,
        this.fabricDeliveryMethod,
        this.shippingCost,
        this.total,
        this.customerId,
        this.tailorId,
        this.deliveryBoyId,
        this.status,
        this.rating,
        this.review,
        this.reviewDate,
        this.reason,
        this.createdAt,
        this.updatedAt,
        this.states,
        this.city,
        this.area,
        this.tailor,
        this.customer,
        this.deliveryBoy});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    deliveryDate = json['delivery_date'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    address = json['address'];
    fabricDeliveryMethod = json['fabric_delivery_method'];
    shippingCost = json['shipping_cost'];
    total = json['total'];
    customerId = json['customer_id'];
    tailorId = json['tailor_id'];
    deliveryBoyId = json['delivery_boy_id'];
    status = json['status'];
    rating = json['rating'];
    review = json['review'];
    reviewDate = json['review_date'];
    reason = json['reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    states =
    json['states'] != null ? new States.fromJson(json['states']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    tailor =
    json['tailor'] != null ? new Tailor.fromJson(json['tailor']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    deliveryBoy = json['delivery_boy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['delivery_date'] = this.deliveryDate;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['address'] = this.address;
    data['fabric_delivery_method'] = this.fabricDeliveryMethod;
    data['shipping_cost'] = this.shippingCost;
    data['total'] = this.total;
    data['customer_id'] = this.customerId;
    data['tailor_id'] = this.tailorId;
    data['delivery_boy_id'] = this.deliveryBoyId;
    data['status'] = this.status;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['review_date'] = this.reviewDate;
    data['reason'] = this.reason;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.states != null) {
      data['states'] = this.states.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    if (this.area != null) {
      data['area'] = this.area.toJson();
    }
    if (this.tailor != null) {
      data['tailor'] = this.tailor.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    data['delivery_boy'] = this.deliveryBoy;
    return data;
  }
}
