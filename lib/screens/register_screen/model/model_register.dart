class RegisterModel{
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;
  final String password_confirmation;

  RegisterModel({required this.email, required this.password,required this.phone,required this.gender,required this.name,required this.password_confirmation});
  factory  RegisterModel.fromJson(jsonData){
    return RegisterModel(
        email: jsonData['data']['email'],
        password: jsonData['data']['password'],
        password_confirmation: jsonData['data']['password_confirmation'],
        phone:jsonData['data']['phone'],
        gender:jsonData['data']['gender'],
        name:jsonData['data']['name']
    );

  }
}
class SingupModel{
  final String token;
  final String username;
  final String message;
  final bool status;
  final int code;
  SingupModel({required this.token, required this.username,required this.message,
    required this.status,required this.code});
  factory SingupModel.fromJson(jsonData){
    return SingupModel(
        token: jsonData['data']['token'],
        username: jsonData['data']['username'],
        message: jsonData["message"],
        status:jsonData['status'],
        code:jsonData['code']
    );

  }
}
