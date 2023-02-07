class LoginModel {
  final int? identitas;
  final String? password;

  LoginModel({required this.identitas, required this.password});

  Map<String, dynamic> toJson() {
    return {'identitas': identitas, 'password': password};
  }
}
