import 'Specialization.dart';
import 'City.dart';

class Doctor {
  Doctor({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.photo, 
      this.gender, 
      this.address, 
      this.description, 
      this.degree, 
      this.specialization, 
      this.city, 
      this.appointPrice, 
      this.startTime, 
      this.endTime,});

  Doctor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    gender = json['gender'];
    address = json['address'];
    description = json['description'];
    degree = json['degree'];
    specialization = json['specialization'] != null ? Specialization.fromJson(json['specialization']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    appointPrice = json['appoint_price'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }
  num? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  Specialization? specialization;
  City? city;
  num? appointPrice;
  String? startTime;
  String? endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['photo'] = photo;
    map['gender'] = gender;
    map['address'] = address;
    map['description'] = description;
    map['degree'] = degree;
    if (specialization != null) {
      map['specialization'] = specialization?.toJson();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    map['appoint_price'] = appointPrice;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    return map;
  }

}