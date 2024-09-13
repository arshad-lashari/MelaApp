  class SignupApis {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? city;
  String? zipCode;

  SignupApis(
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.city,
      this.zipCode});

  SignupApis.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    city = json['city'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zipCode'] = this.zipCode;
    return data;
  }
}