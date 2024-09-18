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
  String? category;
  String? pic;
  String? serviceName;
  String? speciality;
  int? price;
  String? description;
  bool? promoted;
  Null? currentPromotion;
  String? location;
  String? createdAt;
  String? updatedAt;
  int? iV;

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
      this.iV});

  Services.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    business = json['business'];
    category = json['category'];
    pic = json['pic'];
    serviceName = json['serviceName'];
    speciality = json['speciality'];
    price = json['price'];
    description = json['description'];
    promoted = json['promoted'];
    currentPromotion = json['currentPromotion'];
    location = json['location'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['business'] = this.business;
    data['category'] = this.category;
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
    return data;
  }
}