class categoriessmore {
  String? message;
  List<Services>? services;

  categoriessmore({this.message, this.services});

  categoriessmore.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? sId;
  String? business;
  Category? category;
  String? pic;
  String? serviceName;
  List<String>? speciality;
  int? price;
  String? description;
  bool? promoted;
  String? currentPromotion;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? averageRating;

  Services(
      {this.sId,
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
      this.averageRating});

  Services.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    business = json['business'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    pic = json['pic'];
    serviceName = json['serviceName'];
    speciality = json['speciality'].cast<String>();
    price = json['price'];
    description = json['description'];
    promoted = json['promoted'];
    currentPromotion = json['currentPromotion'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['business'] = this.business;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['pic'] = this.pic;
    data['serviceName'] = this.serviceName;
    data['speciality'] = this.speciality;
    data['price'] = this.price;
    data['description'] = this.description;
    data['promoted'] = this.promoted;
    data['currentPromotion'] = this.currentPromotion;
    data['location'] = this.location;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['averageRating'] = this.averageRating;
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