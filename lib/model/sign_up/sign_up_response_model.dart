class SignUpResponseModel {
  String? message;
  String? token;
  bool? isSuccess;
  SignUpResponseModel({this.isSuccess, this.message, this.token});
  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        isSuccess: json["created"] ?? false,
        message: json["message"] ?? "",
        token: json["jwt_key"] ?? "invalid",
      );
}
