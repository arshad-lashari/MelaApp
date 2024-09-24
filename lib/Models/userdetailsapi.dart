class UserDetailsapi {
  String? message;
  User? user;

  UserDetailsapi({this.message, this.user});

  UserDetailsapi.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? address;
  String? city;
  String? zipCode;
  String? pic;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.address,
      this.city,
      this.zipCode,
      this.pic,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address = json['address'];
    city = json['city'];
    zipCode = json['zipCode'];
    pic = json['pic'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zipCode'] = this.zipCode;
    data['pic'] = this.pic;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
