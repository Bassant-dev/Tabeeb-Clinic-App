class Data {
  Data({
      this.id, 
      this.userCode, 
      this.name, 
      this.email, 
      this.phone, 
      this.status, 
      this.userType, 
      this.departmentId,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    userCode = json['user_code'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    userType = json['user_type'];
    departmentId = json['department_id'];
  }
  num? id;
  String? userCode;
  String? name;
  String? email;
  num? phone;
  String? status;
  String? userType;
  num? departmentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_code'] = userCode;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['status'] = status;
    map['user_type'] = userType;
    map['department_id'] = departmentId;
    return map;
  }

}