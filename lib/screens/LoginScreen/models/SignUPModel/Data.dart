class Data {
  Data({
      this.token, 
      this.username,});

  Data.fromJson(dynamic json) {
    token = json['token'];
    username = json['username'];
  }
  String? token;
  String ?username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['username'] = username;
    return map;
  }

}