import 'Data.dart';

/// message : "Updated Successfully"
/// data : {"id":212,"name":"loza","email":"lailaa@aa.com","phone":"22200000","gender":"0","email_verified_at":null,"created_at":"2023-09-27T08:22:51.000000Z","updated_at":"2023-09-27T16:27:17.000000Z"}
/// status : true
/// code : 200

class EditModel3 {
  EditModel3({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  EditModel3.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
  String? message;
  Data? data;
  bool? status;
  num? code;
EditModel3 copyWith({  String? message,
  Data? data,
  bool? status,
  num? code,
}) => EditModel3(  message: message ?? this.message,
  data: data ?? this.data,
  status: status ?? this.status,
  code: code ?? this.code,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['code'] = code;
    return map;
  }

}