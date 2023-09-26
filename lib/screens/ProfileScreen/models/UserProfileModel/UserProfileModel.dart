import 'Data.dart';

class UserProfileModel {
  UserProfileModel({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  UserProfileModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UserData.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }
  String? message;
  List<UserData>? data;
  bool? status;
  num? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['code'] = code;
    return map;
  }

}