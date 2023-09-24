import 'Data.dart';

class SignUpModel {
  SignUpModel({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  SignUpModel.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
  String ?message;
  Data ?data;
  bool ?status;
  int ?code;


}