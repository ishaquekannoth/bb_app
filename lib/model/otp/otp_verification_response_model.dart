class OTPverificationResponseModel {
  OTPverificationResponseModel({this.message, this.success, this.phone});
  String? message;
  bool? success;
  String? phone;
  factory OTPverificationResponseModel.fromJson(Map<String, dynamic> json) {
    return OTPverificationResponseModel(
        message: json['message'] ?? "",
        success: json['created'] ?? false,
        phone: json['phone'] ?? "");
  }
}
