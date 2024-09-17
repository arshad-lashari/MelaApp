class BookServiceApi {
  String? message;
  Booking? booking;

  BookServiceApi({this.message, this.booking});

  BookServiceApi.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    booking =
        json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.booking != null) {
      data['booking'] = this.booking!.toJson();
    }
    return data;
  }
}

class Booking {
  String? user;
  String? service;
  String? bookingDate;
  String? status;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Booking(
      {this.user,
      this.service,
      this.bookingDate,
      this.status,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Booking.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    service = json['service'];
    bookingDate = json['bookingDate'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['service'] = this.service;
    data['bookingDate'] = this.bookingDate;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}