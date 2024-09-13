// Display category apis
class Categoryapis {
  String? message;
  List<Services>? services;

  Categoryapis({this.message, this.services});

  Categoryapis.fromJson(Map<String, dynamic> json) {
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
  String? speciality;
  int? price;
  String? description;
  bool? promoted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Services(
      {this.sId,
      this.business,
      this.category,
      this.pic,
      this.speciality,
      this.price,
      this.description,
      this.promoted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Services.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    business = json['business'];
    category = json['category'];
    pic = json['pic'];
    speciality = json['speciality'];
    price = json['price'];
    description = json['description'];
    promoted = json['promoted'];
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
    data['speciality'] = this.speciality;
    data['price'] = this.price;
    data['description'] = this.description;
    data['promoted'] = this.promoted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}