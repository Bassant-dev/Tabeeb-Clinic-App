/// id : 212
/// name : "loza"
/// email : "lailaa@aa.com"
/// phone : "22200000"
/// gender : "0"
/// email_verified_at : null
/// created_at : "2023-09-27T08:22:51.000000Z"
/// updated_at : "2023-09-27T16:27:17.000000Z"

class Data {
  Data({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.gender, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
Data copyWith({  num? id,
  String? name,
  String? email,
  String? phone,
  String? gender,
  dynamic emailVerifiedAt,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  gender: gender ?? this.gender,
  emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}