class ProductServiceDetailsApi {
  String? message;
  Service? service;
  List<dynamic>? reviews; // Use dynamic if you are not defining a Review class

  ProductServiceDetailsApi({this.message, this.service, this.reviews});

  ProductServiceDetailsApi.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    service = json['service'] != null ? Service.fromJson(json['service']) : null;
    if (json['reviews'] != null) {
      reviews = json['reviews']; // Assuming reviews are dynamic data
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    if (service != null) {
      data['service'] = service!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews; // Assuming reviews are dynamic data
    }
    return data;
  }
}

class Service {
  String? sId;
  String? business;
  String? category;
  String? pic;
  String? serviceName;
  List<String>? speciality;
  int? price;
  String? description;
  bool? promoted;
  dynamic currentPromotion; // Changed from Null to dynamic
  String? location;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Service({
    this.sId,
    this.business,
    this.category,
    this.pic,
    this.serviceName,
    this.speciality,
    this.price,
    this.description,
    this.promoted,
    this.currentPromotion,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Service.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    business = json['business'];
    category = json['category'];
    pic = json['pic'];
    serviceName = json['serviceName'];
    speciality = json['speciality']?.cast<String>();
    price = json['price'];
    description = json['description'];
    promoted = json['promoted'];
    currentPromotion = json['currentPromotion']; // Assuming this can be dynamic
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['business'] = business;
    data['category'] = category;
    data['pic'] = pic;
    data['serviceName'] = serviceName;
    data['speciality'] = speciality;
    data['price'] = price;
    data['description'] = description;
    data['promoted'] = promoted;
    data['currentPromotion'] = currentPromotion;
    data['location'] = location;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
