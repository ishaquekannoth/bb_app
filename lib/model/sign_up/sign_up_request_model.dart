class SignUpRequestModel {
  String name;
  String phone;
  String email;
  String password;
  SignUpRequestModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});

  Map<String, dynamic> toJson() {
    return {"name": name, "phone": phone, "email": email, "password": password};
  }
}
