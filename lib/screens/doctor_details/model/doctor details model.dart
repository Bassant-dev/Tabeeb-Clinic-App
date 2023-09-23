class DoctorDetailsModel {
  final String message;
  final DoctorDataModel doctorDataModel;
  DoctorDetailsModel({
    required this.message,
    required this.doctorDataModel,
  });
  factory DoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsModel(
        message: json['message'],
        doctorDataModel: DoctorDataModel.fromJson(json['data']));
  }
}
class DoctorDataModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String description;
  final String start_time;
  final String end_time;

  DoctorDataModel(
      {required this.id,
        required this.start_time,
        required this.end_time,
      required this.name,
      required this.email,
      required this.phone,
      required this.photo,
      required this.description});
  factory DoctorDataModel.fromJson(Map<String, dynamic> json) {
    return DoctorDataModel(end_time: json['end_time'],
      start_time: json['start_time'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      description: json['description'],
    );
  }
}

