class GetBookedServices {
  String? message;
  List<Bookings>? bookings;

  GetBookedServices({this.message, this.bookings});

  GetBookedServices.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  String? sId;
  String? user;
  Business? business;
  Service? service;
  String? bookingDate;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Bookings(
      {this.sId,
      this.user,
      this.business,
      this.service,
      this.bookingDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Bookings.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
    bookingDate = json['bookingDate'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    data['bookingDate'] = this.bookingDate;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Business {
  String? sId;
  String? name;
  String? email;

  Business({this.sId, this.name, this.email});

  Business.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}

class Service {
  String? sId;
  Category? category;
  List<String>? speciality;
  int? price;
  String? description;

  Service(
      {this.sId, this.category, this.speciality, this.price, this.description});

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    speciality = json['speciality'].cast<String>();
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['speciality'] = this.speciality;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}

class Category {
  String? sId;
  String? name;

  Category({this.sId, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}