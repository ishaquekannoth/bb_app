class SignInResponseModel {
  SignInResponseModel({this.message, this.token, this.isSuccess});

  String? message;
  String? token;
  bool? isSuccess;
  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        isSuccess: json["created"]??false,
        message: json["message"] ?? "",
        token: json["jwt_key"] ?? "invalid",
      );
}
