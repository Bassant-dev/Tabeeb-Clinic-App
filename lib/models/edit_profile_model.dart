class EditProfileModel {
  final String message;
  final EditProfileDataModel editdatamodel;

  EditProfileModel({
    required this.message,
    required this.editdatamodel,
  });
  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
        message: json['message'],
        editdatamodel: EditProfileDataModel.fromJson(json['data']));
  }

}
class EditProfileDataModel {
  int id;
  String name;
  String email;
  int phone;
  String status;
  String userType;

  EditProfileDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.userType,
  });
  factory EditProfileDataModel.fromJson(Map<String, dynamic> json) {
    return EditProfileDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      userType: json['user_type'],


    );
  }
}
