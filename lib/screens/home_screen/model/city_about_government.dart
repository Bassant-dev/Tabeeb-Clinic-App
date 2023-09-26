class CityAboutGovernmentModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  CityAboutGovernmentModel({this.message, this.data, this.status, this.code});

  CityAboutGovernmentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Governrate? governrate;

  Data({this.id, this.name, this.governrate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    governrate = json['governrate'] != null
        ? new Governrate.fromJson(json['governrate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.governrate != null) {
      data['governrate'] = this.governrate!.toJson();
    }
    return data;
  }
}

class Governrate {
  int? id;
  String? name;

  Governrate({this.id, this.name});

  Governrate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}