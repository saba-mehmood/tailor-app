class OrdersListModel {
  List<Orders> orders;
  int totalAmount;
  int pending;
  int accepted;
  int completed;
  int canceled;

  OrdersListModel(
      {this.orders,
      this.totalAmount,
      this.pending,
      this.accepted,
      this.completed,
      this.canceled});

  OrdersListModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
    totalAmount = json['total_amount'];
    pending = json['pending'];
    accepted = json['accepted'];
    completed = json['completed'];
    canceled = json['canceled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    data['total_amount'] = this.totalAmount;
    data['pending'] = this.pending;
    data['accepted'] = this.accepted;
    data['completed'] = this.completed;
    data['canceled'] = this.canceled;
    return data;
  }
}

class Orders {
  int id;
  String orderNo;
  String deliveryDate;
  int stateId;
  int cityId;
  int areaId;
  String address;
  String fabricDeliveryMethod;
  int shippingCost;
  int total;
  int customerId;
  int tailorId;
  int deliveryBoyId;
  int status;
  int rating;
  String review;
  String reviewDate;
  String reason;
  String createdAt;
  String updatedAt;
  States states;
  City city;
  Area area;
  Tailor tailor;
  Customer customer;
  dynamic deliveryBoy;

  Orders(
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

  Orders.fromJson(Map<String, dynamic> json) {
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

class States {
  int id;
  String name;
  int countryId;
  Null abbrevation;
  String status;
  String createdAt;
  String updatedAt;

  States(
      {this.id,
      this.name,
      this.countryId,
      this.abbrevation,
      this.status,
      this.createdAt,
      this.updatedAt});

  States.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    abbrevation = json['abbrevation'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['abbrevation'] = this.abbrevation;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class City {
  int id;
  String name;
  int stateId;
  String status;
  String createdAt;
  String updatedAt;

  City(
      {this.id,
      this.name,
      this.stateId,
      this.status,
      this.createdAt,
      this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Area {
  int id;
  int cityId;
  String name;
  int status;
  String createdAt;
  String updatedAt;

  Area(
      {this.id,
      this.cityId,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Tailor {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  String description;
  String phone;
  int roleId;
  String image;
  int profileComplete;
  var ratings;
  Null day;
  Null month;
  Null year;
  Null currentTeamId;
  Null profilePhotoPath;
  String createdAt;
  String updatedAt;
  String profilePhotoUrl;

  Tailor(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.description,
      this.phone,
      this.roleId,
      this.image,
      this.profileComplete,
      this.ratings,
      this.day,
      this.month,
      this.year,
      this.currentTeamId,
      this.profilePhotoPath,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  Tailor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    description = json['description'];
    phone = json['phone'];
    roleId = json['role_id'];
    image = json['image'];
    profileComplete = json['profile_complete'];
    ratings = json['ratings'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['role_id'] = this.roleId;
    data['image'] = this.image;
    data['profile_complete'] = this.profileComplete;
    data['ratings'] = this.ratings;
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}

class Customer {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  Null description;
  String phone;
  int roleId;
  Null image;
  int profileComplete;
  double ratings;
  String day;
  String month;
  String year;
  Null currentTeamId;
  Null profilePhotoPath;
  String createdAt;
  String updatedAt;
  String profilePhotoUrl;

  Customer(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.description,
      this.phone,
      this.roleId,
      this.image,
      this.profileComplete,
      this.ratings,
      this.day,
      this.month,
      this.year,
      this.currentTeamId,
      this.profilePhotoPath,
      this.createdAt,
      this.updatedAt,
      this.profilePhotoUrl});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    description = json['description'];
    phone = json['phone'];
    roleId = json['role_id'];
    image = json['image'];
    profileComplete = json['profile_complete'];
    ratings = json['ratings'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['role_id'] = this.roleId;
    data['image'] = this.image;
    data['profile_complete'] = this.profileComplete;
    data['ratings'] = this.ratings;
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
